package zntservlet;

import zntclases.Activity;
import zntclases.Section;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/maintenance-form")
public class MaintenanceFormServlet extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<Section> sections = new ArrayList();
      sections.add(new Section("ducteria", "DUCTERÍA INTERNA Y EXTERNA", Arrays.asList(new Activity("Estado general de sellos"), new Activity("Aparicion de manchas de humedad de plafones"), new Activity("Daños o dobleces en ductos"), new Activity("Revision de estado de aislamiento de ductos"), new Activity("Revision de limpieza y fijacion de rejillas"))));
      sections.add(new Section("varios", "VARIOS", Arrays.asList(new Activity("Revision de limpieza y estado de drenaje P.V.C. de condensados"), new Activity("Revision y colocacion de tornillera en todas las tapas"), new Activity("Revision de limpieza exterior del equipo (laminaciones)"))));
      sections.add(new Section("evaporadores", "EVAPORADORES", Arrays.asList(new Activity("Revisar si tiene filtros, portafiltros y evaluacion del estado general"), new Activity("Revision de limpieza en serpentin"), new Activity("Revision de la charola de condensados del evaporador"), new Activity("Revision de motores, bandas y chumaceras"))));
      sections.add(new Section("condensador", "CONDENSADOR", Arrays.asList(new Activity("Revision de limpieza en serpentin"), new Activity("Revision de laminillas del condensador"), new Activity("Revision de la vibracion en motores y compresores"), new Activity("Evaluacion del estado de conexiones electricas"), new Activity("Verificar carga adecuada de refrigerante"))));
      sections.add(new Section("tablero", "TABLERO ELÉCTRICO", Arrays.asList(new Activity("Revision de conexiones electricas"), new Activity("Verificar platinos de contactores"))));
      request.setAttribute("sections", sections);
      request.getRequestDispatcher("/MaintenanceForm.jsp").forward(request, response);
   }
}
