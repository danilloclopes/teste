package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.UsuarioService;
import br.com.agendamento.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/api/usuarios/*")
public class UsuarioServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if ("/perfil".equals(path)) {
            Usuario usuarioLogado = getUsuarioLogado(request);
            if (usuarioLogado == null) {
                JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Não autorizado");
                return;
            }
            try {
                Usuario atualizado = usuarioService.buscarPorId(usuarioLogado.getId());
                request.getSession().setAttribute("usuarioLogado", atualizado);
                JsonUtil.sendOk(response, Map.of(
                        "id",    atualizado.getId(),
                        "nome",  atualizado.getNome(),
                        "email", atualizado.getEmail(),
                        "cpf",   atualizado.getCpf()
                ));
            } catch (Exception e) {
                JsonUtil.sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            }
        } else {
            JsonUtil.sendError(response, HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if ("/perfil".equals(path)) {
            Usuario usuarioLogado = getUsuarioLogado(request);
            if (usuarioLogado == null) {
                JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Não autorizado");
                return;
            }
            try {
                Map<?, ?> body     = JsonUtil.parse(request, Map.class);
                String    novaSenha = (String) body.get("senha");

                usuarioLogado.setNome((String)  body.get("nome"));
                usuarioLogado.setEmail((String) body.get("email"));

                usuarioService.atualizar(usuarioLogado, novaSenha);
                request.getSession().setAttribute("usuarioLogado", usuarioLogado);

                JsonUtil.sendOk(response, Map.of("message", "Perfil atualizado com sucesso"));
            } catch (Exception e) {
                JsonUtil.sendError(response, HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
            }
        } else {
            JsonUtil.sendError(response, HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
        }
    }

    private Usuario getUsuarioLogado(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null ? (Usuario) session.getAttribute("usuarioLogado") : null;
    }
}
