<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page import="bean.RestAPI_Functions"%>
<%@ page import="java.util.Random"%>
<%@ page import="bean.RestAPI_Functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
<!--     <meta charset="utf-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";// 
	String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "";

	String username="36000036";
	String tipotarea="TS1LPBT";
	Random rnd = new Random();
	int numRan= (int)(rnd.nextDouble() * 130);
	double porcentaje = numRan/130D *100D;
	
	RestAPI_Functions ins = new RestAPI_Functions();
	JSONArray listaFases = ins.obtenerFasesAprov(lbr);

%>
<script type='text/javascript'>

var longitud=0;
var ExisteIniciales="";
</script>
	<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico" />
    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/css/jquery-ui.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
    
    <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/sweetalert.css" rel="stylesheet">
    
    <link href="../assets/select2/select2.min.css" rel="stylesheet">
	<title>Aprovisionamiento</title>
	
	<script src="../assets/js/jquery-1.12.4.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
<!--     <script src="../assets/js/jquery.js"></script> -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert.min.js"></script>
    <script src="../assets/js/loading-mask.js"></script>
    <script src="../assets/select2/select2.min.js"></script>
<script type="text/javascript" src="../assets/js/bootstrap-progressbar.js"></script>
 </head>
<body>
<section class="wrapper" style="margin-top: 0px;">
 <div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Acci&oacute;n: </b> Aprovisionamiento &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>
<div style="width:97%; padding-top: 15px; padding-left: 15px;">
	<form>
	    <fieldset>
	    <legend>Datos del Aprovisionamiento</legend>
	    	<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Folio Pisa:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=foliopisa %></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Tel&eacute;fono:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=telefono %></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>N&uacute;mero de serie ONT:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><input class="form-control input-sm" type="text" id="serieONT" placeholder="Escriba el número de serie ONT" required="required"></div>
	    		<div class="col-xs-5 col-md-3 col-lg-2"><b></b>&nbsp;</div>
<!-- 	    		<div class="col-xs-12" style="font-weight: bold; font-size: .8em; text-align: right;">Favor de Ingresar el n&uacute;mero de serie Alfanum&eacute;rico, ejemplo ALCLF o HWTC</div> -->
	    		<div class="col-xs-7 col-md-9 col-lg-10" style="font-weight: bold; font-size: .8em; padding-top: 5px">Favor de Ingresar el n&uacute;mero de serie Alfanum&eacute;rico, ejemplo ALCLF o HWTC</div>
	    		</div>
<!-- 	    		<div class="col-xs-12" > -->
<!-- 	    			<div class="row"> -->
<!-- 	    				<div id = "aprovAprovisionar" class="col-xs-4"><button class="btn btn-primary" onclick="llamarAprovisionar()" style="margin 2px;"> Aprovisionar</button></div> -->
<!-- 	    				<div id = "aprovConsEstatus" class="col-xs-4"><button class="btn btn-primary" onclick="" style="margin 2px;"> Consultar Estatus</button></div> -->
<!-- 	    				<div id = "aprovCerrar" class="col-xs-4"><button class="btn btn-primary" onclick="" style="margin 2px;"> Cerrar</button></div> -->
<!-- 	    			</div> -->
<!-- 	    		</div> -->
				
	    		<div class="col-xs-12">&nbsp;</div>
	    		<div class="col-xs-12" style="margin-top: 10px; text-align: right;">
<!-- 			    	<i class="fa fa-cog fa-spin fa-3x fa-fw"></i> -->
<!-- <span class="sr-only">Loading...</span> -->

  <a id="btnAprovisionar" class="btn btn-danger" onclick="llamarAprovisionar()" >
  <i class="fa fa-cogs fa-1x"></i> Aprovisionar</a>
  <a id="btnEstatus" class="btn btn-primary" onclick="consultaestatus()" style="display: none;">
  <i class="fa fa-retweet fa-1x"></i> Consultar Estatus</a>
  
