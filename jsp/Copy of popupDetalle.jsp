<%@ page import="bean.ConsultaTareasObjetadas"%>
<%@ page import="clases.TareasObjetadas"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="bean.ConsultaTareas"%>
<%@ page import="clases.CambiosEstado"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%

	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "";
	String tecnologia = request.getParameter("tecnologia") != null ? request.getParameter("tecnologia"): "";
	String expedienteplex = request.getParameter("expedienteplex") != null ? request.getParameter("expedienteplex"): "";
	String distrito = request.getParameter("distrito") != null ? request.getParameter("distrito"): "";
	String tipotarea = request.getParameter("tipotarea") != null ? request.getParameter("tipotarea"): "";
	String estado = request.getParameter("estado") != null ? request.getParameter("estado"): "";
	String dilacion = request.getParameter("dilacion") != null ? request.getParameter("dilacion"): "";
	String telefonocelular = request.getParameter("telefonocelular") != null ? request.getParameter("telefonocelular"): "";
	String telefonocontacto = request.getParameter("telefonocontacto") != null ? request.getParameter("telefonocontacto"): "";
	String fechacontrpda = request.getParameter("fechacontrpda") != null ? request.getParameter("fechacontrpda"): "";
	String fechacita = request.getParameter("fechacita") != null ? request.getParameter("fechacita"): "";
	String fechapendiente = request.getParameter("fechapendiente") != null ? request.getParameter("fechapendiente"): "";
	String expediente = request.getParameter("expediente") != null ? request.getParameter("expediente"): "";
	String tecnico = request.getParameter("tecnico") != null ? request.getParameter("tecnico"): "";
	String aprovisionamiento = request.getParameter("aprovisionamiento") != null ? request.getParameter("aprovisionamiento"): "";
	String fechaaprovisionamiento = request.getParameter("fechaaprovisionamiento") != null ? request.getParameter("fechaaprovisionamiento"): "";
	String fechaasignada = request.getParameter("fechaasignada") != null ? request.getParameter("fechaasignada"): "";
	String fechadespachada = request.getParameter("fechadespachada") != null ? request.getParameter("fechadespachada"): "";
	String fechaliquidada = request.getParameter("fechaliquidada") != null ? request.getParameter("fechaliquidada"): "";
	String facilidades = request.getParameter("facilidades") != null ? request.getParameter("facilidades"): "";
	String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): "";
	String valorasignado = request.getParameter("valorasignado") != null ? request.getParameter("valorasignado"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	ConsultaTareas consulta= new ConsultaTareas();
	ArrayList<CambiosEstado> listaCambiosEstados = consulta.obtieneCambiosEstados(folioplex, lbr);
	ConsultaTareasObjetadas ConsultaTareasObjetadas= new ConsultaTareasObjetadas();
 	ArrayList<TareasObjetadas> lista = ConsultaTareasObjetadas.obtieneTareasObjetadas(folioplex,lbr);
 
%>
    <title>Portal PIC 10</title>

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
   <!-- js placed at the end of the document so the pages load faster -->
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

    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>

<script type="text/javascript">
$.extend( true, $.fn.dataTable.defaults, {
    "autoWidth":true,
    "searching": false,
    "lengthChange": false, 
    "ordering": false,
    "columnDefs": [
    { "width": "100px" },
    { "width": "100px" },
    { "width": "500px" }
  ]
} );

$(document).ready(function ()
{
	 $('#tablaEstados').DataTable();
	//$("#iframeMemo").html('<div id="divLoading"><img style=" margin-left:45%; margin-top:20%;" width="100px" src="../assets/img/loading.gif"></img></div>');
	$("#iframeMemo").load('<%=request.getContextPath()%>' + '/zntjsp/memo.jsp?folioplex='+<%=folioplex%>);
});




function recargaMemo(folioplex)
{
	//$("#iframeMemo").html('<img style=" margin-left:45%; margin-top:20%;" width="100px" src="../assets/img/loading.gif"></img>');
	$("#iframeMemo").load('<%=request.getContextPath()%>' + '/zntjsp/memo.jsp?folioplex='+folioplex);
} 
		
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

function agregarObservacion()
{
		var observaciones=  $("#observaciones").val();
		var usuario="WASGRAFICO";
		var parametros = "lbr="+'<%=lbr%>'+"&folioplex="+'<%=folioplex%>'+"&foliopisa="+'<%=foliopisa%>'+"&opcion=agregarObservacion";
 		if(observaciones!=""){parametros+="&observaciones="+observaciones;}
 		if(usuario!=""){parametros+="&usuario="+usuario;}
 		
		if(observaciones!= "")
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
	            	    		text: "La observación se agrego exitosamente.",   
	                			type: "success",   
	                			showCancelButton: false,   
	                			confirmButtonColor: "#3a5a74",   
	                			confirmButtonText: "Aceptar",   
	                			closeOnConfirm: true }, 
	                			function(){
	                				$('#observaciones').val("");
	                				recargaMemo(<%=folioplex%>);	                				
	                        		});

					 }
					 else
					 {
						swal("", "Error al agregar la observación, intentelo nuevamente.", "error");
					 }
				}
			});
		}else{
			swal("", "Debe ingresar una observación.", "error");
		}
		 		
}
/*function moverTab(){
     var tab= $("#myTabs");
     tab.find('ul.tab_nav li a').removeClass('current_tab');

     var current=tab.find($("#memo").attr('href'));
     current.addClass('active'); //Set clicked link class to active

} */
function limpiar()
{
	$("#observaciones").val("");	
}
</script>

  <section id="container" style="margin-top: 0px;">
  <div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Accion: </b>Datos de la Tarea &nbsp;<b> Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>
  <div id="detalleTareas">
