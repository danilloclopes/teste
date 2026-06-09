package br.com.agendamento.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.util.ConnectionFactory;


public class UsuarioDAO {

    public void salvar(Usuario usuario) throws Exception {
        
        String sql = "INSERT INTO usuario (nome, email, cpf, senha) VALUES (?, ?, ?, ?)";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getCpf());
            stmt.setString(4, usuario.getSenha());

            stmt.executeUpdate();
        }
    }

    public void atualizar(Usuario usuario) throws Exception {

        String sql = "UPDATE usuario SET nome = ?, email = ?, cpf = ?, senha = ? WHERE id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getCpf());
            stmt.setString(4, usuario.getSenha());
            stmt.setInt(5, usuario.getId());

            stmt.executeUpdate();
        }
    }


    public Usuario buscarPorEmail(String email) throws Exception {

        String sql = "SELECT * FROM usuario WHERE email = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                Usuario user = new Usuario();

                user.setId(rs.getInt("id"));
                user.setNome(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setCpf(rs.getString("cpf"));
                user.setSenha(rs.getString("senha"));

                return user;
            }
        }

        return null;
    }


    public Usuario buscarPorId(int id) throws Exception {

        String sql = "SELECT * FROM usuario WHERE id = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                Usuario user = new Usuario();

                user.setId(rs.getInt("id"));
                user.setNome(rs.getString("nome"));
                user.setEmail(rs.getString("email"));
                user.setCpf(rs.getString("cpf"));
                user.setSenha(rs.getString("senha"));

                return user;
            }
        }

        return null;
    }


    public boolean existeCpf(String cpf) throws Exception {

        String sql = "SELECT * FROM usuario WHERE cpf = ?";

        try (Connection conn = ConnectionFactory.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cpf);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        }
    }
}
