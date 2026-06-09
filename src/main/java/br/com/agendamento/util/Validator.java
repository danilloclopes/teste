package br.com.agendamento.util;

public class Validator {

    /* A validação de CPF confere apenas o formato para fins de
    aproximar os dados inseridos no sistema à realidade.
    Qualquer combinação de 11 dígitos ainda é válida. */
    
    public static boolean isCPFValido(String cpf) {

        if (cpf == null) return false;

        cpf = cpf.replaceAll("\\D", "");

        if (cpf.length() != 11) return false;

        return true;

    }

}