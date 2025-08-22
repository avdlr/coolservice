package bean;

import java.sql.*;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Simplified version of GestionTareas used only for
 * consultaTecnicoVisor().
 *
 * <p>The previous implementation relied on the database function
 * Zona_Usuario() which expects a single zone per technician. When a
 * technician belongs to multiple zones the function produced the MySQL
 * error "Result consisted of more than one row".  This class replaces
 * that logic by removing the zone lookup and always returning an empty
 * zone string which avoids the failing sub query.</p>
 */
public class GestionTareasFix {
    public JSONArray consultaTecnicoVisor(String zona, String fechaini, String fechafin) {
        // Normalise the optional parameters
        if ("0".equals(zona)) {
            zona = "";
        }
        if (zona == null) zona = "";
        if (fechaini == null) fechaini = "";
        if (fechafin == null) fechafin = "";

        Conexion conn = Conexion.instance();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        JSONArray registros = new JSONArray();
        try {
            cn = conn.getConnection();
            if (cn != null) {
                StringBuilder sql = new StringBuilder();
                // The original implementation attempted to resolve the zone
                // for each technician using the database function
                // Zona_Usuario(cveCSUsuarios).  When a technician is
                // assigned to more than one zone the subquery inside that
                // function returns multiple rows which causes MySQL to raise
                // "Result consisted of more than one row".  By avoiding that
                // function we eliminate the error and still obtain the
                // performance metrics.
                sql.append("select '' as Zona,")
                   .append(" concat(substr(NombreUsuario,1, locate(' ',NombreUsuario)+1),'.') as nombre,")
                   .append(" cveCSUsuarios as Tencico,")
                   .append(" TotalOSTec(cveCSUsuarios, ?, ?, ?) as TotGr,")
                   .append(" TotalOSLiqTec(cveCSUsuarios, ?, ?, ?) as TotLiq,")
                   .append(" TotalOSAbTec(cveCSUsuarios, ?, ?, ?) as TotAb,")
                   .append(" TotalOSCumTec(cveCSUsuarios, ?, ?, ?) as Cumplimiento,")
                   .append(" TotalRendimTec(cveCSUsuarios, ?, ?, ?) as Rendimiento")
                   .append(" from csusuarios where idPerfil = ?")
                   .append(" union ")
                   .append(" select '' as Zona, 'SIN ASIGNAR' as nombre, '' as Tecnico,")
                   .append(" TotalOSTec(' ', ?, ?, ?) as TotGr,")
                   .append(" TotalOSLiqTec(' ', ?, ?, ?) as TotLiq,")
                   .append(" TotalOSAbTec(' ', ?, ?, ?) as TotAb,")
                   .append(" TotalOSCumTec(' ', ?, ?, ?) as Cumplimiento,")
                   .append(" TotalRendimTec(' ', ?, ?, ?) as Rendimiento")
                   .append(" from csusuarios where idPerfil = ?");

                ps = cn.prepareStatement(sql.toString());
                int idx = 0;
                // First select
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                // idPerfil for technicians
                ps.setString(++idx, "1");
                // Second select for unassigned tasks
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                ps.setString(++idx, zona);
                ps.setString(++idx, fechaini);
                ps.setString(++idx, fechafin);
                // idPerfil again
                ps.setString(++idx, "1");

                rs = ps.executeQuery();
                while (rs.next()) {
                    JSONObject registro = new JSONObject();
                    registro.put("usuario", rs.getString("Tencico"));
                    registro.put("nombre", rs.getString("nombre"));
                    registro.put("zona", rs.getString("Zona"));
                    registro.put("total", rs.getInt("TotGr"));
                    registro.put("liquidadas", rs.getInt("TotLiq"));
                    registro.put("abiertas", rs.getInt("TotAb"));
                    registro.put("cumplimiento", rs.getInt("Cumplimiento"));
                    registro.put("rendimiento", rs.getInt("Rendimiento"));
                    registros.put(registro);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignore */ }
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignore */ }
            try { if (cn != null) cn.close(); } catch (SQLException e) { /* ignore */ }
        }
        return registros;
    }
}