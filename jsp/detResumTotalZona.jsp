<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.GestionTareas"%>
<%
	String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "";
	String nombredetalle = request.getParameter("nombredetalle") != null ? request.getParameter("nombredetalle"): "";
	
	GestionTareas llamado = new GestionTareas();
	JSONArray registros = new JSONArray();
	JSONObject registro = new JSONObject();
	registros = llamado.consultaResumenTotalZonas(zona, fechaini, fechafin, estatus,tipo);
%>
<div style="width: 100%; " class="col-xs-12">
<table style="width:100%;" class="table table-striped table-bordered" id="tablaresumenvisor"> 
<thead>
	<tr><th>Zona</th><th>T&eacute;cnico</th><% if(estatus.equals("total")) {%><th>Total</th><%} if(estatus.equals("liquidadas") || estatus.equals("total")) {%><th>Liquidadas</th><%} if(estatus.equals("abiertas") || estatus.equals("total")) {%><th>Abiertas</th><%}  if(estatus.equals("liquidadas") || estatus.equals("total")) {%><th>Cumplimiento</th><%} %></tr>
</thead>
<tbody>
<%
	for(int i=0; i<registros.length(); i++)
	{
		registro= registros.getJSONObject(i);
	%>
	<tr>
		<td><%=registro.getString("zona") %></td><td><%=registro.getString("nombre") %></td><% if(estatus.equals("total")) {%><td><span style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','<%=tipo %>','total','<%=registro.getString("usuario") %>','zona','<%=estatus%>','<%=nombredetalle%>')"><%=registro.getString("total") %></span></td><%} if(estatus.equals("liquidadas") || estatus.equals("total")){%><td><span style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','<%=tipo %>','liquidadas','<%=registro.getString("usuario") %>','zona','<%=estatus%>','<%=nombredetalle%>')"><%=registro.getString("liquidadas") %></span></td><%} if(estatus.equals("abiertas") || estatus.equals("total")){%><td><span style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','<%=tipo %>','abiertas','<%=registro.getString("usuario") %>','zona','<%=estatus%>','<%=nombredetalle%>')"><%=registro.getString("abiertas") %></span></td><%} if(estatus.equals("liquidadas") || estatus.equals("total")) {%><td><%=registro.getString("cumplimiento") %></td><%} %>
	</tr>
	<%} %>
</tbody>
</table>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#container").mLoading("hide");
	
		tablaTareas = $('#tablaresumenvisor').DataTable({
			"scrollX" : true
		});
		
// 		$("#tablaresumenvisor_wrapper").css("width","99%");
	});
</script>