<!-- 			    	<button style="display: inline-block;" id="aprovAprovisionar" class="btn btn-danger fa fa-cog fa-spin fa-3x fa-fw" onclick="llamarAprovisionar()"> Aprovisionar</button> -->
<!-- 			    	<button style="display: inline-block;" id="aprovConsEstatus" class="btn btn-primary" onclick="consultaestatus()">Consultar Estatus</button> -->
			    	<button style="display: inline-block;" id="aprovAceptar" class="btn btn-primary" onclick="aceptarAprov()">Aceptar</button>
			    </div>
			    <div class="col-xs-12">&nbsp;</div>
<!-- 	    		<div class="col-xs-12"><div class="progress"> <span class="blue" style="width:0%;"><span>0%</span></span> </div></div> -->
				<div class="col-xs-12 col-sm-12 col-lg-12" id="Respuesta"><label style="width: 95%; word-wrap: break-word;" for="myalue"></label></div>
				<div id="barraAprovisionamiento" style="display: none;">
				<legend>Estado del Aprovisionamiento</legend>
				<div class="col-xs-12"><div class="progress progress-striped active">   
					<div class="progress-bar progress-bar-striped" role="progressbar" data-transitiongoal="<%=porcentaje %>>" aria-valuemin="0" aria-valuemax="100"></div> </div> 
				</div>
	    		<div class="col-xs-12">
    			 <table id="tablaAprov" class="table table-bordered table-striped table-condensed" style="font-size: 12px; width: 100%">
    			 <thead>
		            <tr>
				  		<th style="background-color: #335485; width: 50%">Fase&nbsp;del&nbsp;Aprovisionamiento</th>
		                <th style="background-color: #335485; width: 30%">Tiempo&nbsp;Promedio de Ejecuci&oacute;n</th>
		                <th style="background-color: #335485; width: 20%">Estatus</th>
		            </tr>
        		</thead>
        			 	<tbody>
        			 	<% 
				        	int i;
				 			 JSONObject obj;
								for ( i = 0; i < listaFases.length(); i++) {
									obj =  listaFases.getJSONObject(i);
						%>
						

						
						 <%} %>
        			 	</tbody>
        			 </table>
	    		</div>
	    		</div>
	    		
	    		
	    	</fieldset>
	    		</form>
	    	</div>
	    </section>
</body>

