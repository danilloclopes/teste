package br.com.agendamento.model.service;

import br.com.agendamento.model.dao.UsuarioDAO;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.util.PasswordHash;
import br.com.agendamento.util.Validator;


public class AuthService {

    private UsuarioDAO usuarioDAO = new UsuarioDAO();

    
    public void cadastrar(Usuario usuario) throws Exception {

        if (usuario.getNome() == null || usuario.getNome().isEmpty()) {
            throw new Exception("Nome é um campo obrigatório.");
        }

        if (usuario.getEmail() == null || usuario.getEmail().isEmpty()) {
            throw new Exception("Email é um campo obrigatório.");
        }

        if (usuario.getSenha() == null || usuario.getSenha().isEmpty()) {
            throw new Exception("Senha é um campo obrigatória.");
        }

        if (!Validator.isCPFValido(usuario.getCpf())) {
            throw new Exception("O CPF digitado é inválido.");
        }

        if (usuarioDAO.existeCpf(usuario.getCpf())) {
            throw new Exception("O CPF digitado já pertence a alguém!");
        }

        String hashSenha = PasswordHash.criarHash(usuario.getSenha());
        usuario.setSenha(hashSenha);

        usuarioDAO.salvar(usuario);
    }


    public Usuario login(String email, String senha) throws Exception {

        Usuario usuario = usuarioDAO.buscarPorEmail(email);

        if (usuario == null) {
            throw new Exception("Usuário não encontrado.");
        }

        boolean senhaValida = PasswordHash.checarSenha(senha, usuario.getSenha());

        if (!senhaValida) {
            throw new Exception("A senha digitada é inválida.");
        }

        return usuario;
    }

}
