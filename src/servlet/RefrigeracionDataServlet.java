package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.json.JSONObject;

/**
 * Persists data from the refrigeration maintenance form to a MySQL table.
 */
@SuppressWarnings("serial")
@WebServlet("/refrigeracion-form/save")
public class RefrigeracionDataServlet extends HttpServlet {

    @Resource(name = "jdbc/coolService")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String contentType = request.getContentType();
        JSONObject json = new JSONObject();
        String ordenServicio = null;

        if (contentType != null && contentType.contains("application/json")) {
            StringBuilder body = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    body.append(line);
                }
            }
            json = new JSONObject(body.toString());
            ordenServicio = json.optString("ordenServicio", null);
        } else {
            Map<String, String[]> params = request.getParameterMap();
            for (Map.Entry<String, String[]> entry : params.entrySet()) {
                String[] value = entry.getValue();
                if (value != null) {
                    if (value.length == 1) {
                        json.put(entry.getKey(), value[0]);
                    } else {
                        json.put(entry.getKey(), value);
                    }
                }
            }
            ordenServicio = request.getParameter("ordenServicio");
        }

        json.remove("ordenServicio");

        try (Connection conn = dataSource.getConnection();
                PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO refrigeracion_data (orden_servicio, data) VALUES (?, ?)")) {
            stmt.setString(1, ordenServicio);
            stmt.setString(2, json.toString());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException("Unable to save refrigeration data", e);
        }

        response.setContentType("text/plain");
        response.getWriter().write("OK");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ordenServicio = request.getParameter("ordenServicio");
        if (ordenServicio == null || ordenServicio.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ordenServicio");
            return;
        }

        try (Connection conn = dataSource.getConnection();
                PreparedStatement stmt = conn.prepareStatement(
                        "SELECT data FROM refrigeracion_data WHERE orden_servicio = ?")) {
            stmt.setString(1, ordenServicio);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String data = rs.getString("data");
                    response.setContentType("application/json");
                    response.getWriter().write(data);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Unable to load refrigeration data", e);
        }
    }
}
