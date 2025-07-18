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
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray empresas = catalogos.consultaEmpresa();
	JSONArray tipomantenimiento = catalogos.consultaTipoTrabajo("");
	JSONArray razonserv = catalogos.consultaRazonServ();
	JSONArray prioridad = catalogos.consultaPrioridad();
	JSONArray zonas = catalogos.consultaZonas();

%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Capturar Incidente</title>
</head>
<body>
<!-- <div class="row"> -->
<div  id="loadingfrm" style="height: 100%;">
<div class="col-xs-12">

<div class="row">
<!-- 	<div class="form-group" id="sec-frmordenServicio" > -->
	<div class="col-xs-2">Orden de Servicio:</div>
	<div class="col-xs-4"><input type="text" id="frmordenServicio" style="width:100%;" class="form-control "  placeholder="Orden de Servicio" onfocusout="validaorden(this.value)"/></div>
<!-- 	</div> -->
<!-- 	<div id="sec-frmultatencion" class="form-group"> -->
	<div class="col-xs-2">&Uacute;ltimo T&eacute;cnico:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmultatencion" style="width:100%;" class="form-control"  placeholder="nombre del tecnico"/></div>
<!-- 	</div> -->
</div>
</div>


<div class="col-xs-12" style="padding-top: 5px;">

