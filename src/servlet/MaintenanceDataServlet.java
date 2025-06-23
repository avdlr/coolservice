package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 * Persists data from the air conditioning maintenance form to a JSON file.
 */
@SuppressWarnings("serial")
@WebServlet("/maintenance-form/save")
public class MaintenanceDataServlet extends HttpServlet {
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

        ServletContext ctx = getServletContext();
        String dirPath = ctx.getRealPath("/WEB-INF/data/maintenance");
        File dir = new File(dirPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File file = new File(dir, System.currentTimeMillis() + ".json");
        try (Writer writer = new OutputStreamWriter(new FileOutputStream(file), "UTF-8")) {
            writer.write(json.toString(2));
        }
        response.setContentType("text/plain");
        response.getWriter().write("OK");
    }
}
