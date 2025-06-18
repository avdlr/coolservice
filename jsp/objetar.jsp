<%@page import="java.awt.List"%>
<%@ page import="bean.ConsultaTareasObjetadas"%>
<%@ page import="clases.TareasObjetadas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="iso-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%
	
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "";//numObj
	
 	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
 	
 	ConsultaTareasObjetadas ConsultaTareasObjetadas= new ConsultaTareasObjetadas();
 	int numObj = ConsultaTareasObjetadas.obtieneNumeroObjecion(lbr,foliopisa);
 	int cantidadMaxObj = ConsultaTareasObjetadas.obtieneCantidadMaximaObjeciones(lbr);
 	ArrayList<TareasObjetadas> lista = ConsultaTareasObjetadas.obtieneTareasObjetadas(folioplex,lbr);
//  	int numObj=0;
// 	if(lista.size()>0){
// 		numObj=lista.size();
// 	}
	
%>
    <title>Portal PIC 10</title>
    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/css/jquery-ui.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
<!--     <link href="../assets/css/style.css" rel="stylesheet"> -->
<!--     <link href="../assets/css/style-responsive.css" rel="stylesheet"> -->
<!--     <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet"> -->
    <link href="../assets/css/sweetalert.css" rel="stylesheet">
<!--     <link href="../assets/select2/select2.min.css" rel="stylesheet"> -->
    
    <script src="../assets/js/jquery-1.12.4.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<!--     <script src="../assets/js/jquery.dataTables.min.js"></script> -->
<!--     <script src="../assets/js/dataTables.bootstrap.min.js"></script> -->
    <script src="../assets/js/sweetalert.min.js"></script>
<!--     <script src="../assets/js/loading-mask.js"></script> -->
<!--     <script src="../assets/select2/select2.min.js"></script> -->
 <!--     <script src="../assets/js/main.js"></script>-->
    
  </head>
<body>
<script type="text/javascript">
// Validar atributo maxlengh en IE
$(document).on('observaciones keyup', 'textarea[maxlength]', function(e) {
    var $this = $(this);
    var maxlength = $this.attr('maxlength');
    if (!!maxlength) {
        var text = $this.val();
        if (text.length > maxlength) {
            // truncate excess text (in the case of a paste)
            $this.val(text.substring(0,maxlength));
            e.preventDefault();
        }
    }
});
	

function consultaMotivos(tipoObjecion)
{
	var longitud =  document.getElementById('cmbmotivos').options.length;
    for(var i =0;i< longitud;i++)
    {
    	document.getElementById('cmbmotivos').remove(0);	 	    	
    }	  
   	
   	var opt;
  	opt = document.createElement('option');
 	opt.value = "";
    opt.innerHTML = 'Seleccione';
    document.getElementById('cmbmotivos').appendChild(opt);
	    
	var objecion = $("#cmbtipoobjecion option:selected").val();
	var motivo = $("#cmbmotivos option:selected").val();
	var observaciones=  $("#observaciones").val();
	    
	if(tipoObjecion != "")
	{
		$("#cmbmotivos").prop("disabled",false);
		
		var datosjson = null;
			$.ajax({
			url: "../ConsultaMotivos?lbr="+'<%=lbr%>'+"&tipoObjecion="+tipoObjecion+"&opcion=combo",
			cache: false,
			type: "POST",
			success:function(res){
				datosjson = $.parseJSON(res);
				var opt;
				//llena combo motivos
				//opt = document.createElement('option');
//   			opt.value = "";
//   			opt.id="";
//     			opt.innerHTML = 'Seleccione';
				$.each(datosjson.Motivos, function(i, item)
			    {
 	       			opt = document.createElement('option');
		 	       		opt.value = item.id;
					    opt.innerHTML = item.desc;
					    document.getElementById('cmbmotivos').appendChild(opt);
			    		
		 	    });
		}
		});
		
	}else
	{
		$("#cmbmotivos").prop("disabled",true);
		$("#cmbmotivos").val("");
	}
	
	   	
}

