<%
	String folio = request.getParameter("folio") != null ? request.getParameter("folio"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "";
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
	<title>Asignar Tarea a T&eacute;cnico</title>
	
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
	<script>
	function aceptarPruebas(){
		var observaciones = $("#observacionesLiq").val();
		var tipoobj = $("#tipoObjPruebas option:selected").val();
		var parametros = "folio="+'<%=folio%>'+"&tipoobj="+tipoobj+"&observaciones="+observaciones+"&lbr=<%=lbr%>";
		$.ajax({
				url: '../Pruebas?'+parametros,
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
						swal("Error al hacer pruebas", "", "error");
					}
					
				}
		});
	}
	</script>
<div class="row" style="width: 100%; padding-left: 15px;">
    		<div class="col-xs-12" style="font-size:16px; font-weight: bold; background-color: #335485; color:#FFFFFF; padding: 15px;">Pruebas</div>
 </div>
<div style="width:97%; margin-top: 20px; padding-left: 15px;">
<!-- 	<form> -->
	    <fieldset>
	    	<div class="row">
	    		<div class="col-xs-12" style="font-weight: bold;">¿Desea objetar la solicitud Cambaceo Preliquidaci&oacute;n? Preliquidaci&oacute;n</div>
	    		<div class="col-xs-12">SI <input type="radio" name="radioObjetar" value="SI"/> NO <input type="radio" name="radioObjetar" value="NO"/></div>
	    		<div class="col-xs-6" style="font-weight: bold;">Tipo de Objeci&oacute;n: </div>
	    		<div class="col-xs-6"><select class="form-control input-sm"><option>Seleccionar...</option></select></div>
	    		<div class="col-xs-6" style="font-weight: bold;">Observaciones: </div>
	    		<div class="col-xs-6"><textarea class="form-control" rows="5" id="observacionesLiq"></textarea></div>
	    		
	    	</div>
	    </fieldset>
<!-- 	</form> -->
</div>
<div class="col-xs-12" style="margin-top: 10px; text-align: right;">
 	<button id="aprovCerrar" class="btn btn-primary" onclick="cerrarPopup()">Cerrar</button>
 	<button style="display: inline-block;" id="aprovAprovisionar" class="btn btn-primary" onclick="aceptarPruebas()">Verificar Servicio</button>
 </div>