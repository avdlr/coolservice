<%@page import="java.awt.List"%>
<%@ page import="bean.ConsultaNotificaciones"%>
<%@ page import="bean.DatosExpTec"%>
<%@ page import="clases.Notificaciones"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>

<!-- ********************************************************	 -->
<!-- ***************Parametros  *****************************	 -->
<!-- ********************************************************	 -->

<!-- .sweet-alert texto a la izquierda,  .sa-confirm-button-container Boton OK del pop up detalle modificacion -->
<style>
.sweet-alert{  
text-align: left;
}
.sa-confirm-button-container{ 
float: right;
}
</style>
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

<section class="wrapper">
<div class="row mt" style="margin:5px;">
<div class="col-md-12"><h4>NOTIFICACIONES</h4></div>  <!-- Titulo Principal -->

<!-- ********************************************************	 -->
<!-- ***************Filtros  ********************************	 -->
<!-- ********************************************************	 -->
	<div class="col-md-12" style="background-color: #77a2ce;padding-bottom: 12px;padding-top: 10px;">
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		ID Notificación:
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="idnotificacion" class="form-control input-sm" placeholder="">
		</div>
		</div>
		</div>

		<div class="col-sm-6 col-md-4 col-lg-3 ">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Tipo Notificación:
		</div>
		<div class="col-xs-9 col-sm-8">				
			<select id="tipoNotificacion" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<option value="AVISO">AVISO</option>
				<option value="NOT">NOT</option>
			</select>
		</div>
		</div>
		</div>
<!-- 		<div style="width:100px;">.</div> -->		
		<!-- Fechas para filtros -->
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-4 col-sm-4" style="color:#FFFFFF;">
		Fecha Not.Inicial:
		</div>
		<div class="col-xs-9 col-sm-8">
			<div class="form-group">
            <div class='input-group date' id='datetimepicker1'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-4 col-sm-4" style="color:#FFFFFF;">
		Fecha Not.Final:
		</div>
		<div class="col-xs-9 col-sm-8">
		 <div class="form-group">
            <div class='input-group date' id='datetimepicker2'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
<!-- ********************************************************	 -->
<!-- ***************Botones	  ********************************	 -->
<!-- ********************************************************	 -->
		
		<div class="col-md-4 col-lg-3 col-lg-offset-0 col-md-offset-0 col-sm-offset-2 " align="right">
		<div class="row">
		<div class="col-xs-4">
		<button class="btn btn-primary" onclick="cargaTareas()" style="margin 2px;"><span class="fa fa-filter"></span> Consultar</button>
		</div>
		<div class="col-xs-4">
		<button class="btn btn-primary" onclick="limpiarFiltros('')" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		</div>
		</div>
		</div>
	</div>
		
	</div>
</div>

<!-- ********************************************************	 -->
<!-- ***************Grid  ********************************	 -->
<!-- ********************************************************	 -->

<div class="row" style="margin: 5px;">
                      <div class="col-md-12">
                      <div class="accordion">
				      <div class = "row mt" style="padding-top:px;" id="divisionTareas">
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
 </div>
</div>
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
 </section> 
 
 <!-- ********************************************************	 -->
<!-- ***************Funciones*********************************   -->
<!-- *********************************************************	 -->
 
