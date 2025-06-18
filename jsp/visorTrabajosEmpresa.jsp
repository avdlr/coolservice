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
				registros = llamado.consultaTrabajosEmpresa(zona, fechaini, fechafin);
				
				
			%>

			<strong class="text-default"> Trabajos por Empresa (HOY)</strong>
		          		<div class="blue-box table-responsive" id="agendasVencidas"><table style="width:100%;" class="tableOciLeft" > <tbody>
		          		<tr class="trHeaderOci"> <th class="text-left"> Empresa </th> <th> Total </th> <th> Liquiados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr>
			<%
			for(int i=0; i<registros.length(); i++)
			{
				registro= registros.getJSONObject(i);
			%>
				<tr><td align="left"><%=registro.getString("empresa") %></td><td><a onclick="abrirResumenTotalRangoEmpresa('<%=registro.getString("idempresa") %>','<%=zona %>','<%=fechaini %>','<%=fechafin %>','hoy','total','Trabajos por Empresa')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "><%=registro.getString("total") %></span></a></td><td><a onclick="abrirResumenTotalRangoEmpresa('<%=registro.getString("idempresa") %>','<%=zona %>','<%=fechaini %>','<%=fechafin %>','hoy','liquidadas','Trabajos por Empresa')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-primary "><%=registro.getString("liquidadas") %></span></a></td><td><a onclick="abrirResumenTotalRangoEmpresa('<%=registro.getString("idempresa") %>','<%=zona %>','<%=fechaini %>','<%=fechafin %>','hoy','abiertas','Trabajos por Empresa')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-success "><%=registro.getString("abiertas") %></span></a></td><td><a onclick="" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-default "><%=registro.getString("cumplimiento") %></span></a></td></tr>
		
			<%
			}
			%>
<!-- 			<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
			</tbody>
			</table>
			</div>
			
		<div class="row text-center footerBlueBox">
			<div class="col-xs-12 col-md-12 col-sm-12">
				<label id="rcallAGA" class="aWithe" onclick="actualizaconsultaTrabajoEmpresa()"><i class="fa fa-refresh"></i> Actualizar</label>
			</div>
		</div>