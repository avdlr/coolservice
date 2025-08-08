package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
        Map<String, String[]> params = request.getParameterMap();
        JSONObject json = new JSONObject();
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

        String ordenServicio = request.getParameter("ordenServicio");

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
}
