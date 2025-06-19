package zntservlet;

import zntclases.Activity;
import zntclases.Section;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet that prepares checklist data for the refrigeration maintenance form.
 */
@WebServlet("/refrigeracion-form")
public class RefrigeracionFormServlet extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<Section> sections = new ArrayList<>();
      sections.add(new Section("puerta", "PUERTA DE ACCESO A CAMARAS", Arrays.asList(
         new Activity("Estado general de empaques de puertas acceso a las camaras."),
         new Activity("Estado de hule de arrastre (FALDÓN)."),
         new Activity("Condiciones de herrajes (cerrojos, bisagras, picaportes)."),
         new Activity("Revision de operación de resistencia de marco de puerta."))));
      sections.add(new Section("camaras", "CAMARAS", Arrays.asList(
         new Activity("Revisón de los sellos en las molduras"),
         new Activity("Verificación del estado de la cortina de PVC"),
         new Activity("Revision del funcionamiento de iluminacion interior"),
         new Activity("Revision del estado de los termómetros"))));
      sections.add(new Section("reachin", "REACH-IN", Arrays.asList(
         new Activity("Estado general de empaques en puertas (numero)"),
         new Activity("Revisar funcionamiento de lamparas (100% encendidas)"),
         new Activity("Funcionamiento de torque master"),
         new Activity("Revisar resistencia de marco reach-in (apuntar lecturas)"))));
      sections.add(new Section("evaporadores", "EVAPORADORES", Arrays.asList(
         new Activity("Revision de estado de base para motor y protector"),
         new Activity("Revision de limpieza en serpentin"),
         new Activity("Revision de la charola de condensados del evaporador"),
         new Activity("Revision del drenaje de condensados del evaporador"),
         new Activity("Limpieza de guardas y aspas"),
         new Activity("Revision de las laminillas del evaporador"),
         new Activity("Verificar funcionamiento de VTE y aislamiento del bulbo"),
         new Activity("Revision de la operación de motores"),
         new Activity("Revision de resistencia de deshielo"))));
      sections.add(new Section("condensador", "CONDENSADOR", Arrays.asList(
         new Activity("Revision de limpieza en serpentin"),
         new Activity("Revision de laminillas del condensador"),
         new Activity("Revision de la vibracion en motores y compresores"),
         new Activity("Verificar carga adecuada de refrigerante"),
         new Activity("Calibracion de control de presion"),
         new Activity("Revision del tiempo de deshielo"),
         new Activity("Flujo adecuado de ventilacion a travez del serpentin"))));
      sections.add(new Section("tablero", "TABLERO ELÉCTRICO", Arrays.asList(
         new Activity("Revision de conexiones electricas"),
         new Activity("Revision del estado de los interruptores"),
         new Activity("Verificar platino de contactores"))));
      request.setAttribute("sections", sections);
      request.getRequestDispatcher("/MaintenanceFormRefrigeracion.jsp").forward(request, response);
   }
}
