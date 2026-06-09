package br.com.agendamento.controller;

import br.com.agendamento.model.entity.Agendamento;
import br.com.agendamento.model.entity.Animador;
import br.com.agendamento.model.entity.Usuario;
import br.com.agendamento.model.service.AgendamentoService;
import br.com.agendamento.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@WebServlet("/api/agendamentos")
public class AgendamentoServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final AgendamentoService agendamentoService = new AgendamentoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario usuarioLogado = getUsuarioLogado(request);
        if (usuarioLogado == null) {
            JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Não autorizado");
            return;
        }

        try {
            List<Agendamento> agendamentos = agendamentoService.listarAgendamentosCliente(usuarioLogado.getId());
            JsonUtil.sendOk(response, agendamentos);
        } catch (Exception e) {
            JsonUtil.sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario usuarioLogado = getUsuarioLogado(request);
        if (usuarioLogado == null) {
            JsonUtil.sendError(response, HttpServletResponse.SC_UNAUTHORIZED, "Não autorizado");
            return;
        }

        try {
            Map<?, ?> body      = JsonUtil.parse(request, Map.class);
            int       animadorId = ((Number) body.get("animadorId")).intValue();
            String    dataHoraStr = (String) body.get("dataHora");
            LocalDateTime dataHora = LocalDateTime.parse(dataHoraStr);

            Animador animador = new Animador();
            animador.setId(animadorId);

            Agendamento agendamento = new Agendamento();
            agendamento.setCliente(usuarioLogado);
            agendamento.setAnimador(animador);
            agendamento.setDataHora(dataHora);

            agendamentoService.criarAgendamento(agendamento);

            JsonUtil.send(response, HttpServletResponse.SC_CREATED,
                    Map.of("message", "Agendamento criado com sucesso"));
        } catch (Exception e) {
            JsonUtil.sendError(response, HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    private Usuario getUsuarioLogado(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null ? (Usuario) session.getAttribute("usuarioLogado") : null;
    }
}
