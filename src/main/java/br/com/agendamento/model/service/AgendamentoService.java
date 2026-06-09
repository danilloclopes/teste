package br.com.agendamento.model.service;


import java.sql.Timestamp;
import java.util.List;

import br.com.agendamento.model.dao.AgendamentoDAO;
import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.model.enums.StatusAgendamento;

public class AgendamentoService {

    private AgendamentoDAO agendamentoDAO = new AgendamentoDAO();

    public void criarAgendamento(Agendamento agendamento) throws Exception {

        boolean conflito = agendamentoDAO.verificarConflito(
                agendamento.getAnimador().getId(),
                Timestamp.valueOf(agendamento.getDataHora())
        );

        if (conflito) {
            throw new Exception("O animador já está ocupado no horário requisitado.");
        }

        agendamento.setStatus(StatusAgendamento.PENDENTE);
        agendamentoDAO.salvar(agendamento);
    }

    public List<Agendamento> listarAgendamentosCliente(int clienteId)
        throws Exception {

        if (clienteId <= 0) {
            throw new IllegalArgumentException("ID do cliente inválido.");
        }

        return agendamentoDAO.listarPorCliente(clienteId);
    }
}