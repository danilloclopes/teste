package br.com.agendamento.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class JsonUtil {

    private static final ObjectMapper MAPPER = new ObjectMapper()
            .registerModule(new JavaTimeModule())
            .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

    public static void send(HttpServletResponse response, int status, Object body) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        MAPPER.writeValue(response.getWriter(), body);
    }

    public static void sendError(HttpServletResponse response, int status, String message) throws IOException {
        send(response, status, Map.of("error", message));
    }

    public static void sendOk(HttpServletResponse response, Object body) throws IOException {
        send(response, HttpServletResponse.SC_OK, body);
    }

    public static <T> T parse(HttpServletRequest request, Class<T> type) throws IOException {
        return MAPPER.readValue(request.getInputStream(), type);
    }

    private JsonUtil() {}
}
