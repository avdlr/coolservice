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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.json.JSONObject;

/**
 * Persists data from the air conditioning maintenance form to a MySQL table.
 */
@SuppressWarnings("serial")
@WebServlet("/maintenance-form/save")
@MultipartConfig
public class MaintenanceDataServlet extends HttpServlet {

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

        if (ordenServicio == null || ordenServicio.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ordenServicio");
            return;
        }

        json.remove("ordenServicio");

        try (Connection conn = dataSource.getConnection()) {
            // Verify if data for this orden_servicio already exists
            boolean exists;
            try (PreparedStatement check = conn.prepareStatement(
                    "SELECT 1 FROM airecondicionado_data WHERE orden_servicio = ?")) {
                check.setString(1, ordenServicio);
                try (ResultSet rs = check.executeQuery()) {
                    exists = rs.next();
                }
            }

            if (exists) {
                // Update existing record
                try (PreparedStatement update = conn.prepareStatement(
                        "UPDATE airecondicionado_data SET data = ? WHERE orden_servicio = ?")) {
                    update.setString(1, json.toString());
                    update.setString(2, ordenServicio);
                    update.executeUpdate();
                }
            } else {
                // Insert new record
                try (PreparedStatement insert = conn.prepareStatement(
                        "INSERT INTO airecondicionado_data (orden_servicio, data) VALUES (?, ?)")) {
                    insert.setString(1, ordenServicio);
                    insert.setString(2, json.toString());
                    insert.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Unable to save maintenance data", e);
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
                        "SELECT data FROM airecondicionado_data WHERE orden_servicio = ?")) {
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
            throw new ServletException("Unable to load maintenance data", e);
        }
    }
}
