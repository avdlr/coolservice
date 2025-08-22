<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.GestionTareasFix"%>

<%
	String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	
	GestionTareasFix llamado = new GestionTareasFix();
	JSONArray registros = new JSONArray();
	JSONObject registro = new JSONObject();
	registros = llamado.consultaTecnicoVisor(zona, fechaini, fechafin);
	
	
%>

		<strong class="text-default"> Trabajos por T&eacute;cnico</strong>
			<div class="blue-box table-responsive" id="agendasAbiertas"><table style="width:100%;" class="tableOciLeft"> <tbody><tr class="trHeaderOci"> <th class="text-left"> Zona </th><th class="text-left"> T&eacute;cnico </th> <th> Total </th> <th> Liquidados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th><th>Rendimiento</th> </tr>
			<%
			if (registros != null) {
				for(int i=0; i<registros.length(); i++)
				{
					registro= registros.getJSONObject(i);
				%>
					<tr>
						<td><%=registro.getString("zona") %></td><td><%=registro.getString("nombre") %></td><td><span class="label label-warning " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','total','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("total") %></span></td><td><span class="label label-primary " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','liquidadas','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("liquidadas") %></span></td><td><span class="label label-success " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','abiertas','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("abiertas") %></span></td><td><span class="label label-default"><%=registro.getString("cumplimiento") %></span></td><td><span class="label label-default"><%=registro.getString("rendimiento") %></span></td>
					</tr>
			
				<%
				}
			}
			else {
				for(int i=0; i<registros.length(); i++)
				{
					registro= registros.getJSONObject(i);
				%>
					<tr>
						<td><%=registro.getString("zona") %></td><td><%=registro.getString("nombre") %></td><td><span class="label label-warning " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','total','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("total") %></span></td><td><span class="label label-primary " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','liquidadas','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("liquidadas") %></span></td><td><span class="label label-success " style="text-decoration: underline; cursor:pointer;" onclick="abrirResumenGeneral('','<%=zona %>','<%=fechaini %>','<%=fechafin %>','rango','abiertas','<%=registro.getString("usuario") %>','noregresa','<%=estatus%>','Trabajos del tecnico <%=registro.getString("nombre")%>')"><%=registro.getString("abiertas") %></span></td><td><span class="label label-default"><%=registro.getString("cumplimiento") %></span></td><td><span class="label label-default"><%=registro.getString("rendimiento") %></span></td>
					</tr>
			
				<%
				}
			}
				%>
<!-- 			<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
			</tbody>
			</table>
			</div>
			
		<div class="row text-center footerBlueBox">
			<div class="col-xs-12 col-md-12 col-sm-12">
				<label id="rcallAGA" class="aWithe" onclick="actualizaconsultaTecnicos()"><i class="fa fa-refresh"></i> Actualizar</label>
			</div>
		</div>
