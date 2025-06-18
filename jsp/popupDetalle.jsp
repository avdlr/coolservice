<%@ page import="bean.ConsultaTareasObjetadas"%>
<%@ page import="clases.TareasObjetadas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page import="java.util.Random"%>
<%@ page import="bean.ConsultaTareas"%>
<%@ page import="clases.Tarea"%>
<%@ page import="clases.CambiosEstado"%>
<%@ page import="bean.ConsultaReasignaciones"%>
<%@ page import="bean.RestAPI_Functions"%>
<%@ page import="clases.Reasignaciones"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="iso-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%

	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): "";
	String expediente = request.getParameter("expediente") != null ? request.getParameter("expediente"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	String serieONT_BD="";
	Random rnd = new Random();
	int numRan= (int)(rnd.nextDouble() * 130);
	double porcentaje = numRan/130D *100D;
	
	String username="36000036";
	String tipotarea="TS1LPBT";
	String division="MN";
	String area="EB";
	String cope="CTTEU";
	String dropid="MOR-CUAUTLA-9:40-48-36-44-18";
	ConsultaTareas consulta= new ConsultaTareas();
	ArrayList<Tarea> listaTareas = consulta.obtieneDetalleTarea(folioplex,lbr);
	ArrayList<CambiosEstado> listaCambiosEstados = consulta.obtieneCambiosEstados(folioplex, lbr);
	
	ConsultaTareasObjetadas ConsultaTareasObjetadas= new ConsultaTareasObjetadas();
 	ArrayList<TareasObjetadas> lista = ConsultaTareasObjetadas.obtieneTareasObjetadas(folioplex,lbr);
 
 	ConsultaReasignaciones  consultaReasignaciones= new ConsultaReasignaciones();
 	ArrayList<Reasignaciones> listaReasignaciones = consultaReasignaciones.obtienerReasignaciones(folioplex, lbr);
 	
 	RestAPI_Functions ins = new RestAPI_Functions();
	JSONArray listaFases = ins.obtenerFasesAprov(lbr);
	
	
	
 	
 	
 	String estado_aprov= listaTareas.get(0).getAprovisionamiento().toString();
	if(estado_aprov.trim().equals("PROCESO")){
		serieONT_BD = ins.obtenerONT_Solicitud("125372410",lbr);
	}
 	
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
    <script type="text/javascript" src="../assets/js/bootstrap-progressbar.js"></script>

    
  </head>
<body>

<script type="text/javascript">
var longitud=0;
var cadena="";
var validarCadena="";


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

$.extend( true, $.fn.dataTable.defaults, {
    //"autoWidth":true,
    "searching": false,
    "lengthChange": false, 
    "ordering": false
    /*"columnDefs": [
    { "width": "300px" },
    { "width": "300px" },
    { "width": "500px" }
  ]*/
} );



$(document).ready(function ()
{
	 var estadoAprov='<%=estado_aprov.trim()%>';
	if(estadoAprov!=""){
		$('#serieONT').val('<%=serieONT_BD.trim()%>');
	} 
	 
	 $('#tablaEstados').DataTable();
	 $('#tablaReasignaciones').DataTable({
	 "autoWidth":false,
	 "columnDefs": [
    { "width": "100px" },
    { "width": "100px" },
    { "width": "100px" },
    { "width": "500px" },
    { "width": "200px" }
  		]
	 });
	//$("#iframeMemo").html('<div id="divLoading"><img style=" margin-left:45%; margin-top:20%;" width="100px" src="../assets/img/loading.gif"></img></div>');
	$("#iframeMemo").load('<%=request.getContextPath()%>' + '/zntjsp/memo.jsp?folioplex='+<%=folioplex%>);
});


function recargaMemo(folioplex)
{
	//$("#iframeMemo").html('<img style=" margin-left:45%; margin-top:20%;" width="100px" src="../assets/img/loading.gif"></img>');
	$("#iframeMemo").load('<%=request.getContextPath()%>' + '/zntjsp/memo.jsp?folioplex='+folioplex);
} 

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
   <% 
        	int cont;
 			Tarea obj1;
				for ( cont = 0; cont < listaTareas.size(); cont++) {
					obj1 = (Tarea)listaTareas.get(cont);
		 %>


  <section id="container" style="margin-top: 0px;">
  <div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Acci&oacute;n: </b> Detalle de la Tarea &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>
  <div id="detalleTareas">
<ul class="nav nav-tabs" id="myTabs" style="background-color: whitesmoke">
    <li class="active"><a data-toggle="tab" id="tabDetalle" href="#home">Datos Tarea</a></li>
    <li><a data-toggle="tab" id="tabCambiosEstado" href="#cambiosEstado">Cambios de Estado</a></li>
    <li><a data-toggle="tab" id="tabMemo" href="#memo">Memo</a></li>
    <li><a data-toggle="tab" id="tabAprovisionamiento" href="#aprovisionamiento">Aprovisionamiento</a></li>
    <li><a data-toggle="tab" id="tabPruebasCalidad" href="#pruebasCalidad">Pruebas de Calidad</a></li>
    <li><a data-toggle="tab" id="tabReasignaciones" href="#reasignaciones">Reasignaciones</a></li>
  </ul>
  <div class="tab-content">
  <div id="home" class="tab-pane fade in active" style="margin: 5px;">
  <h4>Datos de la Tarea</h4>
  	<form>
    <fieldset>
    	<div class="row" style="width: 100%; padding-left: 15px;">
    		<div class="col-xs-12 col-sm-12 col-lg-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Tarea</div>
    	</div>
    	<div class="row" style="padding-top: 5px; padding-left:15px; width:100%;">
    		
    		<div class="col-xs-1" style="font-weight: bold;">Divisi&oacute;n: </div>
    		<div class="col-xs-2">
					<label id="detalleDivision"><%= obj1.getDivision()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">&Aacute;rea: </div>
    		<div class="col-xs-2">
    			<label id="detalleArea"><%= obj1.getArea()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Cope: </div>
    		<div class="col-xs-2">
					<label id="detalleCope"><%= obj1.getCope()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Empresa: </div>
    		<div class="col-xs-2">
					<label id="detalleEmpresa"><%= obj1.getEmpresa()%></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Folio Plex: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPlex"><%= obj1.getFolioPisaPlex()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Folio Pisa: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPisa"><%= obj1.getFolioPisa()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel&eacute;fono: </div>
    		<div class="col-xs-2">
					<label id="detalleTelefono"><%= obj1.getTelefono()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tecnolog&iacute;a: </div>
    		<div class="col-xs-2">
					<label id="detalleTecnologia"><%= obj1.getTecnologia()%></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Exp Plex: </div>
    		<div class="col-xs-2">
    			<label id="detalleExpedientePlex"><%= obj1.getExpedienteplex()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Distrito: </div>
    		<div class="col-xs-2">
    			<label id="detalleDistrito"><%= obj1.getDistrito()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T. Tarea: </div>
    		<div class="col-xs-2">
    			<label id="detalleTipoTarea"><%= obj1.getTipoTarea()%></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Estado: </div>
    		<div class="col-xs-2">
    			<%if(obj1.getEstado().trim().equals("COMPLETE")){%><label id="detalleEstado">LIQUIDADA</label><% }else{%> 
    			<label id="detalleEstado"><%=obj1.getEstado()%> </label><%} %>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Dilaci&oacute;n: </div>
    		<div class="col-xs-2">
    			<label id="detalleDilacion"><%=obj1.getDilacion() %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Gesti&oacute;n</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">F.Pendiente:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaPendiente"><%=obj1.getFechaPendiente() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Expediente:</div>
    		<div class="col-xs-2">
    			<label id="detalleExpediente"><%=obj1.getExpediente() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T&eacute;cnico:</div>
    		<div class="col-xs-2">
    			<label id="detalleTecnico"><%=obj1.getTecnico() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Aprovisionado:</div>
    		<div class="col-xs-2">
    			<label id="detalleAprovisionamiento"><%=obj1.getAprovisionamiento() %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		<div class="col-xs-1" style="font-weight: bold;">F. Aprov:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAprovisionamiento"><%=obj1.getFechaAprovisionamiento() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Asig:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAsignada"><%=obj1.getFechaAsignada() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Despa</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaDespachada"><%=obj1.getFechaDespachada() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Liqui:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaLiquidada"><%=obj1.getFechaLiquidacion() %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">Facilidades:</div>
    		<div class="col-xs-2">
    			<label id="detalleFacilidades"><%=obj1.getFacilidades() %></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Cliente<div style="background-color: #FFFFFF; padding-right: 1px;"></div></div><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 2px;">Datos Cita</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cont:</div>
    		<div class="col-xs-2">
    			<label id="detalleTelefonoContacto"><%=obj1.getTelefonoContacto() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cel:</div>	
    		<div class="col-xs-2">
    			<label id="detalleTelefonoCelular"><%=obj1.getTelefonoCelular() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F.Cont Rpda:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaContRpda"><%=obj1.getFechaCont() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Cita:</div>	
    		<div class="col-xs-2">
    			<label id="detalleFechaCita"><%=obj1.getFechaCita() %></label>
    		</div>
    	</div>

    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF;padding-left: 15px;">&nbsp;</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tipo:</div>
    		<div class="col-xs-2">
				<label id="detalleTipo"><%=obj1.getTipo() %></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Valor Asignado:</div>
    		<div class="col-xs-2">
				<label id="detalleValorAsignado"><%=obj1.getValorAsignado() %></label>
    		</div>
    		
    	</div>
    	<% } %>
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
	    		
	    		<div class="col-xs-7 col-md-9 col-lg-10"><input class="form-control input-sm" type="text" id="serieONT" placeholder="Escriba el número de serie ONT" required="required" disabled></div>
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

<!--   <a class="btn btn-danger" onclick="llamarAprovisionar()"> -->
<!--   <i class="fa fa-cogs fa-1x"></i> Aprovisionar</a> -->
  
  <%if(estado_aprov.trim().equals("PROCESO")){ %>
  <a class="btn btn-primary" onclick="consultaestatus()">
  <i class="fa fa-retweet fa-1x"></i> Consultar Estatus</a>
  <%} else{%>
  <a class="btn btn-primary" disabled="disabled" onclick="consultaestatus()">
  <i class="fa fa-retweet fa-1x"></i> Consultar Estatus</a>
  <%} %>
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
    			 <table class="table table-bordered table-striped table-condensed" style="font-size: 12px; width: 100%">
    			 <thead>
		            <tr>
				  		<th style="background-color: #335485; width: 50%">Fase&nbsp;del&nbsp;Aprovisionamiento</th>
		                <th style="background-color: #335485; width: 30%">Tiempo&nbsp;Promedio de Ejecuci&oacute;n</th>
		                <th style="background-color: #335485; width: 20%">Estatus</th>
		            </tr>
        		</thead>
        			 	<tbody>
        			 	<% 
				        	
				 			 JSONObject objFases;
								for ( i = 0; i < listaFases.length(); i++) {
									objFases =  listaFases.getJSONObject(i);
						%>
						
						<tr>
       			 			<td style="background-color: #f4f7ff;font-weight: bold;"><%= objFases.getString("descripcion")%></td>
       			 			<td style="text-align: center"><%= objFases.getString("tiempo")%> minutos</td>
       			 			<td style="text-align: center"></td>
<!--        			 			<td style="text-align: center"><span style="color: #0e9c0d; font-size:18px;" class="fa fa-check-circle"></span></td> -->
        			 	</tr>
						
						 <%} %>
        			 	</tbody>
        			 </table>
	    		</div>
	    		</div>
	    		
	    		
	    	</fieldset>
	    		</form>
	    	</div>
  	</div> 
  	<!-- FIN DEL APROVISIONAMIENTO -->
  	
  	<div id="pruebasCalidad" class="tab-pane fade">
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
  	</div>
  	<div id="reasignaciones" class="tab-pane fade">
 	 	 	 	<div class="row" style="margin: 5px; ">
 	 	<div class="form-group">
 	 	<h4>Reasignaci&oacute;n de T&eacute;cnicos</h4>
  <table id="tablaReasignaciones" class="table table-striped table-bordered" style="font-size:11px; min-width: 500px">
        <thead>
            <tr>
		  		<th style="width: 10%">Fecha/Hora</th>
                <th style="width: 10%">Empresa</th>
                <th style="width: 15%">Expediente</th>
                <th style="width: 35%">Nombre del T&eacute;cnico</th>
                <th style="width: 15%">Acci&oacute;n</th>
            </tr>
        </thead>
        <tbody>
       <% 
        	int c;
 			Reasignaciones obj2;
				for ( c = 0; c < listaReasignaciones.size(); c++) {
					obj2 = (Reasignaciones)listaReasignaciones.get(c);
					
		%>
            <tr class="clickable-row">
                <td  align="center" ><%=obj2.getFecha() %></td>
                <td><%=obj2.getEmpresa() %></td>
                <td><%=obj2.getExpediente() %></td> 
                <td><%=obj2.getNombretecnico() %></td> 
                 <%if(obj2.getAccion().trim().equals("Asignacion")) {%><td>Asignaci&oacute;n</td><%} else{%><td>Reasignaci&oacute;n</td><%} %> 
            </tr>
		  <%} %>
           
        </tbody>
    </table>
</div>
</div>
  	</div>
  </div>
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
											
											}else{
												$("#barraAprovisionamiento").css("display","none");
												swal("",datosjson.descripcion.trim(),"success");
												$("label[for='myalue']").html(datosjson.json.trim());
											}
										}
										else
										{
											var descripcion;
											if(datosjson.code == 401){
												descripcion="Token Inválido, favor de generar un token nuevo.";
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
									swal("Error","La longitud de la serie es inválido","error");
									$('#serieONT').focus().val(serieONT);;
								}
								
	            				//$('#serieONT').focus().val(cadena);;
								//dialog.dialog( "close" );
								//limpiarFiltros('GA');
							 }
							 else
							 {
								swal("Error","El Proveedor ingresado en la serie del equipo es inválido","error");
								$('#serieONT').focus().val(serieONT);
							 }
						}
				});
		}else
		{
			swal("","Ingrese la serie ONT del equipo","error");
			$('#serieONT').focus();
		}
		
		
