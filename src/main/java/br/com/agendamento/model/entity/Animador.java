package br.com.agendamento.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Animador {

    private int id;
    private Usuario usuario;
    private Personagem personagem;

}
