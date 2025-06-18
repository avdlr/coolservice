<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.GestionTareas"%>

<%
	String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	
	GestionTareas llamado = new GestionTareas();
	JSONArray registros = new JSONArray();
	JSONObject registro = new JSONObject();
	registros = llamado.consultaTrabajosTecnicoRango(zona, fechaini, fechafin);
	
	
%>

		<strong class="text-default"> Trabajos de Zona (Rango)</strong>
			<div class="blue-box table-responsive" id="agendasAbiertas"><table style="width:100%;" class="tableOciLeft" > <thead><tr class="trHeaderOci"> <th class="text-left"> Zona </th> <th> Total </th> <th> Liquidados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr></thead>
				<tbody>
			<%
				for(int i=0; i<registros.length(); i++)
				{
					registro= registros.getJSONObject(i);
				%>
					<tr><td align="left"><%=registro.getString("zona") %></td><td><a onclick="abrirResumenTotalZona('<%=registro.getString("idzona") %>','<%=fechaini %>','<%=fechafin %>','rango','total','Trabajos por Zona Rango')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "><%=registro.getString("total") %></span></a></td><td><a onclick="abrirResumenTotalZona('<%=registro.getString("idzona") %>','<%=fechaini %>','<%=fechafin %>','rango','liquidadas','Trabajos por Zona Rango')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-primary "><%=registro.getString("liquidadas") %></span></a></td><td><a onclick="abrirResumenTotalZona('<%=registro.getString("idzona") %>','<%=fechaini %>','<%=fechafin %>','rango','abiertas','Trabajos por Zona Rango')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-success "><%=registro.getString("abiertas") %></span></a></td><td><a onclick="" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-default "><%=registro.getString("cumplimiento") %></span></a></td></tr>
			
				<%
				}
				%>
<!-- 			<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
			</tbody>
			</table>
			</div>
			
		<div class="row text-center footerBlueBox">
			<div class="col-xs-12 col-md-12 col-sm-12">
				<label id="rcallAGA" class="aWithe" onclick="actualizaconsultaTrabajosTecnicoRango()"><i class="fa fa-refresh"></i> Actualizar</label>
			</div>
		</div>
		
	<script type="text/javascript">
	$(document).ready(function() {
// 		setTimeout(actualizaconsultaTrabajosTecnicoRango, 60000);
	});
	</script>	