<ul class="nav nav-tabs" id="myTabs" style="background-color: whitesmoke">
    <li class="active"><a data-toggle="tab" id="tabDetalle" href="#home">Datos Tarea</a></li>
    <li><a data-toggle="tab" id="tabCambiosEstado" href="#cambiosEstado">Cambios de Estado</a></li>
    <li><a data-toggle="tab" id="tabMemo" href="#memo">Memo</a></li>
    <li><a data-toggle="tab" id="tabAprovisionamiento" href="#aprovisionamiento">Aprovisionamiento</a></li>
    <li><a data-toggle="tab" id="tabPruebasCalidad" href="#pruebasCalidad">Pruebas de Calidad</a></li>
  </ul>
  <div class="tab-content">
  <div id="home" class="tab-pane fade in active">
  <h4>Datos de la Tarea</h4>
  	<form>
    <fieldset>
    	<div class="row" style="width: 100%; padding-left: 15px;">
    		<div class="col-xs-12 col-sm-12 col-lg-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Tarea</div>
    	</div>
    	<div class="row" style="padding-top: 5px; padding-left:15px; width:100%;">
    		
    		<div class="col-xs-1" style="font-weight: bold;">Divisi&oacute;n: </div>
    		<div class="col-xs-2">
					<label id="detalleDivision"><%=division %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">&Aacute;rea: </div>
    		<div class="col-xs-2">
    			<label id="detalleArea"><%=area %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Cope: </div>
    		<div class="col-xs-2">
					<label id="detalleCope"><%=cope %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Empresa: </div>
    		<div class="col-xs-2">
					<label id="detalleEmpresa"><%=empresa %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Folio Plex: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPlex"><%=folioplex %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Folio Pisa: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPisa"><%=foliopisa %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel&eacute;fono: </div>
    		<div class="col-xs-2">
					<label id="detalleTelefono"><%=telefono %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tecnolog&iacute;a: </div>
    		<div class="col-xs-2">
					<label id="detalleTecnologia"><%=tecnologia %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Exp Plex: </div>
    		<div class="col-xs-2">
    			<label id="detalleExpedientePlex"><%=expedienteplex %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Distrito: </div>
    		<div class="col-xs-2">
    			<label id="detalleDistrito"><%=distrito %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T. Tarea: </div>
    		<div class="col-xs-2">
    			<label id="detalleTipoTarea"><%=tipotarea %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Estado: </div>
    		<div class="col-xs-2">
    			<label id="detalleEstado"><%=estado %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Dilaci&oacute;n: </div>
    		<div class="col-xs-2">
    			<label id="detalleDilacion"><%=dilacion %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Gesti&oacute;n</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">F.Pendiente:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaPendiente"><%=fechapendiente %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Expediente:</div>
    		<div class="col-xs-2">
    			<label id="detalleExpediente"><%=expediente %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T&eacute;cnico:</div>
    		<div class="col-xs-2">
    			<label id="detalleTecnico"><%=tecnico %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Aprovisionado:</div>
    		<div class="col-xs-2">
    			<label id="detalleAprovisionamiento"><%=aprovisionamiento %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		<div class="col-xs-1" style="font-weight: bold;">F. Aprov:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAprovisionamiento"><%=fechaaprovisionamiento %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Asig:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAsignada"><%=fechaasignada %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Despa</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaDespachada"><%=fechadespachada %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Liqui:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaLiquidada"><%=fechaliquidada %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">Facilidades:</div>
    		<div class="col-xs-2">
    			<label id="detalleFacilidades"><%=facilidades %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Cliente<div style="background-color: #FFFFFF; padding-right: 1px;"></div></div><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 2px;">Datos Cita</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cont:</div>
    		<div class="col-xs-2">
    			<label id="detalleTelefonoContacto"><%=telefonocontacto %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cel:</div>	
    		<div class="col-xs-2">
    			<label id="detalleTelefonoCelular"><%=telefonocelular %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F.Cont Rpda:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaContRpda"><%=fechacontrpda %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Cita:</div>	
    		<div class="col-xs-2">
    			<label id="detalleFechaCita"><%=fechacita %></label>
    		</div>
    	</div>

    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF;padding-left: 15px;">&nbsp;</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tipo:</div>
    		<div class="col-xs-2">
				<label id="detalleTipo"><%=tipo %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Valor Asignado:</div>
    		<div class="col-xs-2">
				<label id="detalleValorAsignado"><%=valorasignado %></label>
    		</div>
    		
    	</div>
    	
    </fieldset>
    </form>
  </div>
   	<div id="cambiosEstado" class="tab-pane fade">
 	 	<!-- CAMBIO DE ESTADOS -->
 	 	<div class="row" style="margin: 5px; ">
 	 	<div class="form-group">
 	 	<h4>Cambios de Estado</h4>
  <table id="tablaEstados" class="table table-striped table-bordered" style="font-size:11px; ">
        <thead>
            <tr>
		  		<th style="width: 15%">Estatus Anterior</th>
                <th style="width: 20%">Calificador Anterior</th>
                <th style="width: 15%">Fecha</th>
                <th style="width: 15%">Estatus Nuevo</th>
                <th style="width: 20%">Calificador Nuevo</th>
                <th style="width: 15%">Usuario</th>
            </tr>
        </thead>
        <tbody>
       <% 
        	int i;
 			CambiosEstado obj;
				for ( i = 0; i < listaCambiosEstados.size(); i++) {
					obj = (CambiosEstado)listaCambiosEstados.get(i);
					
		%>
            <tr class="clickable-row">
                <td  align="center" ><%=obj.getEstatusAnterior() %></td>
                <td><%=obj.getCalificadorAnterior() %></td>
                <td><%=obj.getFecha() %></td> 
                <td><%=obj.getEstatusNuevo() %></td> 
                <td><%=obj.getCalificadorNuevo() %></td> 
                <td><%=obj.getUsuario() %></td>                
            </tr>
		  <%} %>
           
        </tbody>
    </table>
</div>
</div>
  	</div>
  	<div id="memo" class="tab-pane fade">
 	 	
<!-- <div class="row" style="margin:5px;"> -->
<!-- <div class="col.xs-12"><button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button></div> -->
<!-- </div> -->
<div class="row" style="margin: 5px; padding-top: 40px">
<div class="col-md-12">
<div class="form-group">
  <label for="observaciones" style="font-size: 17px; font-weight: bold;">Observaciones:</label>
  <textarea class="form-control" rows="5" maxlength="290" id="observaciones"></textarea>
</div>
<div class="row" style="text-align:right; padding-right: 35px">
		<button class="btn btn-warning" onclick="limpiar()" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		<button class="btn btn-objetar" onclick="agregarObservacion()" style="margin 2px;"><span class="fa fa-gavel"></span> Agregar observaci&oacute;n</button>
</div>
<div id="iframeMemo" style="padding-left:5px; width:100%;"></div>
</div>
</div>
  	</div>
  	<div id="aprovisionamiento" class="tab-pane fade">
 	 	Aprovisionamiento
  	</div>
  	<div id="pruebasCalidad" class="tab-pane fade">
 	 	Pruebas de Calidad
  	</div>
  </div>
  </div>
</section>
</body>

    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
    