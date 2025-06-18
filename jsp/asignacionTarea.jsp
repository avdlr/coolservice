 <%@ page import="bean.DatosExpTec"%>
 <%@page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9,edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
	
	<%
 	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
 	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "";
	String accion = request.getParameter("accion") != null ? request.getParameter("accion"): "";
	String descripcionAccion="";
	if(accion.equals("Reasignar")){
		descripcionAccion="Reasignaci&oacute;n de Tareas";
	}else if(accion.equals("Asignar")){
		descripcionAccion="Asignaci&oacute;n de Tareas";
	}
 	DatosExpTec datostecnico = new DatosExpTec();
 	JSONArray tecnicosLista = datostecnico.consultaDatosExpTec(lbr);
 	String expediente= datostecnico.obtieneExpedienteTecnico(lbr,foliopisa);
 %>
 
    <title>Portal PIC 10</title>
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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert.min.js"></script>
    <script src="../assets/js/loading-mask.js"></script>
    <script src="../assets/select2/select2.min.js"></script>
<!--     <script src="../assets/js/common-scripts.js"></script> -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    
     <script>
 var storeTecnicos = JSON.parse('<%=tecnicosLista%>');
 var storeTecnicoActual = JSON.parse('<%=tecnicosLista%>');
 
	$(function(){
// 		$("#selectTecnico").igCombo({
// 	            width: "100%",
// 	            textKey: "descripcion",
// 	            valueKey: "value",
// 	            dataSource: storeTecnicos,
// 	            filteringType: "local",
// 	            filteringCondition: "contains",
// 	            highlightMatchesMode: "contains",
// 	            placeHolder: "Buscar técnico...",
// 	            dropDownOrientation: "bottom"
// // 	         	selectionChanged: storeTecnicos
// 	        });
		$("#selectTecnico").select2({
			data:storeTecnicos,
			placeholder: "Seleccione Técnico"
		});
		$("#selectTecnico").select2("val","");
		
		$("#selectTecnicoActual").select2({
			data:storeTecnicoActual,
			placeholder: "Seleccione Técnico"
		});
		//$("#selectTecnicoActual").select2("val","EMC5522-MARIO MIEMBRO MIEMBRO CUADRILLA").trigger('change.select2');
		$('#selectTecnicoActual').val('<%=expediente%>').trigger('change.select2');
		///$('#select2').select2().select2('val', "2")
	});
	
	function asignarTecnico()
	{
  	  var expediente=$("#selectTecnico").find("option:selected").val();
  	  var nombre=$("#selectTecnico").find("option:selected").text();
  	  var foliopisa = '<%=foliopisa%>';
  	  var folioplex = '<%=folioplex%>';
  	  var accion = '<%=accion%>';
  	  parametros="tipo=ASIGNADA&estado=ASIGNADA&folioplex="+folioplex+"&foliopisa="+foliopisa+"&expediente="+expediente+"&nombre="+escape(nombre)+"&lbr="+'<%=lbr%>'+"&accion="+accion;
  	  if(expediente!="" && expediente!=undefined)
  	  {
  	    	swal({
  	    		title: "",  
  	    		text: "¿Desea asignar la orden "+foliopisa+" al tecnico "+nombre+"?",     
      			type: "info",   
      			showCancelButton: true,   
      			cancelButtonText: "Cancelar",
      			confirmButtonColor: "#3a5a74",   
      			confirmButtonText: "Aceptar",   
      			closeOnConfirm: false }, 
      			function(){
       				$.ajax({
                 			url: 'actualizaEstado.jsp?'+parametros,
                 			type: "GET",
                 			cache: false,
                 			success: function( resp ) {
                 				if(resp.trim()=="OK")
                 				{
			                 				
			                 				swal({
				            	    		title: "",  
				            	    		text: "La asignación de tarea(s) fue satisfactoria.",   
				                			type: "success",   
				                			showCancelButton: false,   
				                			confirmButtonColor: "#3a5a74",   
				                			confirmButtonText: "Aceptar",   
				                			closeOnConfirm: true }, 
				                			function(){
				                				//Borrar tarea del panel de Tareas
				                				window.parent.opener.cargaTareas();
				                				window.parent.borrarTarea('<%=foliopisa%>','asignar');
				                				location.reload(true);
				                        		}); 
                        		}
                        		else
                        		{
                        			swal("Error al ASIGNAR tarea", "", "error");
                        		}
                        	}});
              	
      			});
      			
		  
  	  }
  	  else
  		  {
  		  swal("Debe seleccionar un técnico", "", "warning");
//   		  	alert("Debe seleccionar un técnico");
  		  }
  	  
  	  }
	
	function cerrarPopup()
	{
// 		window.opener.cargaTareas();
		window.close();
	}
 </script>
</head>
<body style="text-align: :center;">
<div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Accion: </b><%=descripcionAccion %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b> Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>
<!-- <div class="row" style="width: 100%; padding-left: 15px;"> -->
<!--     		<div class="col-xs-12" style="font-size:16px; font-weight: bold; background-color: #335485; color:#FFFFFF; padding: 15px;">Asignaci&oacute;n de Tareas</div> -->
<!--  </div> -->
<section class="wrapper">
<div>

<!--   <form> -->
    <fieldset>
    <div id="dialog-form" class="row mt" style="margin:5px;">

    <div class="col-xs-12" style="margin-top: ">
      <label for="name">Folio Pisa:</label>
    </div>
    <div class="col-xs-12">
      <input class="form-control input-sm" id="foliopisaasigna" type="text" value="<%=foliopisa %>" disabled><br>
    </div>
    <% if(accion.equals("Reasignar")){ %>
    <div class="col-xs-12">
      <label for="selectTecnicoActual">T&eacute;cnico Actual:</label><br>
	</div>
	<div class="col-xs-12">
      <select id="selectTecnicoActual" style="width: 100%;" disabled></select>
     </div>
     <%} %>
    <div class="col-xs-12" style="padding-top: 20px">
      <label for="selectTecnico">T&eacute;cnico a Asignar:</label><br>
	</div>
	<div class="col-xs-12">
      <select id="selectTecnico" style="width: 100%;"></select>
     </div>
     
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
<!--       <button class="btn btn-primary"><span class="fa fa-check"></span> Aceptar</button><button class="btn btn-danger"><span class="fa fa-times"></span>Cancelar</button> -->
	</div>
    </fieldset>
    <div style="margin-top: 150px; text-align: right;">
<!--     	<button id="btnCerrar" class="btn btn-primary" onclick="cerrarPopup()">Cerrar</button> -->
    	<button style="display: inline-block;" id="btnAceptar" class="btn btn-primary" onclick="asignarTecnico()">Aceptar</button>
    </div>
<!--   </form> -->
</div>

</section>
</body>
  <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>
    <!--script for this page-->

