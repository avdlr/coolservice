<%@ page import="bean.ConsultaNotificaciones"%>
<%@ page import="clases.Notificaciones"%>
<%@page import="java.util.ArrayList"%>

<!-- ********************************************************	 -->
<!-- ***************Parametros  *****************************	 -->
<!-- ********************************************************	 -->

<%  
	String idnotificacion = request.getParameter("idnotificacion") != null ? request.getParameter("idnotificacion"): "";
	String tipoNotificacion = request.getParameter("tipoNotificacion") != null ? request.getParameter("tipoNotificacion"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	String fechalectura = request.getParameter("fechalectura") != null ? request.getParameter("fechalectura"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "ASRODRPMY";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
    ConsultaNotificaciones consulta= new ConsultaNotificaciones();  // consulta
	ArrayList<Notificaciones> lista = consulta.obtieneNotificaciones(idnotificacion,tipoNotificacion,fechaini,fechafin,usuario,lbr); // consulta
	
 %>
 
<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px;">
        <thead>
            <tr>
		  		<th>ID Notificación</th>
                <th width="550">Asunto</th>
                <th>Fecha Notificación</th>
                <th>Tipo Notificación</th>
                <th>Estatus</th>
                <th>Fecha Lectura</th>
                <th>Acciones&nbsp;&nbsp;&nbsp;</th>
            </tr>
        </thead>
        <tbody>
                <% 
        	int i;
 			Notificaciones objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (Notificaciones)lista.get(i);
					
		%>	 
           <tr class="clickable-row">           
<%--            <li ><span class="btn btn-primary fa fa-search-plus" style="width: 100%;" onclick="abrirDetalle('<%=objDetalle.getidnotificacion() %>','<%=objDetalle.getasunto() %>','<%=objDetalle.getfechanotificacion() %>','<%=objDetalle.gettipoNotificacion() %>','<%=objDetalle.getestatus() %>','<%=objDetalle.fechalectura() %>')" title="DETALLE"> <label style="font-family: monospace; cursor: pointer;">DETALLE</label></span></li> --%>
                <td><%=objDetalle.getidnotificacion() %></td>
                <td><%=objDetalle.getasunto() %></td>
                <td><%=objDetalle.getfechanotificacion() %></td>
                <td><%=objDetalle.gettipoNotificacion() %></td>
                <td><%=objDetalle.getestatus() %></td>
                <td><%=objDetalle.getfechalectura() %></td>
                <td> <button id="idBoton_<%=objDetalle.getidnotificacion() %>" onclick="abrirDetalleNot('<%=objDetalle.getidnotificacion() %>','<%=objDetalle.getfechalectura() %>','<%=objDetalle.getasunto() %>','<%=objDetalle.gettipoNotificacion() %>')" title="Detalle" class="btn vlas btn-xs"><i class="fa fa-print"></i></button></td> <%-- boton acciones Detalle  --%>

<%--         <button onclick="abrirDetalle('<%=objDetalle.getidnotificacion() %>','<%=objDetalle.getasunto() %>','<%=objDetalle.getfechanotificacion() %>','<%=objDetalle.gettipoNotificacion() %>','<%=objDetalle.getestatus() %>','<%=objDetalle.fechalectura() %>')" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button> --%>

         </tr>
        <%} %>
    </tbody>
    </table>
  <script>
  checkedRows = [];
 	$(function(){

 		 $('#tablaTareas').DataTable({
 			 "scrollX": true
 			 ,'oLanguage': {
						'sEmptyTable': "Sin registros"
						}
 		 });
 		var alturaactual = $("div .dataTables_scrollBody").css("height");
// 		alert(alturaactual);
 		var newheight = parseInt(alturaactual.split("px")[0])+70;
// 		alert(newheight);
 		$("div .dataTables_scrollBody").css("height",newheight);
 		//$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});
 	
    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});

 </script> 
  