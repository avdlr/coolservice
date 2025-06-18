<%@page import="bean.GestionTareas"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String accionFact = request.getParameter("accionFact") != null ? request.getParameter("accionFact"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	String foliofactura = request.getParameter("foliofactura") != null ? request.getParameter("foliofactura"): "";
	String proveedor = request.getParameter("proveedor") != null ? request.getParameter("proveedor"): "";
	String monto = request.getParameter("monto") != null ? request.getParameter("monto"): "";
	String bandSinfact = request.getParameter("bandSinfact") != null ? request.getParameter("bandSinfact"): "";
	

	GestionTareas llamado = new GestionTareas();
	JSONArray registros = new JSONArray();

	JSONObject registro = new JSONObject();
	if(accionFact.equals("A"))
	{
		
		registros = llamado.insertarFactura(orden, foliofactura, proveedor, monto, usuario, "N");
		
	}
	

		registros = llamado.consultaFacturas(orden,"N");
		
		%>
		<div style="width: 100%; overflow: auto;">
		<table id="tablafacturas" class="table table-striped table-bordered" style="font-size:11px; width: 100%; ">
        <thead>
            <tr>
		  		<th>Folio Factura</th>
                <th>Proveedor</th>
                <th>Monto</th>
				<th>Eliminar</th>

            </tr>
        </thead>
        <tbody>
        <%for(int i=0; i<registros.length(); i++){
        	registro=registros.getJSONObject(i);%>
        	<tr>
        		<td><%=registro.getString("folio") %></td>
        		<td><%=registro.getString("proveedor") %></td>
        		<td><%=registro.getString("monto") %></td>
        		<td style="cursor: pointer;" onclick="eliminarfactura('<%=registro.getString("idfactura") %>','<%=registro.getString("folio") %>','<%=registro.getString("proveedor") %>')"><span class="fa fa-minus-circle" style="color:red;"></span> Eliminar</td>
        	</tr>
        <%} %>
        </tbody>
        </table>
        </div>
