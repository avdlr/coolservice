<%@ page import="bean.ConsultaTareasGeneral"%>
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
	
	String fuenteOrigen = request.getParameter("fuenteOrigen") != null ? request.getParameter("fuenteOrigen"): "";
	

	ConsultaTareasGeneral consulta= new ConsultaTareasGeneral();
	ArrayList<Tarea> lista = consulta.obtieneImpresiones( empresa,  division,  area,  cope,  tecnologia, estatus,  fechaini,  fechafin,  foliopisaplex,  foliopisa,  tecnico,  tipoOrden,  fuenteOrigen ,  lbr);
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
                	<th>Tecnolog&iacute;a</th>
                	<th>Fuente Origen</th>
                <th>Tel&eacute;fono</th>
                <th>Empresa</th>
                <th>Distrito</th>
                <th>Cope</th>
                <th>Fecha Cont/Rpda</th>
                <th>Fecha Cita</th>
                <th>Fecha Pendiente</th>
                <th>Dilaci&oacute;n</th>
                <th>Expediente T&eacute;cnico</th>
                
                <th>Fecha Asignada</th>
                <th>Fecha Despachada</th>
                <th>Fecha Liquidaci&oacute;n</th>
                <th>Aprovisionamiento</th>
                <th>Pruebas</th>
                <th>Acciones</th>
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
                <td align="center"> <div class="btn-group" data-toggle="buttons" >
                <label class="btn btn-default" style="font-size: 4px; color:#000;">
                	<input type="checkbox" id="<%=objDetalle.getFolioPisaPlex() %>" name = "<%=objDetalle.getExpediente() %>" autocomplete="off" onchange="activaSeleccion (this.id, this.name)" />
                	<span class="glyphicon glyphicon-ok"></span>
                </label></div> </td>
                <td><%=objDetalle.getFolioPisaPlex() %></td>
                <td><%=objDetalle.getFolioPisa() %></td>
                <td><%=objDetalle.getTipoTarea() %></td>
                <td><%=objDetalle.getTipo() %></td>
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
                <td style="text-align:center;">
                <div class="btn-group" style="width: 100%;">
                		<span style="width:100%; font-size:10px; cursor:pointer; font-weight: bold;" class="label btn-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>pendiente<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>asignada<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>despachada<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>objetada<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>liquidada<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>peligro<%}%> dropdown-toggle" data-toggle="dropdown" style="font-size: smaller;"><%=objDetalle.getEstado() %></span>
                		<ul class="dropdown-menu" role="menu" style="margin-left: 100px; margin-top: -30px;">
         
                		<li ><span class="btn btn-default fa fa-print" style="width: 100%;" onclick="impresionDocumento(<%=objDetalle.getExpediente()%>,<%=objDetalle.getFolioPisaPlex()%>);" title="IMPRIMIR"> <label style="font-family: monospace; cursor: pointer;">IMPRIMIR</label></span></li>
						</ul>
                	</div>
                </td>
                 	<td><%=objDetalle.getTecnologia() %></td>
                 	<td><%=objDetalle.getOrigen() %></td>
                <td><%=objDetalle.getTelefono() %></td>
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
                <td><button onclick="impresionDocumento(<%=objDetalle.getExpediente()%>,<%=objDetalle.getFolioPisaPlex()%>);" title="IMPRIMIR" class="btn btn-default btn-xs"><i class="fa fa-print"></i></button></td>
            </tr>
            <%} %>
		  
           
        </tbody>
    </table>
    
 
  <script>
  checkedRows = [];
 	/* $(function(){

 		 $('#tablaTareas').DataTable({
 			 "scrollX": true
 		 });
 	});

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	}); */
  	var tablaTareas;
 	$(function(){
 		 tablaTareas= $('#tablaTareas').DataTable({
 			 "scrollX": true
 		 }); 
 		
 		   

 		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnImprimir" onclick="impresionDocumentoMultiple()" title="IMPRIMIR SELECCIONADOS" class="btn btn-default"><i class="fa fa-print"></i>&nbsp;&nbsp;Imprimir</button>');
 	});
 	
 	
 	 function impresionDocumento(expedienteTecnivo,folioPizaPlex){
     	/* expedienteTecnivo = '43543534'; */
     	/* folioPizaPlex = '000025295';//000025293 000025294 000025295 */
     	$body = $("body");
     	$.ajax({
 			/* url: '/Impresiones?'+parametros, */
 			url: '../Impresiones?expedienteTecnico='+expedienteTecnivo+'&folioPisaPlex='+folioPizaPlex,
 			beforeSend: function() { $body.addClass("loading"); },
       	    complete: function() { $body.removeClass("loading"); },
 			type: "GET",
 			cache: false,
 			
 			success: function( resp ) {
 				 /* $("#divisionTareas").html(resp); */
 				 var newWindow = window.open();
 				 newWindow.document.write(resp);
 				 newWindow.document.title = folioPizaPlex;
 				 $("#btnImprimir").css("display",'none');
 			}
 	  });
     	
     	
     }
     
       function impresionDocumentoMultiple(){
     		 var cont = 0;
     		 for(;cont < checkedRows.length; cont++){
     			 impresionDocumento(checkedRows[cont].tecnico,checkedRows[cont].folio);
     			 /* $("#"+checkedRows[cont].folio).prop("checked",false); */
     		 }
     }  
       
       $('#tablaTareas').on('click', '.clickable-row', function(event) {
     	  $(this).addClass('active').siblings().removeClass('active');
     	});
     
     function activaSeleccion(folio, archivoTecnico)
     {
     	var valor=$("#"+folio).is(":checked");
//      	alert(valor);
     	if(valor)
     	{
     		$("#asig"+folio).prop("disabled",true);
     		 checkedRows.push({folio: folio, tecnico :archivoTecnico});
     	}
     	else
     	{
     		$("#asig"+folio).prop("disabled",false);
     		$.each(checkedRows, function(key, value) {
//      			alert(value.folio);
     		    if (value.folio == folio) {
     		      checkedRows.splice(key,1);
     		      return false;
     		    }
     		  });
     	}
     	activaAsignacionMasiva(checkedRows.length);
     }
     
     function activaAsignacionMasiva(cantchk)
     {
     	var cantidad = $("input:checked").length;
     	var cantidadEscondidos = $("input:hidden:checked").length;
 		
//  		e.preventDefault();       

//  		alert(cantchk);
     	if(cantchk>0)
     	{
     		
     		$("#btnImprimir").css("display",'inline-block');
     	}
     	else
     	{
     		$("#btnImprimir").css("display",'none');
     	}
     }
       

 </script> 
  <div class="modal"></div>    