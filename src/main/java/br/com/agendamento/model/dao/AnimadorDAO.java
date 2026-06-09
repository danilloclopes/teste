package br.com.agendamento.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.model.entity.Personagem;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.util.ConnectionFactory;


public class AnimadorDAO {

    public void salvar(Animador animador) throws Exception {
        String sql = "INSERT INTO animador (usuario_id, personagem_id) VALUES (?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, animador.getUsuario().getId());
            stmt.setInt(2, animador.getPersonagem().getId());

            stmt.executeUpdate();
        }
    }

    public boolean pesquisar(int usuarioId, int personagemId) throws Exception {
        String sql = "SELECT * FROM animador WHERE usuario_id = ? AND personagem_id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            stmt.setInt(2, personagemId);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }

    public List<Animador> listarTodos() throws Exception {
        List<Animador> animadores = new ArrayList<>();

        String sql =
                "SELECT an.id AS animador_id, " +
                "u.id AS usuario_id, u.nome AS usuario_nome, " +
                "p.id AS personagem_id, p.nome AS personagem_nome " +
                "FROM animador an " +
                "INNER JOIN usuario u  ON an.usuario_id  = u.id " +
                "INNER JOIN personagem p ON an.personagem_id = p.id " +
                "ORDER BY p.nome";

        try (Connection conn = ConnectionFactory.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs   = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNome(rs.getString("usuario_nome"));

                Personagem personagem = new Personagem();
                personagem.setId(rs.getInt("personagem_id"));
                personagem.setNome(rs.getString("personagem_nome"));

                Animador animador = new Animador();
                animador.setId(rs.getInt("animador_id"));
                animador.setUsuario(usuario);
                animador.setPersonagem(personagem);

                animadores.add(animador);
            }
        }

        return animadores;
    }
}