<script type='text/javascript'>

	function llamarAprovisionar()
	{
		var serieONT=$("#serieONT").val();
		var longitudONT = serieONT.length;
		
		if(serieONT != "")
		{
			//Validar Iniciales y Longitud de la Serie		
			var parametros="serialONT="+serieONT+"&lbr="+'<%=lbr%>'+"&accion=validarCadena";
			$.ajax({
						url: '../RestAPI_Operations?'+parametros,
						type: "GET",
						cache: false,
						success: function( resp ) {
							datosjson = $.parseJSON(resp);
							 if(datosjson.code.trim()=="SUCCESS")
							 {
							 	longitud=parseInt(datosjson.longitud.trim());
							 	ExisteIniciales=datosjson.ExisteIniciales.trim();
								if(longitudONT == longitud)
								{
									// Aprovisionar ----------------------------------------------------------------------------
									//Ajax para iniciar el aprovisionamiento
									parametros="";
									parametros = "username="+'<%=username%>'+"&serialONT="+serieONT+"&tipotarea="+'<%=tipotarea%>'+"&folio="+'<%=foliopisa%>'+"&telefono="+'<%=telefono%>'+"&lbr="+'<%=lbr%>'+"&accion=aprovisionar";
									$.ajax({
									url: '../RestAPI_Operations?'+parametros,
									type: "GET",
									cache: false,
									success: function( resp ) {
										datosjson = $.parseJSON(resp);
										if(datosjson.respuesta.trim()=="SUCCESS")
										{
											if(datosjson.code == 202){
												$("#barraAprovisionamiento").css("display","none");
												swal("Petición Aceptada","Petición en Proceso (Código " + datosjson.code+")","info");
												$("label[for='myalue']").html(datosjson.json.trim());
												$("#serieONT").prop("disabled",true);
												$("#btnAprovisionar").addClass('disabled');
												$("#btnEstatus").css("display","inline");
												//$("#btnEstatus").addClass('disabled');
												
											}else{
												$("#barraAprovisionamiento").css("display","none");
												swal("",datosjson.descripcion.trim(),"success");
												$("label[for='myalue']").html(datosjson.json.trim());
												$("#serieONT").prop("disabled",true);
												$("#btnAprovisionar").prop("disabled",true);
												$("#btnEstatus").prop("disabled",false);
											}
										}
										else
										{
											var descripcion;
											$("#serieONT").prop("disabled",false);
											$("#btnEstatus").css("display","none");
												
											if(datosjson.code == 401){
												descripcion="Token Invalido, favor de generar un token nuevo.";
												swal("Error " + datosjson.code, descripcion, "error");
											}else if(datosjson.code == 500){
												descripcion="Se ha producido un error interno en el servidor";
												swal("Error " + datosjson.code, descripcion, "error");
											}else if(datosjson.code == 502){
												descripcion="Se genero un error en la interfaz de servicios de terceros";
												swal(datosjson.code+"-BAD_GATEWAY", descripcion, "error"); 	
											}
											
										}
									}
									});
									// Fin Aprovisionar ------------------------------------------------------------------------
								}else{
									swal("Error","La longitud de la serie es invalido","error");
									$('#serieONT').focus().val(serieONT);;
								}
								
	            				//$('#serieONT').focus().val(cadena);;
								//dialog.dialog( "close" );
								//limpiarFiltros('GA');
							 }
							 else
							 {
								swal("Error","El Proveedor ingresado en la serie del equipo es invalido","error");
								$('#serieONT').focus().val(serieONT);
							 }
						}
				});
		}else
		{
			swal("","Ingrese la serie ONT del equipo","error");
			$('#serieONT').focus();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		


		
// 		
// 		
		 
		
// 		$("#aprovAprovisionar").css("display","none");
// 		$("#aprovConsEstatus").css("display","block");
		//$("#aprovAceptar").css("display","block");
		
	}
	function consultaestatus()
	{
		var serieONT=$("#serieONT").val();
		var longitudONT = serieONT.length;
		
		if(serieONT != "")
		{
			//Validar Iniciales y Longitud de la Serie		
			var parametros="serialONT="+serieONT+"&lbr="+'<%=lbr%>'+"&accion=validarCadena";
			$.ajax({
						url: '../RestAPI_Operations?'+parametros,
						type: "GET",
						cache: false,
						success: function( resp ) {
							datosjson = $.parseJSON(resp);
							 if(datosjson.code.trim()=="SUCCESS")
							 {
							 	longitud=parseInt(datosjson.longitud.trim());
							 	ExisteIniciales=datosjson.ExisteIniciales.trim();
								if(longitudONT == longitud)
								{
									// Aprovisionar ----------------------------------------------------------------------------
									//Ajax para iniciar el aprovisionamiento
									parametros="";
									parametros = "username="+'<%=username%>'+"&serialONT="+serieONT+"&tipotarea="+'<%=tipotarea%>'+"&folio="+'<%=foliopisa%>'+"&telefono="+'<%=telefono%>'+"&lbr="+'<%=lbr%>'+"&accion=aprovisionar";
									$.ajax({
									url: '../RestAPI_Operations?'+parametros,
									type: "GET",
									cache: false,
									success: function( resp ) {
										datosjson = $.parseJSON(resp);
										if(datosjson.respuesta.trim()=="SUCCESS")
										{
											if(datosjson.code == 202){
												$("#barraAprovisionamiento").css("display","block");
												swal("Petición Aceptada","Petición en Proceso (Código " + datosjson.code+")","info");
												//$("label[for='myalue']").html(datosjson.json.trim());
												var fases = datosjson.listaFases;
												var listaFases = fases.split("|");
												
												 var trHTML = '';
												var tiempo='2 minutos';
												for (var index = 0; index < listaFases.length; ++index) {
												    trHTML += 
										                '<tr><td style="background-color: #f4f7ff;font-weight: bold;">' + listaFases[index] + 
										                '</td><td style="text-align: center">' + tiempo + 
										                '</td><td style="text-align: center"></td></tr>'; 
												}
										        $('#tablaAprov').append(trHTML);
												
												
												
												
												
											
											}else{
												$("#barraAprovisionamiento").css("display","block");
												swal("",datosjson.descripcion.trim(),"success");
												//$("label[for='myalue']").html(datosjson.json.trim());
											}
										}
										else
										{
											var descripcion;
											if(datosjson.code == 401){
												descripcion="Token Invalido, favor de generar un token nuevo.";
												swal("Error " + datosjson.code, descripcion, "error");
											}else if(datosjson.code == 500){
												descripcion="Se ha producido un error interno en el servidor";
												swal("Error " + datosjson.code, descripcion, "error");
											}else if(datosjson.code == 502){
												descripcion="Se genero un error en la interfaz de servicios de terceros";
												swal(datosjson.code+"-BAD_GATEWAY", descripcion, "error"); 	
											}
											
										}
									}
									});
									// Fin Aprovisionar ------------------------------------------------------------------------
								}else{
									swal("Error","La longitud de la serie es invalido","error");
									$('#serieONT').focus().val(serieONT);;
								}
								
	            				//$('#serieONT').focus().val(cadena);;
								//dialog.dialog( "close" );
								//limpiarFiltros('GA');
							 }
							 else
							 {
								swal("Error","El Proveedor ingresado en la serie del equipo es invalido","error");
								$('#serieONT').focus().val(serieONT);
							 }
						}
				});
		}else
		{
			swal("","Ingrese la serie ONT del equipo","error");
			$('#serieONT').focus();
		}
		
	}
	
	$(document).ready(function() {   
		$('.progress .progress-bar').progressbar({display_text: 'fill'}); 
		$("#aprovAceptar").css("display","none");
		
		
	});
	
	function loading(percent){
// 		$('.progress span').animate({width:percent},1000,function(){
// 			$(this).children().html(percent);
//             if(percent=='100%'){
//               $('.progress span').css('text-align','center');
//                 $(this).children().html('Aprovisionamiento Exitoso');
                
//             }
// 		})


		$pb = $('.progress .progress-bar');  
		$pb.attr('data-transitiongoal', percent).progressbar({display_text: 'fill'});
	}
	


 


	
	function aceptarAprov()
	{
    	//actualiza campo aprovisionamiento
   	var parametros = "folio="+'<%=foliopisa%>'+"&telefono="+'<%=telefono%>'+"&lbr="+'<%=lbr%>'+"&accion=actualizar";
	$.ajax({
			url: '../Aprovisionar?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				datosjson = $.parseJSON(resp);
				if(datosjson.res.trim()=="OK")
				{

					window.opener.cargaTareas();
					window.close();
					
				}
				else
				{
					swal("Error al aprovisionar orden", "", "error");
//					alert("Error al despachar orden");
				}
			}
	});
    }
	
  </script> 
</html>


<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Validaci&oacute;n</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px;" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Consultar OS en PISA</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px; text-align: center" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Consultar Perfil</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Consultar Horizon</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Aprovisionar HSI ONT Q</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Consultar Modelo de ONT</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Aprovisionar Usuario VSI</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa  fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">CPE Aprovisionamiento</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa  fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Notificado a PISA</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa  fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Activar PTR PTS</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Portabilidad VSI</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Creando Perfil</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->
<!--         			 		<tr> -->
<!--         			 			<td style="background-color: #f4f7ff;font-weight: bold;">Finalizar Proceso</td> -->
<!--         			 			<td style="text-align: center">2 minutos</td> -->
<!--         			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px" class="fa fa-check-circle"></span></td> -->
<!--         			 		</tr> -->