// 		$("#aprovAprovisionar").css("display","none");
// 		$("#aprovConsEstatus").css("display","block");
		//$("#aprovAceptar").css("display","block");
		
	}
	
	function pruebaTestDique()
	{

		var accion = 'testDique';
<%--  var parametros = "foliopisa="+'<%=foliopisa%>'+"&telefono="+'<%=telefono%>'+"&tipotarea="+'<%=tipotarea%>'+"&division="+'<%=division%>'+"&area="+'<%=area%>'+"&cope="+'<%=cope%>'+"&dropid="+'<%=dropid%>'+"&lbr="+'<%=lbr%>'+"&accion=testDique"; --%>
				 var parametros = "foliopisa=001220043&telefono=5577980019&tipotarea=A91LP4S&division=MN&area=EB&cope=CTTEU&dropid=MOR-CUAUTLA-9:40-48-36-44-18&lbr=QAS&accion=testDique";

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
								descripcion="Token Inválido, favor de generar un token nuevo.";
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
												$("#barraAprovisionamiento").css("display","none");
												swal("Petición Aceptada","Petición en Proceso (Código " + datosjson.code+")","info");
												$("label[for='myalue']").html(datosjson.json.trim());
											
											}else{
												$("#barraAprovisionamiento").css("display","none");
												swal("",datosjson.descripcion.trim(),"success");
												$("label[for='myalue']").html(datosjson.json.trim());
											}
										}
										else
										{
											var descripcion;
											if(datosjson.code == 401){
												descripcion="Token Inválido, favor de generar un token nuevo.";
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
									swal("Error","La longitud de la serie es inválido","error");
									$('#serieONT').focus().val(serieONT);;
								}
								
	            				//$('#serieONT').focus().val(cadena);;
								//dialog.dialog( "close" );
								//limpiarFiltros('GA');
							 }
							 else
							 {
								swal("Error","El Proveedor ingresado en la serie del equipo es inválido","error");
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
	
	function obtenerDatosValidacion(){
		var parametros="lbr="+'<%=lbr%>'+"&accion=validarCadena";
		$.ajax({
					url: '../RestAPI_Operations?'+parametros,
					type: "GET",
					cache: false,
					success: function( resp ) {
						datosjson = $.parseJSON(resp);
						 if(datosjson.code.trim()=="SUCCESS"){
						 	longitud=parseInt(datosjson.longitud.trim());
						 	cadena=datosjson.cadena.trim();
						 	validar=datosjson.validarCadena.trim();
								$('#serieONT').attr('maxlength', longitud);
            					$('#serieONT').focus().val(cadena);;
							//dialog.dialog( "close" );
							//limpiarFiltros('GA');
						 }
						 else{
							longitud=0;
							cadena="";
							validar="";
						 }
					}
				});
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

    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
    