package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

public class GestionTareasReabrirIncidencia {

	   public JSONArray reanudarTarea(String idorden, String estatus) {
		      //String tecnico = this.consultaUltimoTecnico(idorden);
		      Conexion conexion = Conexion.instance();
		      Connection conn = null;
		      ResultSet rs = null;
		      int resultado = 0;
		      PreparedStatement pst = null;
		      JSONObject registro = null;
		      JSONArray registros = null;
		      new StringBuffer();

		      try {
		         conn = conexion.getConnection();
		         if (conn != null) {
		            StringBuffer query = new StringBuffer("update csorden set IdEstatusOrden=? where idCSOrden=?");
		            System.out.println("-----------antes de prepare");
		            pst = conn.prepareStatement(query.toString());
		            System.out.println("-----------despues de prepare");
		            int cont = 0;
		            cont = cont + 1;
		            pst.setString(cont, estatus);
		            ++cont;
		            pst.setInt(cont, Integer.parseInt(idorden));
		            resultado = pst.executeUpdate();
		            registros = new JSONArray();
		            registro = new JSONObject();
		            registro.put("resp", "ERROR");
		            System.out.println("respuesta:" + resultado);
		            /*if (resultado == 1) {
		               this.insertaMotivo(idorden, usuario, "", estatusanterior, estatus, idaccion, tecnico, tecnico);
		               registro.put("resp", "OK");
		            }*/

		            registros.put(registro);
		         }
		      } catch (Exception var32) {
		         var32.printStackTrace();
		      } finally {
		         try {
		            if (rs != null) {
		               ((ResultSet)rs).close();
		               rs = null;
		            }
		         } catch (SQLException var31) {
		            rs = null;
		         }

		         try {
		            if (pst != null) {
		               pst.close();
		               pst = null;
		            }
		         } catch (SQLException var30) {
		            pst = null;
		         }

		         try {
		            if (conn != null) {
		               conn.close();
		            }

		            conn = null;
		         } catch (SQLException var29) {
		            conn = null;
		         }

		      }

		      return registros;
		   }

}
