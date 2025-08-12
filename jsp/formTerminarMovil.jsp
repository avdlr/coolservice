<%@page import="bean.GestionTareas"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion"): ""; 
	String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): ""; 
	ConsultaCatalogo catalogos = new ConsultaCatalogo();

	JSONArray listaproveedores = catalogos.consultaProveedores();
	
	GestionTareas llamado = new GestionTareas();
    JSONArray registros = llamado.consultaDetalleOrden(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }
    JSONArray equipos = catalogos.consultaEquipos(registro.getString("idsucursal"));
    JSONArray servreal = catalogos.consultaServicioRealizado();
    JSONObject equreg = new JSONObject();
    

%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Terminar Orden</title>
</head>
<body>
<!-- <div class="row"> -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="alta-tab" data-toggle="tab" href="#alta" role="tab" aria-controls="alta" aria-selected="true" onclick="cambioTab('Alta')">Det. Orden</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="terminar-tab" data-toggle="tab" href="#terminar" role="tab" aria-controls="terminar" aria-selected="false" onclick="cambioTab('Terminar')">Info. Terminar</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="facturas-tab" data-toggle="tab" href="#facturas" role="tab" aria-controls="facturas" aria-selected="false" onclick="cambioTab('Facturas')">Facturas</a>
  </li>

</ul>
<div  id="loadingfrm" style="height: 100%;">
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show in active" id="alta" role="tabpanel" aria-labelledby="alta-tab">
 <div id="tabAlta">
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Orden:</div>
	<div class="col-xs-8"><input type="text" id="frmordenServicio" style="width:100%;" class="form-control"  placeholder="Orden de Servicio" value="<%=orden%>"/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">&Uacute;ltimo T&eacute;cnico:</div>
	<div class="col-xs-8"><input disabled type="text" id="frmultimotec" style="width:100%;" class="form-control"  placeholder="nombre del tecnico" value="<%=registro.getString("tecnico")%>"/></div>
	
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">

<div class="row">
	<div class="col-xs-4">Tipo de Mmto:</div>
	<div class="col-xs-8">
		<input type="text" id="frmtipomantenimiento" style="width:100%;" class="form-control" value="<%=registro.getString("tipoorden")%>" />
		</div>
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Cliente:</div>
	<div class="col-xs-8">
		<input type="text" id="frmcliente" style="width:100%;" class="form-control" value="<%=registro.getString("empresa")%>" >
		
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Sucursal:</div>
	<div class="col-xs-8">
		<input type="text" id="frmsucu" style="width:100%;" class="form-control" value="<%=registro.getString("sucursal")%>" >
		
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-4">Domicilio:</div>
	<div class="col-xs-8">
	<textarea disabled class="form-control" rows="5" id="frmdireccion" style="width:100%;" ><%=registro.getString("domicilio")%></textarea>
<%-- 	<input type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="nombre de la dirección" value="<%=registro.getString("domicilio")%>"/> --%>
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Ciudad:</div>
	<div class="col-xs-8"><input type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad" value="<%=registro.getString("ciudad")%>"/></div>	
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Estado:</div>
	<div class="col-xs-8"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="nombre del estado" value="<%=registro.getString("estado")%>"/></div>
</div>
</div>

<!-- <div class="col-xs-12" style="padding-top: 5px;"> -->
<!-- <div class="row"> -->
<!-- 	<div class="col-xs-4">Gerente/ Supervisor:</div> -->
<%-- 	<div class="col-xs-8"><input type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente" value="<%=registro.getString("gerente")%>"/></div> --%>
	
	
<!-- </div> -->
<!-- </div> -->

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-4">Fecha de Reporte:</div>
	<div class="col-xs-8">
                    <input disabled type='text' class="form-control" id='ffecharegistro2' value="<%=registro.getString("fecha")%>"/>
    </div>	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
    <div class="col-xs-4">Hora Reporte:</div>
	<div class="col-xs-8"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="Hora" value="<%=registro.getString("hora")%>"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Raz&oacute;n del Servicio:</div>
	<div class="col-xs-8">
		<input disabled type="text" id="razonserv" style="width:100%;" class="form-control" value="<%=registro.getString("razonservicio")%>" >
		
	</div>

</div>
</div>
</div>

</div>
  <div class="tab-pane fade" id="terminar" role="tabpanel" aria-labelledby="terminar-tab">
<div id="tabTerminar">
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Recibido por:</div>
	<div class="col-xs-8"><input type="text" disabled id="recibidopor" style="width:100%;" class="form-control"  placeholder="Nombre de quien recibió" value="<%=registro.getString("RecibidoPorNombre")%>"/></div>
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Puesto:</div>
	<div class="col-xs-8"><input type="text" disabled id="puestorecibido" style="width:100%;" class="form-control"  placeholder="Puesto de quien recibió" value="<%=registro.getString("RecibidoPorPuesto")%>"/></div>
