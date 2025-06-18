<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.GestionTareas"%>
<%
	String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String sucursal = request.getParameter("sucursal") != null ? request.getParameter("sucursal"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	String nombredetalle = request.getParameter("nombredetalle") != null ? request.getParameter("nombredetalle"): "";
	String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "";
	
	GestionTareas llamado = new GestionTareas();
	JSONArray registros = new JSONArray();
	JSONObject registro = new JSONObject();
	registros = llamado.consultaDetalleGeneral(empresa,zona, fechaini, fechafin, estatus,usuario,tipo,sucursal);
%>
<div class="col-xs-12">
<div style="width: 100%;"align="right"><button style="margin-bottom: 10px;" class="btn btn-default" onclick="generarExcel()"><img alt="" src="../img/647702-excel-512.png" style="width: 20px;"> Generar Excel</button></div>
<table style="width:100%;" class="table table-striped table-bordered" id="tablaresumenvisor"> 
<thead>
	<tr><td>T&eacute;cnico</td><td>Nombre T&eacute;cnico</td><td>Estatus</td><td>Cumplimiento Cita</td><td>Zona</td><td>Folio Orden</td><td>Empresa</td><td>Sucursal</td><td>Duraci&oacute;n Trabajo</td></tr>
</thead>
<tbody>
	<%
	for(int i=0; i<registros.length(); i++)
	{
		registro= registros.getJSONObject(i);
	%>
	<tr>
		<td><%=registro.getString("usuario") %></td>
		<td><%=registro.getString("tecnico") %></td>
		<td><%=registro.getString("estatus") %></td>
<!-- 		<td>-</td> -->
		<td><%=registro.getString("cumplimiento") %></td>
		<td><%=registro.getString("zona") %></td>
		<td><%=registro.getString("orden") %></td>
		<td><%=registro.getString("empresa") %></td>
		<td><%=registro.getString("sucursal") %></td>
		<td><%=registro.getString("tiempoestimado") %></td>
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

function generarExcel()
{
	
	var parametros="zona=<%=zona%>"+"&empresa=<%=empresa%>"+"&fechaini=<%=fechaini%>"+"&fechafin=<%=fechafin%>"+"&estatus=<%=estatus%>"+"&usuario=<%=usuario%>&tipodetalle=general&nombredetalle="+escape('<%=nombredetalle%>')+'&tipo=<%=tipo%>&sucursal='+escape('<%=sucursal%>');
// 	alert(parametros);
	window.open("../tareasExcel?"+parametros);
	
}



</script>