<div class="row">
<!-- 	<div id="sec-frmtipomantenimiento" class="form-group"> -->
	<div class="col-xs-2">Tipo de Mantenimiento:</div>
	<div class="col-xs-4"><select id="frmtipomantenimiento" style="width:100%;" class="form-control"  >
		<option value="">Seleccionar..</option>
		<%
			JSONObject registro = new JSONObject();
			for (int i=0; i<tipomantenimiento.length(); i++)
			{
				registro = tipomantenimiento.getJSONObject(i);
				%>
					<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>
	 </select>
	 </div>
<!-- 	 </div> -->
<!-- 	 <div id="sec-frmultimotec" class="form-group"> -->
	 <div class="col-xs-2">Fecha &Uacute;ltima Atenci&oacute;n:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmultimotec" style="width:100%;" class="form-control"  placeholder="Fecha de última atención"/></div>
<!-- 	</div> -->
</div>
</div>

<div class="col-xs-12" id="sec-tipopreventivo" style="padding-top: 5px; display:none;">
<div class="row">
        <div class="col-xs-2">Formato Preventivo:</div>
        <div class="col-xs-4">
            <select id="frmtipopreventivo" style="width:100%;" class="form-control">
                <option value="">Seleccionar..</option>
                <option value="aire">Mantenimiento de Aire Condicionado</option>
                <option value="refrigeracion">Mantenimiento Refrigeracion</option>
            </select>
        </div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<!-- 	<div id="sec-frmcliente" class="form-group"> -->
	<div class="col-xs-2">Cliente:</div>
	<div class="col-xs-4">
		<select id="frmcliente" style="width:100%;" class="form-control" onchange="consultasucursalesAlta(this.value,'')" >
		<option value="">Seleccionar..</option>
		<%
			registro = new JSONObject();
			for (int i=0; i<empresas.length(); i++)
			{
				registro = empresas.getJSONObject(i);
				%>
					<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>
	 </select>
	</div>
<!-- 	</div> -->
<!-- 	<div id="sec-frmsucu" class="form-group"> -->
	<div class="col-xs-2">Zona:</div>
	<div class="col-xs-4">
		<select id="frmzona" style="width:100%;" class="form-control" onchange="consultasucursalesAlta(this.value,'')" >
		<option value="">Seleccionar..</option>
		<%
			registro = new JSONObject();
			for (int i=0; i<zonas.length(); i++)
			{
				registro = zonas.getJSONObject(i);
				%>
					<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>

	 </select>
	</div>
	
	
	
<!-- 	</div> -->
</div>
</div>

<!-- <div class="col-xs-12" style="padding-top: 5px;"> -->
<!-- <div class="row"> -->
<!-- 	<div class="col-xs-2">Sub Zona:</div> -->
<!-- 	<div class="col-xs-4"> -->
<!-- 		<select id="frmsubzona" style="width:100%;" class="form-control" onchange="" disabled> -->
<!-- 		<option value="">Seleccionar..</option> -->

<!-- 	 </select> -->
<!-- 	</div> -->
<!-- </div></div> -->

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Sucursal:</div>
	<div class="col-xs-4">
		<select id="frmsucu" style="width:100%;" class="form-control" onchange="consultadetallesucursal(this.value)" >
		<option value="">Seleccionar..</option>

	 </select>
	</div>
	<div class="col-xs-2">Domicilio:</div>
	<div class="col-xs-4"><input type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="nombre de la dirección"/></div>
	
	
	
	
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Estado:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="nombre del estado"/></div>
<!-- 	<div id="sec-frmgerente" class="form-group"> -->
	<div class="col-xs-2">Ciudad:</div>
	<div class="col-xs-4"><input type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad"/></div>

<!-- 	</div> -->
	
</div>
</div>
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">

<!-- 	<div class="col-xs-2">Gerente/Supervisor:</div> -->
<!-- 	<div class="col-xs-4"><input type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente"/></div> -->
<!-- 	</div> -->
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-2">Fecha de Reporte:</div>
	<div class="col-xs-4"><div class='input-group date' id='ffecharegistro'>
                    <input type='text' class="form-control" id='ffecharegistro2' />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div></div>
    <div class="col-xs-2">Hora Reporte:</div>
	<div class="col-xs-4"><input  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="HH:MM"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Raz&oacute;n del Servicio:</div>
	<div class="col-xs-10">
		<select id="razonserv" style="width:100%;" class="form-control" onchange="habilitarOtro(this.value)" >
		<option value="">Seleccionar..</option>
		<%
			registro = new JSONObject();
			for (int i=0; i<razonserv.length(); i++)
			{
				registro = razonserv.getJSONObject(i);
				%>
					<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>
		<option value="OTRO">OTRO</option>
	    </select>
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;" id="secOtro">
<div class="row">
	<div class="col-xs-2">Otro:</div>
	<div class="col-xs-10">

		<input type="text" id="razonservotro" style="width:100%; margin-top: 5px;" class="form-control"  placeholder="Describir razón del servicio"/>
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Prioridad:</div>
	<div class="col-xs-10">
		<select id="prioridad" style="width:100%;" class="form-control" onchange="" >
		<option value="">Seleccionar..</option>
		<%
			registro = new JSONObject();
			for (int i=0; i<prioridad.length(); i++)
			{
				registro = prioridad.getJSONObject(i);
				%>
					<option value="<%=registro.getString("tiempo")%>-<%=registro.getString("unidad")%>-<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>
	    </select>
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div style="background-color: #929498; height: 1px; width: 100%;"></div>
</div>
<div id="formtecnico">
<div class="col-xs-12" style="padding-top: 25px;">
<div class="row">
	<div class="col-xs-2">Marca:</div>
	<div class="col-xs-4"><input type="text" id="marca" style="width:100%;" class="form-control"  placeholder="Marca del equipo"/></div>
	<div class="col-xs-2">#Serie:</div>
	<div class="col-xs-4"><input type="text" id="serie" style="width:100%;" class="form-control"  placeholder="# de serie del equipo"/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Modelo:</div>
	<div class="col-xs-2"><input type="text" id="modelo" style="width:100%;" class="form-control"  placeholder="modelo equipo"/></div>
	<div class="col-xs-2">Voltaje:</div>
	<div class="col-xs-2"><input type="text" id="voltaje" style="width:100%;" class="form-control"  placeholder="voltaje equipo"/></div>
	<div class="col-xs-2">Amperes:</div>
	<div class="col-xs-2"><input type="text" id="amperes" style="width:100%;" class="form-control"  placeholder="amperes equipo"/></div>
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Servicio Realizado:</div>
	<div class="col-xs-10"><input type="text" id="servreal" style="width:100%;" class="form-control"  placeholder=""/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Comentarios:</div>
	<div class="col-xs-10"><input type="text" id="comentarios" style="width:100%;" class="form-control"  placeholder=""/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Condiciones de Operaci&oacute;n:</div>
	<div class="col-xs-2"><input type="text" id="cond1" style="width:100%;" class="form-control"  placeholder="AMP"/></div>
	<div class="col-xs-2"><input type="text" id="cond2" style="width:100%;" class="form-control"  placeholder="AMP"/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Temperatura de Operaci&oacute;n::</div>
	<div class="col-xs-2"><input type="text" id="tempopera" style="width:100%;" class="form-control"  placeholder=""/></div>
	<div class="col-xs-2">Voltaje:</div>
	<div class="col-xs-2"><input type="text" id="voltaje2" style="width:100%;" class="form-control"  placeholder=""/></div>
	<div class="col-xs-2">Amperes:</div>
	<div class="col-xs-2"><input type="text" id="amperes2" style="width:100%;" class="form-control"  placeholder=""/></div>
</div>
</div>	

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">T&eacute;cnico en Servicio:</div>
	<div class="col-xs-4"><input type="text" id="tenicoserv" style="width:100%;" class="form-control"  placeholder=""/></div>
	<div class="col-xs-2">Servicio Terminado:</div>
	<div class="col-xs-2"><input type="radio" class="servterm" style="" class=""/>Si</div>
	<div class="col-xs-2"><input type="radio" class="servterm"   style="" class=""/>No</div>
</div>
</div>
</div>
</div>
<!-- </div> -->
<script type="text/javascript">
// $(function(){
	 $(document).ready(function() {
		 
		 
		 $('#ffecharegistro').datetimepicker(
					{
//	 					 format: 'YYYY-MM-DD HH:MM:ss' 
						format: 'YYYY-MM-DD' 
					});
		 $("#ffecharegistro").keypress(function(event) {event.preventDefault();});
		 if('<%=accion%>'=="A")
			{
//		 		alert("Hola");
				$("#marca").css('display','none');  
				$("#serie").css('display','none');  
				$("#modelo").css('display','none');  
				$("#voltaje").css('display','none');  
				$("#amperes").css('display','none');  
				$("#secOtro").css('display','none');  
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
// 				$("#frmgerente").attr('disabled','disabled'); 
				$("#frmtipomantenimiento").attr('disabled','disabled'); 
				$("#frmultimotec").attr('disabled','disabled'); 
			}
		 $("#frmcliente").select2(
				 {
					 dropdownParent: $("#dialog")
				 });
		 $("#frmzona").select2({
			 dropdownParent: $("#dialog")
		 });
		 $("#frmsucu").select2({
			 dropdownParent: $("#dialog")
		 });
		 $("#frmsucu").prop("disabled",true);
		 $("#frmtipomantenimiento").select2({
			 dropdownParent: $("#dialog")
		 });
		 
		 $("#sec-tipopreventivo").hide();
		    $("#frmtipomantenimiento").on("change", function(){
		        var t = $("#frmtipomantenimiento option:selected").text().trim();
		        if(t === "MANTENIMIENTO PREVENTIVO"){
		            $("#sec-tipopreventivo").show();
		        }else{
		            $("#sec-tipopreventivo").hide();
		            $("#frmtipopreventivo").val("");
		        }
		    });
		    		    
		    $("#frmtipopreventivo").on("change", function(){
		        var v = $(this).val();
		        if(v === "aire"){
		        	var orden = $("#frmordenServicio").val();
				    window.open("../maintenance-form?orden=" + encodeURIComponent(orden), "_blank");		        	
		        }else if(v === "refrigeracion"){
		        	var orden = $("#frmordenServicio").val();
				    window.open("../refrigeracion-form?orden=" + encodeURIComponent(orden), "_blank");		        	
		        }
		    });
		    $("#frmtipomantenimiento").trigger("change");
		 
		 $('#frmhorareg').mask('00:00');
// 		 $("#razonserv").select2({
// 			 dropdownParent: $("#dialog")
// 		 });
		 
// 		 $("#prioridad").select2({
// 			 dropdownParent: $("#dialog")
// 		 });
		 
		 $("#frmordenServicio").attr('maxlength','50');

// 		 $("#frmgerente").attr('maxlength','150');
// 		 $("#frmhorareg").attr('maxlength','6');
		 $("#razonservotro").attr('maxlength','1000');
		 
		 $("#container").mLoading("hide");
		 
		 

 });
	 
	 function consultaSubZonasFrm (idzona)
	 {
		 $("#frmdireccion").val("");
		 $("#frmestado").val("");
		 $("#frmciudad").val("");
// 		 var paramcliente = $("#frmcliente").val();
		 
		 var zona = $("#frmzona").val();
		 param="accion=SUBZONA";
		
// 		 if(paramcliente!=""){param+="&empresa="+paramcliente;}
		 if(zona!=""){param+="&zona="+zona;}
		 $.ajax({
				url: '../GestionaTarea?'+param,
				cache: false,
				success: function( resp ) {
					datosjson = $.parseJSON(resp);
					 
					if(datosjson.length>0)
					{
					
						$('#frmsubzona').html("");
						
						var opt;
					  	opt = document.createElement('option');
					 	opt.value = "0";
					    opt.innerHTML = 'Seleccione';
					    document.getElementById('frmsubzona').appendChild(opt);
					   
					    $.each(datosjson, function(i, item)
					    {
					    	
		 	       				opt = document.createElement('option');
				 	       		opt.value = item.value;
// 				 	       		opt.id = item.ciudad;
// 				 	       		opt.class= item.direccion;
							    opt.innerHTML = item.description;
							    document.getElementById('frmsubzona').appendChild(opt);
							    
							   
					    		
				 	    });
// 					    alert($('#frmsucu').html());
					    $("#frmsubzona").select2( {
							 dropdownParent: $("#dialog")
						 });
					    $("#frmsubzona").prop("disabled",false);
					}
					else
					{
						$('#frmsubzona').html("<option value=''>Seleccionar...</option>");
						  $("#frmsubzona").select2();
						  $("#frmsubzona").prop("disabled",true);
					}
				}
		});
	 }
	 
	 function consultasucursalesAlta (idempresa,idzona)
	 {
		 $("#frmdireccion").val("");
		 $("#frmestado").val("");
		 $("#frmciudad").val("");
		 var paramcliente = $("#frmcliente").val();
		 
		 var zona = $("#frmzona").val();
		 param="accion=SUCURSALES";
		
		 if(paramcliente!=""){param+="&empresa="+paramcliente;}
		 if(zona!=""){param+="&zona="+zona;}
		 $.ajax({
				url: '../GestionaTarea?'+param,
				cache: false,
				success: function( resp ) {
					datosjson = $.parseJSON(resp);
					 
					if(datosjson.length>0)
					{
					
						$('#frmsucu').html("");
						
						var opt;
					  	opt = document.createElement('option');
					 	opt.value = "0";
					    opt.innerHTML = 'Seleccione';
					    document.getElementById('frmsucu').appendChild(opt);
					   
					    $.each(datosjson, function(i, item)
					    {
					    	
		 	       				opt = document.createElement('option');
		 	       				opt.value = item.value+":"+item.subzona;
// 				 	       		opt.id = item.ciudad;
// 				 	       		opt.class= item.subzona;
							    opt.innerHTML = item.description;
							    document.getElementById('frmsucu').appendChild(opt);
							    
							   
					    		
				 	    });
// 					    alert($('#frmsucu').html());
					    $("#frmsucu").select2( {
							 dropdownParent: $("#dialog")
						 });
					    $("#frmsucu").prop("disabled",false);
					}
					else
					{
						$('#frmsucu').html("<option value=''>Seleccionar...</option>");
						  $("#frmsucu").select2();
						  $("#frmsucu").prop("disabled",true);
					}
				}
		});
	 }
	 
	 function consultadetallesucursal (idsucursal)
	 {
		
		 $.ajax({
				url: '../GestionaTarea?sucursal='+idsucursal+"&accion=DS",
				cache: false,
				success: function( resp ) {
					datosjson = $.parseJSON(resp);
					 
					if(datosjson.length>0)
					{

					   
					    $.each(datosjson, function(i, item)
					    {
					    	
		 	       			$("#frmciudad").val(item.ciudad);
		 	       			$("#frmdireccion").val(item.domicilio);
		 	       			$("#frmestado").val(item.estado);
					    		
				 	    });
					    

					}
					else
					{
						$("#frmciudad").val("");
	 	       			$("#frmdireccion").val("");
	 	       			$("#frmestado").val("");
					}
				}
		});
	 }
	 
	 function habilitarOtro(valor)
	 {
		 if(valor=="OTRO")
		 {
			 $("#secOtro").css("display","inline");
		 }
		 else
	     {
			 $("#secOtro").css("display","none");
	     }
	 }
	 
	 function validaorden(folioorden)
	 {
		 $.ajax({
				url: '../GestionaTarea?orden='+folioorden+"&accion=VALIDAORDEN",
				cache: false,
				success: function( resp ) {
					datosjson = $.parseJSON(resp);
					 
					if(datosjson.length>0)
					{
					   
					    $.each(datosjson, function(i, item)
					    {
					    	if(item.estatus!="CERRADO")
							{
					    		swal("Ya existe esta orden de servicio en curso!", "", "error");
					    		$("#frmordenServicio").val("");
					    		setTimeout(function() { $('#frmordenServicio').focus() }, 3000);
							}
					    	else
					    	{
					    		
					    		$('#frmultimotec').val(item.tecnico);
								$('#frmultatencion').val(item.fecha);
					    	}
					    	
					    		
				 	    });
					    
					    
					}
					else
					{
						$('#frmultimotec').val("");
						$('#frmultatencion').val("");
					}
				}
		});
	 }
		
	
// });
</script>
</body>
</html>