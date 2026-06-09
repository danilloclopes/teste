package br.com.agendamento.model.service;

import br.com.agendamento.model.dao.UsuarioDAO;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.util.PasswordHash;

public class UsuarioService {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    // A redundância da chamada de buscarPorId se dá pois o objetivo desse
    // método no Service é modularizar as chamadas dos DAOs na camada de serviços
    public Usuario buscarPorId(int id) throws Exception {
        return usuarioDAO.buscarPorId(id);
    }

    
    public void atualizar(Usuario usuario, String novaSenha) throws Exception {

        // As regras de negócio ficam armazenadas no serviço
        if (usuario.getNome() == null || usuario.getNome().isEmpty()) {
            throw new Exception("Ter um nome é obrigatório.");
        }

        if (usuario.getEmail() == null || usuario.getEmail().isEmpty()) {
            throw new Exception("Ter um email é obrigatório.");
        }

        if (usuario.getSenha() == null || usuario.getSenha().isEmpty()) {
            throw new Exception("Ter uma senha é obrigatório.");
        }

        if (novaSenha != null && !novaSenha.isBlank()) {
            usuario.setSenha(PasswordHash.criarHash(novaSenha));
        } else {
            Usuario existente = usuarioDAO.buscarPorId(usuario.getId());
            usuario.setSenha(existente.getSenha());
        }

        usuarioDAO.atualizar(usuario);
    }
}