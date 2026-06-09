package br.com.agendamento.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req  = (HttpServletRequest)  request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String origin = System.getenv("FRONTEND_ORIGIN");
        if (origin == null || origin.isBlank()) origin = "http://localhost:5173";

        resp.setHeader("Access-Control-Allow-Origin",      origin);
        resp.setHeader("Access-Control-Allow-Credentials", "true");
        resp.setHeader("Access-Control-Allow-Methods",     "GET, POST, PUT, DELETE, OPTIONS");
        resp.setHeader("Access-Control-Allow-Headers",     "Content-Type");
        resp.setHeader("Access-Control-Max-Age",           "3600");

        if ("OPTIONS".equalsIgnoreCase(req.getMethod())) {
            resp.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        String uri     = req.getRequestURI();
        String context = req.getContextPath();

        HttpSession session = req.getSession(false);
        boolean     logado  = session != null && session.getAttribute("usuarioLogado") != null;

        boolean isApiRequest = uri.startsWith(context + "/api/");

        if (isApiRequest) {
            boolean isPublicEndpoint =
                    uri.equals(context + "/api/auth/login")    ||
                    uri.equals(context + "/api/auth/cadastro") ||
                    uri.startsWith(context + "/api/health");

            if (!logado && !isPublicEndpoint) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write("{\"error\":\"N\\u00e3o autorizado\"}");
                return;
            }

            chain.doFilter(request, response);
            return;
        }

        chain.doFilter(request, response);
    }
}
