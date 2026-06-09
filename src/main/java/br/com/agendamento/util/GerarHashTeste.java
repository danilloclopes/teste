package br.com.agendamento.util;

// Classe para fins de debug caso os hashs se alterem ao mudar a máquina em que testamos o sistema
public class GerarHashTeste {
    public static void main(String[] args) throws Exception {
        String senha = "123";
        String hash = PasswordHash.criarHash(senha);
        System.out.println("feito: " + hash);
    }
}