function objetarTarea()
{
	var foliopisa=<%=foliopisa%>;
	var numeroObjecion=<%=numObj%>;
	var numMaxObj=<%=cantidadMaxObj%>;
	if(numeroObjecion < numMaxObj)
	{
		numeroObjecion= numeroObjecion+1;
		var objecion = $("#cmbtipoobjecion option:selected").val();
		var motivo = $("#cmbmotivos option:selected").val();
		var observaciones=  $("#observaciones").val();
		var usuario="WASGRAFICO";
		var parametros = "lbr="+'<%=lbr%>'+"&folioplex="+'<%=folioplex%>'+"&foliopisa="+'<%=foliopisa%>'+"&numObjecion="+numeroObjecion+"&opcion=objetarTarea";
		if(objecion!=null){parametros+="&tipoobjecion="+objecion;}
 		if(motivo!=""){parametros+="&motivo="+motivo;}
 		if(observaciones!=""){parametros+="&observaciones="+observaciones;}
 		if(usuario!=""){parametros+="&usuario="+usuario;}
 		
 		
 		
		if(objecion!="" && motivo !="" && observaciones!= "")
		{
				$.ajax({
				url: "../ObjetarTarea?"+parametros,
				type: "GET",
				cache: false,
				success: function( resp ) {
					 if(resp != "ERROR")
					 {	
							swal({
	            	    		title: "",  
	            	    		text: "La objeción se realizo correctamente.",   
	                			type: "success",   
	                			showCancelButton: false,   
	                			confirmButtonColor: "#3a5a74",   
	                			confirmButtonText: "Aceptar",   
	                			closeOnConfirm: true }, 
	                			function(){
	                				//Borrar tarea del panel de Tareas
	                				window.parent.opener.cargaTareas();
	                				parent.borrarTarea('<%=foliopisa%>','objetar');
	                				location.reload(true);
	                				
	                        		});   
	
					 }
					 else
					 {
						swal("", "Error al objetar la tarea, intentelo nuevamente.", "error");
					 }
				}
			});
		}else{
			swal("", "Datos incompletos, verifique por favor.", "error");
		}

		
	}else{
		swal("", "La tarea solo se puede objetar "+numMaxObj+" veces.", "error");
		$("#observaciones").val("");
		$("#cmbtipoobjecion").val("");
		$("#cmbmotivos").val("");
	}
	
		 		
} 
function limpiar()
{
	$("#observaciones").val("");
	$("#cmbtipoobjecion").val("");
	$("#cmbmotivos").val("");
	
}
</script>
<section class="wrapper" style="margin-top: 0px;">
<div class="row mt" style="margin:5px;">
<div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-10 col-lg-10"><h5><b>Accion: </b>Objetar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
<div class="col-xs-12 col-sm-2 col-lg-2"><h5> <b>No. objeci&oacute;n:</b> <%=numObj%> </h5></div>
</div>

	<div class="row" style="background-color: #77a2ce;padding-bottom: 12px;padding-top: 10px;">
		<div class="col-sm-6 col-md-4 col-lg-4">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-3" style="color:#FFFFFF;">
		Tipo de objeci&oacute;n:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="cmbtipoobjecion" class="form-control input-sm" onchange="consultaMotivos(this.value)">
				<option value="">Seleccionar...</option>
				<option value="POR CLIENTE">POR CLIENTE</option>
				<option value="TECNICA">TECNICA</option>
			</select>
		</div>
		</div>
		</div>	
		<div class="col-sm-6 col-md-4 col-lg-8">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4 col-lg-1" style="color:#FFFFFF;">
		M&oacute;tivo:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="cmbmotivos" class="form-control input-sm" disabled>
				<!-- <option value="">Seleccionar...</option>
				<option value="AUSENCIA">No se encontraba</option>
				<option value="SIN PERMISO">No dio permiso</option>
				<option value="NO">No era lo que esperaba</option> -->
			</select>
		</div>
		</div>
		</div>
		</div>		
</div>
<!-- <div class="row" style="margin:5px;"> -->
<!-- <div class="col.xs-12"><button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button></div> -->
<!-- </div> -->

<div class="row" style="margin: 5px; padding-top: 50px">
<div class="col-md-12">
<div class="form-group">
  <label for="observaciones" style="font-size: 17px; font-weight: bold;">Observaciones:</label>
  <textarea class="form-control" rows="5" maxlength="290" id="observaciones"></textarea>
</div>
<div class="row" style="text-align:right; padding-right: 35px">
		<button class="btn btn-warning" onclick="limpiar()" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		<button class="btn btn-objetar" onclick="objetarTarea()" style="margin 2px;"><span class="fa fa-gavel"></span> Objetar Tarea</button>
</div>
<div class="form-group" style="padding-top: 20px;">
  <label for="tablaTareas" style="font-size: 17px; font-weight: bold;">Historial de observaciones:</label>
  <table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px; min-width: 300px">
        <thead>
            <tr>
		  		<th style="width: 15%">Fecha</th>
                <th style="width: 15%">Usuario</th>
                <th style="width: 70%">Observaci&oacute;n</th>
            </tr>
        </thead>
        <tbody>
       <% 
        	int i;
 			TareasObjetadas objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (TareasObjetadas)lista.get(i);
					
		%>
            <tr class="clickable-row">
                <td  align="center" ><%=objDetalle.getFecha() %></td>
                <td><%=objDetalle.getUsuario() %></td>
                <td><%=objDetalle.getObservaciones() %></td>                
            </tr>
		  <%} %>
           
        </tbody>
    </table>
</div>
</div>
</div>
</section>
</body>
    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>
    <!--script for this page-->
    