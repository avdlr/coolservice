package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.json.JSONArray;
import org.json.JSONObject;

public class GestionTareasReabrirIncidencia {

           public JSONArray reanudarTarea(String idorden, String estatus) {
                      Conexion conexion = Conexion.instance();
                      JSONArray registros = new JSONArray();
                      JSONObject registro = new JSONObject();

                      if (idorden == null || idorden.trim().isEmpty()) {
                         registro.put("resp", "ERROR");
                         registro.put("mensaje", "Identificador de orden no proporcionado.");
                         registros.put(registro);
                         return registros;
                      }

                      String idOrdenNumerico;

                      try {
                         idOrdenNumerico = idorden;
                      } catch (NumberFormatException ex) {
                         registro.put("resp", "ERROR");
                         registro.put("mensaje", "Identificador de orden invalido.");
                         registros.put(registro);
                         return registros;
                      }

                      final String nuevoEstatus = "2";

                      try (Connection conn = conexion.getConnection();
                           PreparedStatement pst = conn != null
                              ? conn.prepareStatement("update csorden set IdEstatusOrden=?, ContadorReabierto = COALESCE(ContadorReabierto, 0) + 1 where FolioOrden=?")
                              : null) {

                         if (conn == null) {
                            registro.put("resp", "ERROR");
                            registro.put("mensaje", "No fue posible obtener la conexion a base de datos.");
                         } else {
                            pst.setString(1, nuevoEstatus);
                            pst.setString(2, idOrdenNumerico);
                            int resultado = pst.executeUpdate();
                            if (resultado == 1) {
                               registro.put("resp", "OK");
                            } else {
                               registro.put("resp", "ERROR");
                               registro.put("mensaje", "No se encontro la orden especificada.");
                            }
                         }
                      } catch (SQLException ex) {
                         registro.put("resp", "ERROR");
                         registro.put("mensaje", ex.getMessage() != null ? ex.getMessage() : "Error al actualizar la orden.");
                      }

                      registros.put(registro);
                      return registros;
                   }

}
