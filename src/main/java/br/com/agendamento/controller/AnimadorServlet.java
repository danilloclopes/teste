package br.com.agendamento.controller;

import br.com.agendamento.model.dao.AnimadorDAO;
import br.com.agendamento.util.JsonUtil;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/animadores")
public class AnimadorServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final AnimadorDAO animadorDAO = new AnimadorDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            JsonUtil.sendOk(response, animadorDAO.listarTodos());
        } catch (Exception e) {
            JsonUtil.sendError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
        }
    }
}