</div>
</div>
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Nombre Equipo:</div>
	<div class="col-xs-8"><select  id="nombreequipo" style="width:100%;" class="form-control"  placeholder="Nombre del equipo" onchange="combiaOtroEquipo(this.value)">
	<option value="">Seleccionar...</option>
	<%
		for(int i= 0; i<equipos.length(); i++)
		{
			equreg = equipos.getJSONObject(i);
			%>
				<option value="<%=equreg.getString("id")%>"><%=equreg.getString("nombre")%></option>
			<%
		}
	%>
	<option value="OTRO">OTRO</option>
	</select>
	<input type="text" id="otroNombreEquipo" style="width:100%; display: none; margin-top: 5px;" class="form-control"  placeholder="Nombre del equipo"/>
	</div>
	
</div>
</div>


<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Marca:</div>
	<div class="col-xs-8"><input disabled type="text" id="marca" style="width:100%;" class="form-control"  placeholder="Marca del equipo"/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	
	<div class="col-xs-4">Modelo:</div>
	<div class="col-xs-8"><input disabled type="text" id="modelo" style="width:100%;" class="form-control"  placeholder="modelo equipo"/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">#Serie:</div>
	<div class="col-xs-8"><input disabled type="text" id="serie" style="width:100%;" class="form-control"  placeholder="# de serie del equipo"/></div>
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Voltaje:</div>
	<div class="col-xs-8"><input type="text" id="voltaje" style="width:100%;" class="form-control"  placeholder="voltaje equipo"/></div>
</div>
</div>
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Amperes:</div>
	<div class="col-xs-8"><input type="text" id="amperes" style="width:100%;" class="form-control"  placeholder="amperes equipo"/></div>

</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Servicio Realizado:</div>
	<div class="col-xs-8"><select  id="servreal" style="width:100%;" class="form-control"  placeholder="" onchange="cambiaotroServReal(this.value)">
		<option value="">Seleccionar...</option>
		<%
			for(int i= 0; i<servreal.length(); i++)
			{
				equreg = servreal.getJSONObject(i);
				%>
					<option value="<%=equreg.getString("value")%>"><%=equreg.getString("descripcion")%></option>
				<%
			}
		%>
		<option value="OTRO">OTRO</option>
	</select>
	<input type="text" id="otroServicioReal" style="width:100%; display: none; margin-top: 5px;" class="form-control"  placeholder="Describir servicio realizado"/>
	</div>

</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Comentarios:</div>
	<div class="col-xs-8"><input type="text" id="comentarios" style="width:100%;" class="form-control"  placeholder=""/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Cond. de Operaci&oacute;n (psi):</div>
	<div class="col-xs-4"><input type="text" id="cond1" style="width:100%;" class="form-control"  placeholder="psi"/></div>
	<div class="col-xs-4"><input type="text" id="cond2" style="width:100%;" class="form-control"  placeholder="psi"/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Temp. de Operaci&oacute;n:</div>
	<div class="col-xs-4"><input type="text" id="tempopera" style="width:100%;" class="form-control"  placeholder=""/></div>
	<div class="col-xs-4"><input type="radio" name="tempounidad" value="C"/> <label style="display:inline-block;">°C</label> &nbsp;&nbsp;&nbsp;<input type="radio" name="tempounidad" value="F" /> °F</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	
	<div class="col-xs-4">Voltaje:</div>
	<div class="col-xs-8"><input type="text" id="voltaje2" style="width:100%;" class="form-control"  placeholder=""/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Amperes:</div>
	<div class="col-xs-8"style="padding-top: 5px;"><input type="text" id="amperes2" style="width:100%;" class="form-control"  placeholder=""/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px; display:none;">
<div class="row">
	<div class="col-xs-4"style="padding-top: 5px; ">Servicio Terminado:</div>
	<div class="col-xs-8"><input type="radio"  name="servterminado" value="SI"/> Si&nbsp;&nbsp;&nbsp; <input type="radio"  name="servterminado" value="NO"/> No</div>
</div>
</div>			

<div class="col-xs-12" style="padding-top: 5px; display:none;">
<div class="row">
	<form>
	<div class="col-xs-4">T&eacute;cnico en Servicio:</div>
	<div class="col-xs-8"><input type="text" id="tenicoserv" style="width:100%;" class="form-control"  placeholder=""/></div>
	
	</form>
</div>
</div>
</div>
</div>




<div class="tab-pane fade" id="facturas" role="tabpanel" aria-labelledby="facturas-tab">
<div id="tabFacturas">
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Folio Factura:</div>
	<div class="col-xs-8"><input type="text" id="frmfoliofact" style="width:100%;" class="form-control"  placeholder="Folio de Factura"/></div>
	
