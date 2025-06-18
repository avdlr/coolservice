<%@ page import="bean.ConsultaTareas"%>
<%@ page import="clases.Tarea"%>
<%@page import="java.util.ArrayList"%>


<%
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String tecnologia = request.getParameter("tecnologia") != null ? request.getParameter("tecnologia"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String foliopisaplex = request.getParameter("foliopisaplex") != null ? request.getParameter("foliopisaplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String tecnico = request.getParameter("tecnico") != null ? request.getParameter("tecnico"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	String tipoOrden = request.getParameter("tipoOrden") != null ? request.getParameter("tipoOrden"): "";

	ConsultaTareas consulta= new ConsultaTareas();
	ArrayList<String[]> conEstatus = consulta.obtieneConfEstatus(lbr);
	ArrayList<Tarea> lista = consulta.obtieneTareas(empresa,division,area,cope,tecnologia,estatus,fechaini,fechafin,foliopisaplex,foliopisa,tecnico,tipoOrden,"CAMBACEO" ,lbr);
	int j;
	String[] obj;
%>


	<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px;">
        <thead>
            <tr>
		  		<th>Seleccion</th>
                <th>Folio PisaPlex</th>
                <th>Folio Pisa</th>
                <th>Tipo Tarea</th>
                <th>Tipo</th>
<!--                 <th>Tecnolog&iacute;a</th> -->
                <th>Estado</th>
                <th>Tel&eacute;fono</th>
                <th>Empresa</th>
                <th>Distrito</th>
                <th>Cope</th>
                <th>Fecha Cont/Rpda</th>
                <th>Fecha Cita</th>
                <th>Fecha Pendiente</th>
                <th>Dilaci&oacute;n</th>
                <th>Expediente</th>
                
                <th>Fecha Asignada</th>
                <th>Fecha Despachada</th>
                <th>Fecha Liquidaci&oacute;n</th>
                <th>Aprov</th>
                <th>Pruebas</th>
                <th>Acciones&nbsp;&nbsp;&nbsp;</th>
            </tr>
        </thead>
        <tbody>
        <% 
        	int i;
 			Tarea objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (Tarea)lista.get(i);
					
		%>
            <tr class="clickable-row">
                <td  align="center" > <div class="btn-group" data-toggle="buttons" >
                <label <%if(!objDetalle.getEstado().trim().equals("PENDIENTE")) {%>disabled<%} %> class="btn btn-default" style="font-size: 4px; color:#000;" >
                	<input  type="checkbox" id="<%=objDetalle.getFolioPisa() %>" autocomplete="off"  onchange="activaSeleccion(this.id)"/>
                	<span class="glyphicon glyphicon-ok"></span>
                </label></div> </td>
                <td><%=objDetalle.getFolioPisaPlex() %></td>
                <td><%=objDetalle.getFolioPisa() %></td>
                <td><%=objDetalle.getTipoTarea() %></td>
                <td><%=objDetalle.getTipo() %></td>
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
                <td style="text-align:center;">
                	<div class="btn-group" style="width: 100%;">
                		<span style="width:100%; font-size:10px; cursor:pointer; font-weight: bold;" class="label btn-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>pendiente<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>asignada<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>despachada<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>objetada<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>liquidada<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>peligro<%}%> dropdown-toggle" data-toggle="dropdown" style="font-size: smaller;"><%=objDetalle.getEstado() %></span>
                		<ul class="dropdown-menu" role="menu" style="margin-left: 100px; margin-top: -30px;">
                		<% 
						for ( j = 0; j < conEstatus.size(); j++) {
							obj = (String[])conEstatus.get(j);
						%>
                		<%if( objDetalle.getEstado().trim().equals(obj[0]) && !obj[1].equals("DETALLE")) {
                			int validacionAprov = 0;
        					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("APROVISIONAR") && objDetalle.getAprovisionamiento().equals("SI")){
        						validacionAprov = 1;
        					} else
        					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("PRUEBAS") && (!objDetalle.getAprovisionamiento().equals("SI") || objDetalle.getPruebas().equals("SI"))){
        						validacionAprov = 1;
        					}
        					else if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("LIQUIDAR") && (objDetalle.getAprovisionamiento().equals("NO") || objDetalle.getPruebas().equals("NO")))
        					{
        						validacionAprov = 1;
        					}
        					if(validacionAprov==0)
        					{
                		%>
                		
                		
                			<li id="qaAsig<%=objDetalle.getFolioPisa()%>"><span class="btn <%=obj[2] %> fa <%=obj[3] %>" style="width: 100%;" onclick="abrir<%=obj[1] %>('<%=objDetalle.getFolioPisa() %>')" title="<%=obj[1]%>"> <label style="font-family: monospace; cursor: pointer;"><%=obj[1] %></label></span></li>
                			
                		
                		<%}
                		}
						}%>
						<li ><span class="btn btn-primary fa fa-search-plus" style="width: 100%;" onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE"> <label style="font-family: monospace; cursor: pointer;">DETALLE</label></span></li>
						</ul>
                	</div>
                </td>
                <td><input type="hidden" id="tel<%=objDetalle.getFolioPisa()%>" value = "<%=objDetalle.getTelefono() %>"/><%=objDetalle.getTelefono() %></td>
                <td><%=objDetalle.getEmpresa() %></td>
                <td><%=objDetalle.getDistrito() %></td>
                <td><%=objDetalle.getCope() %></td>
                <td><%=objDetalle.getFechaCont() %></td>
                <td><%=objDetalle.getFechaCita() %></td>
                <td><%=objDetalle.getFechaPendiente() %></td>
                <td><%=objDetalle.getDilacion() %></td>
                <td><%=objDetalle.getExpediente() %></td>
                
                <td><%=objDetalle.getFechaAsignada() %></td>
                <td><%=objDetalle.getFechaDespachada() %></td>
                <td><%=objDetalle.getFechaLiquidacion() %></td>
                <td><%=objDetalle.getAprovisionamiento() %></td>
                <td><%=objDetalle.getPruebas() %></td>
                <td>
                <% 
				for ( j = 0; j < conEstatus.size(); j++) {
					obj = (String[])conEstatus.get(j);
				%>
				<%
// 				if(objDetalle.getEstado().trim().equals("PENDIENTE")) {
				if(obj[0].equals(objDetalle.getEstado().trim()) && !obj[1].equals("DETALLE")){
					int validacionAprov = 0;
					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("APROVISIONAR") && objDetalle.getAprovisionamiento().equals("SI")){
						validacionAprov = 1;
					} else
					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("PRUEBAS") && (!objDetalle.getAprovisionamiento().equals("SI") || objDetalle.getPruebas().equals("SI"))){
						validacionAprov = 1;
					}
					else if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("LIQUIDAR") && (objDetalle.getAprovisionamiento().equals("NO") || objDetalle.getPruebas().equals("NO")))
					{
						validacionAprov = 1;
					}
					if(validacionAprov==0)
					{
				%>
				<button id="<%=obj[1].substring(0,3)+objDetalle.getFolioPisa() %>" onclick="abrir<%=obj[1]%>('<%=objDetalle.getFolioPisa() %>')" title="<%=obj[1]%>" class="btn <%=obj[2] %> btn-xs"><i class="fa <%=obj[3] %>"></i></button><%
				
// 				}
					}
				
				}

				}%>
				<button onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button>
				</td>
<%--                 <td><%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%><button id="asig<%=objDetalle.getFolioPisa() %>" onclick="abrirAsignar('<%=objDetalle.getFolioPisa() %>')" title="ASIGNAR" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i></button><%} %> <button onclick="despacharTarea('<%=objDetalle.getFolioPisa() %>')" title="DESPACHAR" class="btn btn-primary btn-xs"><i class="fa fa-plug"></i></button> <button onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE" class="btn btn-success btn-xs"><i class="fa fa-search-plus"></i></button></td> --%>
            </tr>
            <%} %>
		  
           
        </tbody>
    </table>
    
 
  <script>
  checkedRows = [];
 	$(function(){

 		 $('#tablaTareas').DataTable({
 			 "scrollX": true
 		 });
 		var alturaactual = $("div .dataTables_scrollBody").css("height");
 		var newheight = parseInt(alturaactual.split("px")[0])+70;
 		$("div .dataTables_scrollBody").css("height",newheight);
 		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});

 </script>   