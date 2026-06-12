package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AuthService;
import br.com.agendamento.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/api/auth/*")
public class AuthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if ("/me".equals(path)) {
            HttpSession session = request.getSession(false);
            Usuario usuarioLogado = session != null ? (Usuario) session.getAttribute("usuarioLogado") : null;

            if (usuarioLogado == null) {
                JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Não autenticado");
                return;
            }

            JsonUtil.sendOk(response, Map.of(
                    "id", usuarioLogado.getId(),
                    "nome", usuarioLogado.getNome(),
                    "email", usuarioLogado.getEmail()));
        } else {
            JsonUtil.sendError(response, HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if ("/login".equals(path)) {
            handleLogin(request, response);
        } else if ("/cadastro".equals(path)) {
            handleCadastro(request, response);
        } else if ("/logout".equals(path)) {
            handleLogout(request, response);
        } else {
            JsonUtil.sendError(response, HttpServletResponse.SC_NOT_FOUND, "Rota não encontrada");
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Map<?, ?> body = JsonUtil.parse(request, Map.class);
            String email = (String) body.get("email");
            String senha = (String) body.get("senha");

            Usuario usuario = authService.login(email, senha);

            HttpSession session = request.getSession(true);
            session.setAttribute("usuarioLogado", usuario);

            JsonUtil.sendOk(response, Map.of(
                    "id", usuario.getId(),
                    "nome", usuario.getNome(),
                    "email", usuario.getEmail()));
        } catch (Exception e) {
            JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, e.getMessage());
        }
    }

    private void handleCadastro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Map<?, ?> body = JsonUtil.parse(request, Map.class);

            Usuario usuario = new Usuario();
            usuario.setNome((String) body.get("nome"));
            usuario.setEmail((String) body.get("email"));
            usuario.setSenha((String) body.get("senha"));
            String cpf = (String) body.get("cpf");
            usuario.setCpf(cpf != null ? cpf.replaceAll("\\D", "") : "");

            authService.cadastrar(usuario);

            JsonUtil.send(response, HttpServletResponse.SC_CREATED,
                    Map.of("message", "Conta criada com sucesso"));
        } catch (Exception e) {
            JsonUtil.sendError(response, HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null)
            session.invalidate();

        Cookie cookie = new Cookie("JSESSIONID", "");
        String path = request.getContextPath();
        cookie.setPath(path.isEmpty() ? "/" : path);
        cookie.setMaxAge(0);
        cookie.setHttpOnly(true);
        response.addCookie(cookie);

        JsonUtil.sendOk(response, Map.of("message", "Logout realizado"));
    }
}
