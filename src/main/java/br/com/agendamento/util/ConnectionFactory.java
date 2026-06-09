package br.com.agendamento.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

public class ConnectionFactory {

    private static String URL;
    private static String USER;
    private static String PASSWORD;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String envUrl  = System.getenv("DB_URL");
            String envUser = System.getenv("DB_USER");
            String envPass = System.getenv("DB_PASSWORD");

            if (envUrl != null && envUser != null && envPass != null) {
                URL      = envUrl;
                USER     = envUser;
                PASSWORD = envPass;
            } else {
                Properties props = new Properties();
                InputStream input = ConnectionFactory.class
                        .getClassLoader()
                        .getResourceAsStream("db.properties");

                if (input == null) throw new RuntimeException("Arquivo db.properties não encontrado!");

                props.load(input);
                URL      = props.getProperty("db.url");
                USER     = props.getProperty("db.user");
                PASSWORD = props.getProperty("db.password");
            }
        } catch (Exception e) {
            throw new RuntimeException("Erro ao carregar configurações do banco.", e);
        }
    }

    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
