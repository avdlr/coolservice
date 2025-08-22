package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import bean.Conexion;
import clases.Usuarios_Resumen;

public class Usuarios_ObtieneRegistros extends HttpServlet {
    private static final long serialVersionUID = 1L;

   /* protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print(obtieneUsuarioFiltro().toString());
    }*/
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        new JSONObject();
        JSONObject JSrespuesta = this.obtieneUsuarioFiltro();
        out.print(JSrespuesta);
     }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   /* public JSONObject obtieneUsuarioFiltro() {
        return new JSONObject();
    }*/
    
    public JSONObject obtieneUsuarioFiltro() {
        StringBuffer consulta = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Conexion conexion = Conexion.instance();
        JSONArray renglones = new JSONArray();
        JSONObject dato = null;
        JSONObject respuesta = new JSONObject();

        try {
           con = conexion.getConnection();
           if (con != null) {
              consulta = new StringBuffer("SELECT cveCSUsuarios, NombreUsuario FROM COOLSERVICEDB.CSUSUARIOS WHERE estatusRegistro!='I'");
              pst = con.prepareStatement(consulta.toString());
              rs = pst.executeQuery();

              while(rs.next()) {
                 dato = new JSONObject();
                 dato.put("cveCSUsuarios", rs.getString("cveCSUsuarios") == null ? "" : rs.getString("cveCSUsuarios").toString().trim());
                 dato.put("NombreUsuario", rs.getString("NombreUsuario") == null ? "" : rs.getString("NombreUsuario").toString().trim());
                 renglones.put(new JSONObject(dato, JSONObject.getNames(dato)));
              }

              respuesta.put("usuarios", renglones);
           }
        } catch (Exception var26) {
           var26.printStackTrace();
        } finally {
           try {
              if (rs != null) {
                 rs.close();
                 rs = null;
              }
           } catch (Exception var25) {
              rs = null;
           }

           try {
              if (pst != null) {
                 pst.close();
                 pst = null;
              }
           } catch (Exception var24) {
              pst = null;
           }

           try {
              if (con != null) {
                 con.close();
                 con = null;
              }
           } catch (Exception var23) {
              con = null;
           }

        }

        return respuesta;
     }

    public int obtieneTotalReg(String valUsuario) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int total = 0;
        try {
            conn = Conexion.instance().getConnection();
            if (conn == null) {
                return 0;
            }
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT COUNT(*) FROM coolservicedb.csusuarios a WHERE a.estatusRegistro!='I'");
            if (valUsuario != null && !valUsuario.isEmpty()) {
                sql.append(" AND (a.cveCSUsuarios LIKE ? OR a.NombreUsuario LIKE ?)");
            }
            ps = conn.prepareStatement(sql.toString());
            if (valUsuario != null && !valUsuario.isEmpty()) {
                ps.setString(1, "%" + valUsuario + "%");
                ps.setString(2, "%" + valUsuario + "%");
            }
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { }
            try { if (ps != null) ps.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
        return total;
    }

    public ArrayList<Usuarios_Resumen> obtieneResConf(String valUsuario, int pagina) {
        ArrayList<Usuarios_Resumen> lista = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = Conexion.instance().getConnection();
            if (conn == null) {
                return lista;
            }
            int registrosPorPagina = 12;
            int offset = (pagina - 1) * registrosPorPagina;

            StringBuilder sql = new StringBuilder();
            sql.append("SELECT a.cveCSUsuarios, a.NombreUsuario, ");
            sql.append("p.DescripcionPerfil AS idPerfil, a.Password, ");
            sql.append("CASE a.estatusRegistro WHEN 'I' THEN 'INACTIVO' ELSE 'ACTIVO' END AS estatusRegistro, ");
            sql.append("z.descripcionZona AS zona ");
            sql.append("FROM coolservicedb.csusuarios a ");
            sql.append("LEFT JOIN coolservicedb.csperfiles p ON p.idCSPerfiles = a.idPerfil ");
            sql.append("LEFT JOIN (SELECT u.cveUsuario, MAX(z.descripcionZona) AS descripcionZona ");
            sql.append("           FROM coolservicedb.csusuariozona u ");
            sql.append("           JOIN coolservicedb.cszonas z ON z.idCSZonas = u.idZona ");
            sql.append("           GROUP BY u.cveUsuario) z ON z.cveUsuario = a.cveCSUsuarios ");
            sql.append("WHERE a.estatusRegistro!='I'");
            if (valUsuario != null && !valUsuario.isEmpty()) {
                sql.append(" AND (a.cveCSUsuarios LIKE ? OR a.NombreUsuario LIKE ?)");
            }
            sql.append(" ORDER BY a.cveCSUsuarios LIMIT ? OFFSET ?");

            ps = conn.prepareStatement(sql.toString());
            int idx = 1;
            if (valUsuario != null && !valUsuario.isEmpty()) {
                ps.setString(idx++, "%" + valUsuario + "%");
                ps.setString(idx++, "%" + valUsuario + "%");
            }
            ps.setInt(idx++, registrosPorPagina);
            ps.setInt(idx, offset);

            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios_Resumen u = new Usuarios_Resumen();
                u.setClaveUsuario(rs.getString("cveCSUsuarios"));
                u.setNombreUsuario(rs.getString("NombreUsuario"));
                u.setPerfilUsuario(rs.getString("idPerfil"));
                u.setPassword(rs.getString("Password"));
                u.setEstatusUsuario(rs.getString("estatusRegistro"));
                u.setZona(rs.getString("zona"));
                lista.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { }
            try { if (ps != null) ps.close(); } catch (Exception e) { }
            try { if (conn != null) conn.close(); } catch (Exception e) { }
        }
        return lista;
    }
}