</div>
</div>	

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Proveedor:</div>
	<div class="col-xs-8">
<!-- 	<input type="text" id="frmproveedor" style="width:100%;" class="form-control"  placeholder="Proveedor de factura"/> -->
	<select  id="frmproveedor" class="form-control input-sm" onchange="" >
				<option value="">Seleccionar...</option>
				<%
					JSONObject registroProveedor = new JSONObject();
					for (int i=0; i<listaproveedores.length(); i++)
					{
						registroProveedor = listaproveedores.getJSONObject(i);
						%>
							<option value="<%=registroProveedor.getString("value")%>"><%=registroProveedor.getString("description")%></option>
						<%
					}
				%>
			
			</select>
	</div>
</div>
</div>	
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Monto:</div>
	<div class="col-xs-8"><input type="text" id="frmmonto" style="width:100%;" class="form-control"  placeholder="monto de factura"/></div>
</div>
</div>	
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-6"><button class="btn btn-default" onclick="consultaFacturas('A')" style="margin 2px;"><span class="fa fa-file"></span> Agregar Factura</button></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-12" id="tablaFacturasAjax" style="overflow: auto;">

	</div>

</div>
</div>	
</div>
</div>
</div>
</div>
<!-- </div> -->
<script type="text/javascript">
// $(function(){
	var equiposlista = $.parseJSON('<%=equipos.toString()%>');
	 $(document).ready(function() {
		 
		 $("#voltaje").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
// 		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#amperes").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#cond1").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#cond2").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#tempopera").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#voltaje2").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 $("#amperes2").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
//		        alert(e.keyCode);
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190,109]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		 
		 $('#ffecharegistro').datetimepicker(
					{
//	 					 format: 'YYYY-MM-DD HH:MM:ss' 
						format: 'YYYY-MM-DD' 
					});
// 		 $("#nombreequipo").select2( {dropdownParent: $("#dialog")});
// 		 $("#servreal").select2( {dropdownParent: $("#dialog")});
		 if('<%=accion%>'=="A")
			{
//		 		alert("Hola");
				$("#marca").css('display','none');  
				$("#serie").css('display','none');  
				$("#modelo").css('display','none');  
				$("#voltaje").css('display','none');  
				$("#amperes").css('display','none');  
				$("#razonserv").css('display','none');  
				$("#servreal").css('display','none');  
				$("#comentarios").css('display','none');  
				$("#cond1").css('display','none');  
				$("#cond2").css('display','none');  
				$("#tempopera").css('display','none');  
				$("#voltaje2").css('display','none');  
				$("#amperes2").css('display','none');  
				$("#tenicoserv").css('display','none');  
				$("#formtecnico").css('display','none');  
				$("#frmdireccion").attr('disabled','disabled'); 
				$("#frmciudad").attr('disabled','disabled'); 
				
			}
                        else
                        {
                                $("#frmordenServicio").attr('disabled','disabled');
                                $("#frmcliente").attr('disabled','disabled');
                                $("#frmdireccion").attr('disabled','disabled');
                                $("#frmciudad").attr('disabled','disabled');
                                $("#frmsucu").attr('disabled','disabled');
                                $("#frmgerente").attr('disabled','disabled');
                                $("#frmtipomantenimiento").attr('disabled','disabled');
                                $("#frmultimotec").attr('disabled','disabled');
                        }

                        if($('#formtecnico').is(':hidden') && $('#frmtipomantenimiento').val() === 'PREVENTIVO'){
                                $('#aceptarform').on('mousedown', function(){
                                        $('#marca, #serie, #modelo, #comentarios, #cond1, #cond2, #tenicoserv').val('NA');
                                        $('#voltaje, #amperes, #tempopera, #voltaje2, #amperes2').val('0');
                                        $('#servreal').prop('selectedIndex',1);
                                        $('#nombreequipo').prop('selectedIndex',1);
                                        $('input[name=servterminado]').first().prop('checked',true);
                                        $('input[name=tempounidad]').first().prop('checked',true);
                                });
                        }


                 consultaFacturas("C");
		 $("#otroNombreEquipo").attr('maxlength','50');
		 $("#marca").attr('maxlength','50');
		 $("#modelo").attr('maxlength','50');
		 $("#serie").attr('maxlength','50');
		 $("#voltaje").attr('maxlength','8');
		 $("#amperes").attr('maxlength','8');
		 $("#otroServicioReal").attr('maxlength','1000');
		 $("#comentarios").attr('maxlength','1000');
		 
		 $("#cond1").attr('maxlength','8');
		 $("#cond2").attr('maxlength','8');
		 $("#tempopera").attr('maxlength','8');
		 $("#voltaje2").attr('maxlength','8');
		 $("#amperes2").attr('maxlength','8');
		 $("#frmfoliofact").attr('maxlength','50');
		 $("#frmmonto").attr('maxlength','12');
		 $("#loadingfrm").mLoading('hide');
		 
		 
		 $("#container").mLoading("hide");


 });
	 
	 function consultaFacturas(accionFact)
	 {
		 
		 var foliofactura = $("#frmfoliofact").val();
		 var proveedor = $("#frmproveedor").val();
		 
		 var proveedornombre = $( "#frmproveedor option:selected" ).text();
		
		 var monto = $("#frmmonto").val();
		
		 var parametros = "orden=<%=idorden%>&usuario=<%=usuario%>&accionFact="+accionFact+"&foliofactura="+foliofactura+"&proveedor="+proveedor+"&monto="+monto+"&accion=CONFACT";
		if(accionFact=="C")
		{
			$("#tablaFacturasAjax").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
			$.ajax({
				url: 'tablaFacturas.jsp?'+parametros,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					
					 $("#tablaFacturasAjax").html(resp);
					 $("#frmfoliofact").val('');
					 $("#frmproveedor").val('');
					 $("#frmmonto").val('');
//	 				 $("#btnAsigMasiva").css("display",'none');
				}
		  });
		}
		else
		{
			if(foliofactura=="" || proveedor=="" || monto=="")
			{
				swal("", "Todos los campos son obligatorios", "error");
			}
			else{
			$("#tablaFacturasAjax").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
			 $.ajax({
					url: '../GestionaTarea?'+parametros,
					type: "GET",
					cache: false,
					
					success: function( resp ) {
						datosjson = $.parseJSON(resp);
						 
	 					if(datosjson.length>0)
	 					{
	 					
	 					    $.each(datosjson, function(i, item)
	 					    {
	 					    	
								if(item.resp=="OK")
								{
									$.ajax({
										url: 'tablaFacturas.jsp?'+parametros,
										type: "GET",
										cache: false,
										
										success: function( resp ) {
											
											 $("#tablaFacturasAjax").html(resp);
											 $("#frmfoliofact").val('');
											 $("#frmproveedor").val('');
											 $("#frmmonto").val('');
//							 				 $("#btnAsigMasiva").css("display",'none');
										}
								  });
								}
								else
								{
									
									swal("", "Ya existe la factura \""+foliofactura+"\" con el proveedor \""+proveedornombre+"\"", "error");
									 parametros = "orden=<%=idorden%>&usuario=<%=usuario%>&accionFact=C&foliofactura="+foliofactura+"&proveedor="+proveedor+"&monto="+monto+"&accion=CONFACT";
									$.ajax({
										url: 'tablaFacturas.jsp?'+parametros+"&accionFact=C",
										type: "GET",
										cache: false,
										
										success: function( resp ) {
											
											 $("#tablaFacturasAjax").html(resp);
										
//							 				 $("#btnAsigMasiva").css("display",'none');
										}
								  });
								}
	 					    });
	 					}
					}
			  });
			}
		}
		
	 		
	 }
	 
	 function combiaOtroEquipo(valor)
	 {
		 var banderaequipo=true;
		 if(valor=="OTRO")
		{
			 $("#marca").val(""); 
			 $("#modelo").val(""); 
			 $("#serie").val(""); 
			 $("#marca").attr('disabled',false); 
			 $("#modelo").attr('disabled',false); 
			 $("#serie").attr('disabled',false); 
			 $("#otroNombreEquipo").css("display","inline");
		 }
		 else
	     {
			 
			 $.each(equiposlista, function(i, item)
		    {
		    	if(item.id==valor)
		    	{
		    		banderaequipo=false;
				 $("#marca").val(item.marca); 
				 $("#modelo").val(item.modelo); 
				 $("#serie").val(item.serie); 
		    	}	
		    		
	 	    });
			 if(banderaequipo)
			{
				 $("#marca").val(""); 
				 $("#modelo").val(""); 
				 $("#serie").val("");  
			}
			 $("#marca").attr('disabled',true); 
			 $("#modelo").attr('disabled',true); 
			 $("#serie").attr('disabled',true); 
			 $("#otroNombreEquipo").css("display","none");
	     }
	 }
	 
	 function cambiaotroServReal(valor)
	 {
		 if(valor=="OTRO")
		{
			 $("#otroServicioReal").css("display","inline");
		}
		 else
		{
			 $("#otroServicioReal").css("display","none");
		}
		 
	 }
	 
	 function cambioTab(id)
	 {
		 
		 
		 $("#tabAlta").css("display","none");
		 $("#tabTerminar"+id).css("display","none");
		 $("#tabFacturas"+id).css("display","none");
		 
		 $("#tab"+id).css("display","inline");
	 }

	 
	
// });
</script>
</body>
</html>