<script>
              $(function () // valendario de fechas
              { 
				        $('#datetimepicker1').datetimepicker({
// 				        	format: 'YYYY-MM-DD',
				        	format: 'DD/MM/YYYY',  
// 				        	format: 'DD-MM-yyyy',  
				            locale: 'es'  
				        });
				        $('#datetimepicker2').datetimepicker({
// 				        	format: 'YYYY-MM-DD', 
				            format: 'DD/MM/YYYY',
//  				        format: 'DD-MM-YYYY',
				        	locale: 'es',
				            useCurrent: false //Important! See issue #1075
				        });
				        $("#datetimepicker1").on("dp.change", function (e) {
				            $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
				        });
				        $("#datetimepicker2").on("dp.change", function (e) {
				            $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
				        });
				    });           
              
               $(function(){

           		 $('#tablaTareas').DataTable({
           			 "scrollX": true
					,'oLanguage': {
						'sEmptyTable': "Sin registros"
						}
           		 });
               });
            function cargaTareas() // carga pantalla principal	
            {	 		
		 		var paridnotificacion = $("#idnotificacion").val();
		 		var partipoNotificacion = $("#tipoNotificacion option:selected").val();
		 		var parfechaini = $("#datetimepicker1").find("input").val();
		 		var parfechafin = $("#datetimepicker2").find("input").val();
                var usuario="ASRODRPMY";
		 		var parametros = "";

		 	   var parametros = "lbr="+'<%=lbr%>';		 				 		
		 		if(paridnotificacion!=""){parametros+="&idnotificacion="+paridnotificacion;}
		 		if(partipoNotificacion!=""){parametros+="&tipoNotificacion="+partipoNotificacion;}
		 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
		 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
                if(usuario!=""){parametros+="&usuario="+usuario;}
	
		 		
		 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
		 		$.ajax({
					url: 'notificacionLista.jsp?'+parametros,
					type: "GET",
					cache: false,
					
					success: function( resp ) {
						 $("#divisionTareas").html(resp);
						// $("#btnAsigMasiva").css("display",'none');
					}
			  });
		 	} 

		 	function limpiarFiltros(opcion)// limpia  filtros
		 	 { 
		 		$("#idnotificacion").val("");
		 		$("#tipoNotificacion").val("");	
		 		$('#datetimepicker1').data('DateTimePicker').date(null);
           		$('#datetimepicker2').data('DateTimePicker').date(null);	 		
		 		if(opcion!="GA"){cargaTareas();}
		 		
		    } 
		    
		    function abrirDetalle(idnotificacion,asunto,fechanotificacion,tipoNotificacion,estatus,fechalectura) //  carga pantalla al momento de  dar clik al boton conulta
		    { 
		    	var popupDetalle = window.open(
		    	        "popupDetalle.jsp?idnotificacion=" + idnotificacion + 
		    			"&asunto=" +asunto + 
		    			"&fechanotificacion=" +fechanotificacion +
		    		    "&tipoNotificacion=" +tipoNotificacion +
		    			"&estatus=" +estatus + 
		    			"&fechalectura=" +fechalectura 	    	
		    			);
		    	
		    }  
		    
		    
		   function abrirDetalleNot(idnotificacion,fechalectura,asunto,tipoNotificacion) // accion de boton Detalle (muestra mensaje)
		    {
		    var usuario="ASRODRPMY";
		    var parametros = "lbr="+'<%=lbr%>';
		    
// 		    if(paridnotificacion!=""){parametros+="&idnotificacion="+paridnotificacion;}
// 		    if(parfechalectura!=""){parametros+="&fechalectura="+parfechalectura;}
		    if(usuario!=""){parametros+="&usuario="+usuario;}
		    if(idnotificacion!=""){parametros+="&idnotificacion="+idnotificacion;}
		    if(fechalectura!=""){parametros+="&fechalectura="+fechalectura;}
// 		   swal("ID Not. :"+ idnotificacion+"Asunto :"+asunto+"tipo Not. :"+tipoNotificacion, "Detalle :" + resp, "success"); 

				$.ajax({
					url: '../MostrarNotificacion?'+parametros,
					type: "GET",
					cache: false,
					success: function( resp ) {
					cargaTareas();
						 if(resp != "ERROR"){										 
// 							swal("ID Not. :"+ idnotificacion+"Asunto :"+asunto+"tipo Not. :"+tipoNotificacion, "Detalle :" + resp, "success");	

                             ////// pop up de detalle con estilo					 
						    swal({title: '<B>Detalle Notificación</B>', 
						     text : '<B>ID Notificación: </B>'+ idnotificacion+ '<br><B>Asunto: </B><font>'+ asunto+ '<br><B>Tipo Notificación: </B><font>'+ tipoNotificacion+ '<br><br><B>Mensaje: </B><font>'+ resp,
						     html:'<i>Detalle Notificación :</i>',   
						    showclosebutton: true, showcancelbutton: false });

							limpiarFiltros('GA');	
						 }
						 else{
							swal("idnotificacion"+idnotificacion, "", "");
						 }
					}
				});
 		
		    }       
</script>


