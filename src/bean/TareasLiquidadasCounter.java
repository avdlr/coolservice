package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Helper used to compute the total number of liquidated tasks that match the
 * filters provided by {@link GestionTareas#consultaTareas}.  The existing
 * implementation inside {@code GestionTareas} performs the main query using
 * the FechaSalida column when the action is "liq" but the count query still
 * relies on FHRegistro.  When filtering by date this produced an incorrect
 * total and therefore the pagination summary displayed "1 al 15 de 10" even
 * though there were more matching rows.  This helper mirrors the filtering
 * logic of the liquidated tasks view and counts using FechaSalida so the
 * pagination reflects the real total.
 */
public class TareasLiquidadasCounter {

    public int contar(String estatusExcluir,
                      String tecnico,
                      String orden,
                      String cliente,
                      String sucursal,
                      String zona,
                      String fechaini,
                      String fechafin) {
        Conexion conexion = Conexion.instance();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int total = 0;
        try {
            cn = conexion.getConnection();
            if (cn == null) {
                return 0;
            }

            StringBuilder sql = new StringBuilder();
            sql.append("select COUNT(*) as cantidad ")
               .append("from CSORDEN ")
               .append("join CSEMPRESAS on idCSEmpresas = idEmpresa ")
               .append("join CSSUCURSALES on idCSSucursales = idSucursal ")
               .append("left join CSUSUARIOS on CveTecnicoAsignado = cveCSUsuarios ")
               .append("join CSZONAS on idCSZonas = idZonaOS ")
               .append("where 1=1");

            List<String> params = new ArrayList<>();

            if (estatusExcluir != null && !estatusExcluir.trim().isEmpty()) {
                for (String estatus : estatusExcluir.split(",")) {
                    estatus = estatus.trim();
                    if (!estatus.isEmpty()) {
                        sql.append(" AND idEstatusOrden!=?");
                        params.add(estatus);
                    }
                }
            }

            if (tecnico != null && !tecnico.trim().isEmpty()) {
                sql.append(" AND cveCSUsuarios = ?");
                params.add(tecnico.trim());
            }

            if (orden != null && !orden.trim().isEmpty()) {
                sql.append(" AND FolioOrden = ?");
                params.add(orden.trim());
            }

            if (cliente != null && !cliente.trim().isEmpty()) {
                sql.append(" AND idEmpresa = ?");
                params.add(cliente.trim());
            }

            if (sucursal != null && !sucursal.trim().isEmpty()) {
                sql.append(" AND idSucursal = ?");
                params.add(sucursal.trim());
            }

            if (zona != null && !zona.trim().isEmpty()) {
                sql.append(" AND idZonaOS = ?");
                params.add(zona.trim());
            }

            boolean tieneFechaInicio = fechaini != null && !fechaini.trim().isEmpty();
            boolean tieneFechaFin = fechafin != null && !fechafin.trim().isEmpty();
            if (tieneFechaInicio && tieneFechaFin) {
                sql.append(" AND DATE_FORMAT(FechaSalida,'%Y-%m-%d') between ? and ?");
                params.add(fechaini.trim());
                params.add(fechafin.trim());
            } else if (tieneFechaInicio) {
                sql.append(" AND DATE_FORMAT(FechaSalida,'%Y-%m-%d') = ?");
                params.add(fechaini.trim());
            } else if (tieneFechaFin) {
                sql.append(" AND DATE_FORMAT(FechaSalida,'%Y-%m-%d') = ?");
                params.add(fechafin.trim());
            }

            ps = cn.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                ps.setString(i + 1, params.get(i));
            }

            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("cantidad");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    rs = null;
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    ps = null;
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    cn = null;
                }
            }
        }

        return total;
    }
}