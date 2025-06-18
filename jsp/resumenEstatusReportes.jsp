<%@ page import="bean.ConsultaEstadoReporte"%>
<%@ page import="clases.EstadoReporte"%>
<%@page import="java.util.ArrayList"%>


<%
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String idunicoincrementable = request.getParameter("idunicoincrementable") != null ? request.getParameter("idunicoincrementable"): "";
	String tipoArchivo = request.getParameter("tipoArchivo") != null ? request.getParameter("tipoArchivo"): "";
	String estatusProceso = request.getParameter("estatusProceso") != null ? request.getParameter("estatusProceso"): "";
	String usuarioRegistro = request.getParameter("usuarioRegistro") != null ? request.getParameter("usuarioRegistro"): "";
	String nombreArchivo = request.getParameter("nombreArchivo") != null ? request.getParameter("nombreArchivo"): "";
	String fechaRegistroRango1 = request.getParameter("fechaRegistroRango1") != null ? request.getParameter("fechaRegistroRango1"): "";
	String fechaRegistroRango2 = request.getParameter("fechaRegistroRango2") != null ? request.getParameter("fechaRegistroRango2"): "";
	String fechaFinProcesoRango1 = request.getParameter("fechaFinProcesoRango1") != null ? request.getParameter("fechaFinProcesoRango1"): "";
	String fechaFinProcesoRango2 = request.getParameter("fechaFinProcesoRango2") != null ? request.getParameter("fechaFinProcesoRango2"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";

	ConsultaEstadoReporte consulta= new ConsultaEstadoReporte();
	ArrayList<EstadoReporte> lista = consulta.obtieneTareas(empresa,idunicoincrementable,tipoArchivo,estatusProceso,usuarioRegistro,nombreArchivo,fechaRegistroRango1,fechaRegistroRango2,
			 fechaFinProcesoRango1,fechaFinProcesoRango2,lbr);
	int j;
	String[] obj;
%>


<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px;">
        <thead>
            <tr>
                <th>ID de Reporte</th>
                <th>Empresa</th>
                <th>Tipo Archivo</th>
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
                <th>Estatus Proceso</th>
                <th>Usuario Registro</th>
                <th>Fecha Registro</th>
                <th>Fecha Inicio Proceso</th>
                <th>Nombre Archivo</th>
                <th>Fecha Fin Proceso</th>
                <th>Acciones&nbsp;&nbsp;&nbsp;</th>
            </tr>
        </thead>
                <tbody>
        <% 
        	int i;
 			EstadoReporte objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (EstadoReporte)lista.get(i);
					
		%>
            <tr class="clickable-row">
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
                <td><input type="hidden" id="tel<%=objDetalle.getENVARIDUNI()%>" value = "<%=objDetalle.getENVARIDUNI() %>"/><%=objDetalle.getENVARIDUNI() %></td>
                <td width="350"><%=objDetalle.getENVAREMPRE() %></td>
                <td><%=objDetalle.getENVARTIPAR() %></td>
                <td><%=objDetalle.getENVARFECIN() %></td>
                <td><%=objDetalle.getENVARFECFI() %></td>
                <td><%=objDetalle.getENVARESTPR() %></td>
                <td><%=objDetalle.getENVARUSRE() %></td>
                <td><%=objDetalle.getENVARFECR() %></td>
                <td><%=objDetalle.getENVARFECIP() %></td>
                <td><%=objDetalle.getENVARNOMA() %></td>
                <td><%=objDetalle.getENVARFECFP() %></td>
                <td>
				<%
// 				if(objDetalle.getEstado().trim().equals("PENDIENTE")) {
				/*if(obj[0].equals(objDetalle.getEstado().trim()) && !obj[1].equals("DETALLE")){
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
					{*/
				%>
				<!-- <button id="<%=objDetalle.getENVARIDUNI() %>" onclick="abrir<%=objDetalle.getENVARIDUNI()%>('<%=objDetalle.getENVARIDUNI() %>')" title="<%=objDetalle.getENVARIDUNI()%>" class="btn <%=objDetalle.getENVARIDUNI() %> btn-xs"><i class="fa <%=objDetalle.getENVARIDUNI() %>"></i></button>--><% 
				
// 				}
					/*}
				
				}

				}*/%>
				<!-- <button onclick="abrirDetalle(')" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button> -->
				<button onclick="" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button>
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
// 		alert(alturaactual);
 		var newheight = parseInt(alturaactual.split("px")[0])+70;
// 		alert(newheight);
 		$("div .dataTables_scrollBody").css("height",newheight);
 		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});
 	
 	
	

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});

 </script>   