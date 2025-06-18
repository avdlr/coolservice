<!DOCTYPE html>
<html lang="en">
  <head>
<!--     <meta charset="utf-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%
	String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "testDique";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "001220043";
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "121313";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "5577980019";
	String tipotarea = request.getParameter("tipotarea") != null ? request.getParameter("tipotarea"): "A91LP4S";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "MN";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "EB";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "CTTEU";
	String dropid = request.getParameter("dropid") != null ? request.getParameter("dropid"): "MOR-CUAUTLA-9:40-48-36-44-18";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
%>
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
	<title>Pruebas de Calidad</title>
	
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
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Acci&oacute;n: </b> Prueba testDique &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>
<div style="width:97%; padding-top: 15px; padding-left: 15px;">
<!-- 	<form> -->
	    <fieldset>
	    <legend>Datos para la prueba testDique</legend>
	    	<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Folio&nbsp;Pisa:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=foliopisa %></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Tel&eacute;fono:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=telefono %></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Tipo&nbsp;de&nbsp;Tarea:&nbsp;&nbsp;</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=tipotarea%></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>División:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=division%></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Área:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=area%></div>
	    		</div>
	    		<div class="row">
	    		<div class="col-xs-12" style="height:8px">&nbsp;</div>
	    		<div class="col-xs-5 col-md-3 col-lg-2" ><b>Cope:</b></div>
	    		<div class="col-xs-7 col-md-9 col-lg-10"><%=cope%></div>
	    		</div>
	    		
<!-- 	    		<div class="col-xs-12" > -->
<!-- 	    			<div class="row"> -->
<!-- 	    				<div id = "aprovAprovisionar" class="col-xs-4"><button class="btn btn-primary" onclick="llamarAprovisionar()" style="margin 2px;"> Aprovisionar</button></div> -->
<!-- 	    				<div id = "aprovConsEstatus" class="col-xs-4"><button class="btn btn-primary" onclick="" style="margin 2px;"> Consultar Estatus</button></div> -->
<!-- 	    				<div id = "aprovCerrar" class="col-xs-4"><button class="btn btn-primary" onclick="" style="margin 2px;"> Cerrar</button></div> -->
<!-- 	    			</div> -->
<!-- 	    		</div> -->
				
	    		<div class="col-xs-12">&nbsp;</div>
	    		<div class="col-xs-12" style="margin-top: 10px; text-align: left;">
<!-- 			    	<i class="fa fa-cog fa-spin fa-3x fa-fw"></i> -->
<!-- <span class="sr-only">Loading...</span> -->

<!--   <a class="btn btn-danger" onclick="llamarAprovisionar()"> -->
<!--   <i class="fa fa-cogs fa-1x"></i> Aprovisionar</a> -->
  <a class="btn btn-success" onclick="pruebaTestDique()">
  <i class="fa fa-play fa-1x"></i> &nbsp;Realizar Prueba</a>
  
<!-- 			    	<button style="display: inline-block;" id="aprovAprovisionar" class="btn btn-danger fa fa-cog fa-spin fa-3x fa-fw" onclick="llamarAprovisionar()"> Aprovisionar</button> -->
<!-- 			    	<button style="display: inline-block;" id="aprovConsEstatus" class="btn btn-primary" onclick="consultaestatus()">Consultar Estatus</button> 
			    	<button style="display: inline-block;" id="aprovAceptar" class="btn btn-primary" onclick="aceptarAprov()">Aceptar</button>-->
			    </div>
			    <div class="col-xs-12">&nbsp;</div>
<!-- 	    		<div class="col-xs-12"><div class="progress"> <span class="blue" style="width:0%;"><span>0%</span></span> </div></div> -->
				
				<div class="col-xs-12 col-sm-12 col-lg-12" id="Respuesta"><label style="width: 95%; word-wrap: break-word;" for="myalue"></label></div>
	    		
	    	</fieldset>
	    	<!-- 	</form> -->
	    	</div>
	    </section>
</body>

<script type='text/javascript'>
	function pruebaTestDique()
	{

		var accion = 'testDique';
				 var parametros = "foliopisa="+'<%=foliopisa%>'+"&telefono="+'<%=telefono%>'+"&tipotarea="+'<%=tipotarea%>'+"&division="+'<%=division%>'+"&area="+'<%=area%>'+"&cope="+'<%=cope%>'+"&dropid="+'<%=dropid%>'+"&lbr="+'<%=lbr%>'+"&accion=testDique";

				$.ajax({
					url: '../RestAPI_Operations?'+parametros,
					type: "GET",
					cache: false,
					success: function( resp ) {
						datosjson = $.parseJSON(resp);
						 if(datosjson.respuesta.trim()=="SUCCESS"){
							 if(datosjson.code == 202){
								$("#barraAprovisionamiento").css("display","none");
								swal("Petición Aceptada","Petición en Proceso (Código " + datosjson.code+")","info");
							}else{
								$("#barraAprovisionamiento").css("display","none");
								swal("",datosjson.descripcion.trim(),"success");
								$("label[for='myalue']").html(datosjson.json.trim());
								//window.opener.cargaTareas();
								//window.close();
							}
						 
						 }
						 else{
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
		
	}
	
	
  </script> 
</html>