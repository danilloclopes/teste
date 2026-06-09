package br.com.agendamento.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

import br.com.agendamento.model.enums.StatusAgendamento;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Agendamento {

    private int id;
    private Usuario cliente;
    private Animador animador;
    private LocalDateTime dataHora;
    private StatusAgendamento status;

}
