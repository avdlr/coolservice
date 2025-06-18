<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="bean.ConsultaDatosTabla"%>

<%
	ConsultaDatosTabla consulta4= new ConsultaDatosTabla();
	
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
	JSONArray lista4 = consulta4.obtieneFiltro(empresa,division,area,cope,lbr);

 %>

<div class="row mt" style="margin: 5px;">
	<div class="col-md-12">
		<h4>
			Inicio <i class="fa fa-angle-right"></i> Consultar tabla <i
				class="fa fa-angle-right"></i> Tabla 
			<%-- 				<%=lista3.toString()%> --%>
		</h4>
	</div>

	<div class="row mt" style="margin: 5px;">
		<div class="col-md-12">
			<table id="tablaTareas" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Expediente</th>
						<th>Nombre T&eacute;cnico</th>
						<th>Tipo T&eacute;cnico</th>
						<th>Cantidad Tareas</th>
						<th>% de Total</th>
						<th>Tareas Fibra</th>
						<th>Tareas Cobre</th>
						<th>Ordenes</th>
						<th>Garant&iacute;as</th>
						<th>Ultimo Despacho</th>
					</tr>
				</thead>
				<tbody>

					<%
							JSONObject Obj = new JSONObject();
							for (int i = 0; i < lista4.length(); i++) {
								Obj = lista4.getJSONObject(i);
						%>

					<tr>
						<td><%=Obj.getString("expediente")%></td>
						<td><%=Obj.getString("nombre")%></td>
						<td></td>
						<td><%=Obj.getInt("tareas")%></td>
						<td><%=Obj.getString("porcentajetar")%></td>
						<td><%=Obj.getInt("tarcobre")%></td>
						<td><%=Obj.getInt("tarfibra")%></td>
						<td><%=Obj.getInt("ordenes")%></td>
						<td><%=Obj.getInt("garantia")%></td>
						<td><%=Obj.getString("ultdesp")%></td>
					</tr>
					<%
							}
						%>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
var tablaTareas;
	$(function() {
		tablaTareas = $('#tablaTareas').DataTable({
			"scrollX" : true
		});
	});
	$
</script>
