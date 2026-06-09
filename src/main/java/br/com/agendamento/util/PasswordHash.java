package br.com.agendamento.util;

import java.security.MessageDigest;

public class PasswordHash {

    public static String criarHash(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = md.digest(password.getBytes("UTF-8"));

            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();

        } catch (Exception e) {
            throw new RuntimeException("Erro ao gerar hash da senha", e);
        }
    }

    public static boolean checarSenha(String rawPassword, String hashedPassword) {
        return criarHash(rawPassword).equals(hashedPassword);
    }
}