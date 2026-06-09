package br.com.agendamento.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.model.entity.Personagem;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.enums.StatusAgendamento;
import br.com.agendamento.util.ConnectionFactory;


public class AgendamentoDAO {

    public void salvar(Agendamento agendamento) throws Exception {
        String sql = "INSERT INTO agendamento (cliente_id, animador_id, data_hora, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, agendamento.getCliente().getId());
            stmt.setInt(2, agendamento.getAnimador().getId());
            stmt.setTimestamp(3, Timestamp.valueOf(agendamento.getDataHora()));
            stmt.setString(4, agendamento.getStatus().name());

            stmt.executeUpdate();
        }
    }


    public boolean verificarConflito(int animadorId, Timestamp dataHora) throws Exception {
        String sql = "SELECT 1 FROM agendamento WHERE animador_id = ? AND data_hora = ? AND status IN ('PENDENTE', 'CONTRATADO')";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, animadorId);
            stmt.setTimestamp(2, dataHora);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }

    public List<Agendamento> listarPorCliente(int clienteId)
        throws Exception {

        List<Agendamento> agendamentos = new ArrayList<>();

        String sql =
                "SELECT " +
                "a.id AS agendamento_id, " +
                "a.data_hora, " +
                "a.status, " +

                "u.id AS cliente_id, " +
                "u.nome AS cliente_nome, " +
                "u.email AS cliente_email, " +
                "u.cpf AS cliente_cpf, " +

                "ua.id AS animador_usuario_id, " +
                "ua.nome AS animador_nome, " +

                "p.id AS personagem_id, " +
                "p.nome AS personagem_nome, " +

                "an.id AS animador_id " +

                "FROM agendamento a " +

                "INNER JOIN usuario u " +
                "ON a.cliente_id = u.id " +

                "INNER JOIN animador an " +
                "ON a.animador_id = an.id " +

                "INNER JOIN usuario ua " +
                "ON an.usuario_id = ua.id " +

                "INNER JOIN personagem p " +
                "ON an.personagem_id = p.id " +

                "WHERE a.cliente_id = ? " +

                "ORDER BY a.data_hora DESC";

        try (
                Connection conn = ConnectionFactory.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)
        ) {

            stmt.setInt(1, clienteId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Usuario cliente = new Usuario();

                cliente.setId(
                        rs.getInt("cliente_id")
                );
                cliente.setNome(
                        rs.getString("cliente_nome")
                );
                cliente.setEmail(
                        rs.getString("cliente_email")
                );
                cliente.setCpf(
                        rs.getString("cliente_cpf")
                );

                Usuario usuarioAnimador = new Usuario();
                usuarioAnimador.setId(
                        rs.getInt("animador_usuario_id")
                );
                usuarioAnimador.setNome(
                        rs.getString("animador_nome")
                );

                Personagem personagem = new Personagem();
                personagem.setId(
                        rs.getInt("personagem_id")
                );
                personagem.setNome(
                        rs.getString("personagem_nome")
                );

                Animador animador = new Animador();
                animador.setId(
                        rs.getInt("animador_id")
                );
                animador.setUsuario(
                        usuarioAnimador
                );
                animador.setPersonagem(
                        personagem
                );

                Agendamento agendamento = new Agendamento();
                agendamento.setId(
                        rs.getInt("agendamento_id")
                );
                agendamento.setCliente(
                        cliente
                );
                agendamento.setAnimador(
                        animador
                );
                agendamento.setDataHora(
                        rs.getTimestamp("data_hora").toLocalDateTime()
                );
                agendamento.setStatus(StatusAgendamento.valueOf(rs.getString("status")));
                agendamentos.add(
                        agendamento
                );
            }
        }

        return agendamentos;
    }
}
