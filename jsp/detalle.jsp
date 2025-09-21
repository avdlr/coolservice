<%@page import="bean.GestionTareas"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): ""; 
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	
	GestionTareas llamado = new GestionTareas();
    JSONArray registros = llamado.consultaFullDetalle(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }
    String estatusActual = "";
    if(registro.has("ESTATUS"))
    {
        estatusActual = registro.getString("ESTATUS");
    }

    

%>
<style type="text/css">
.reanudar-overlay {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
}

.reanudar-dialog {
        background: #ffffff;
        border-radius: 4px;
        padding: 20px;
        max-width: 320px;
        width: 90%;
        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.3);
        text-align: center;
}

.reanudar-dialog h4 {
        margin-top: 0;
        margin-bottom: 15px;
        font-size: 18px;
}

.reanudar-dialog p {
        margin-bottom: 20px;
        font-size: 14px;
}

.reanudar-dialog .btn {
        min-width: 100px;
        margin: 0 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#container").mLoading("hide");

	var $reabrirSelect = $("#reabrirIncidencia");
	var $overlay = $("#reanudarOverlay");
	var $btnAceptar = $("#reanudarAceptar");
	var $btnCancelar = $("#reanudarCancelar");
	var requestInProgress = false;

	function cerrarPopup() {
		$overlay.fadeOut(200, function() {
			$reabrirSelect.val("");
			$btnAceptar.prop("disabled", false);
			requestInProgress = false;
		});
	}

	$reabrirSelect.on("change", function() {
		if ($(this).val() === "SI") {
			$overlay.fadeIn(200);
		}
	});

	$btnCancelar.on("click", function(e) {
		e.preventDefault();
		cerrarPopup();
	});

	$btnAceptar.on("click", function(e) {
		e.preventDefault();
		if (requestInProgress) {
			return;
		}
		requestInProgress = true;
		$btnAceptar.prop("disabled", true);

		var data = {
			orden: $("#detalleOrden").val(),
			//usuario: $("#detalleUsuario").val(),
			estatus: 2,
			//actualestatus: $("#detalleActualEstatus").val(),
			//idaccion: "REANUDAR"
		};

		$.ajax({
			url: "reanudarIncidencia.jsp",
			method: "POST",
			dataType: "json",
			data: data
		}).done(function(response) {
			var mensajeError = "No fue posible reabrir la incidencia. Intente nuevamente.";
			if ($.isArray(response) && response.length > 0) {
				var resultado = response[0];
				if (resultado.resp === "OK") {
					alert("Incidencia reabierta correctamente.");
					location.reload();
					return;
				}
				if (resultado.mensaje) {
					mensajeError = resultado.mensaje;
				}
			}
			alert(mensajeError);
		}).fail(function() {
			alert("No fue posible reabrir la incidencia. Intente nuevamente.");
		}).always(function() {
			cerrarPopup();
		});
	});
});
</script>
</head>
<body>
        <input type="hidden" id="detalleOrden" value="<%=orden%>" />
        <input type="hidden" id="detalleUsuario" value="<%=usuario%>" />
        <input type="hidden" id="detalleActualEstatus" value="<%=estatusActual%>" />
        
	<div class="col-xs-12">
		<div class="col-xs-2 col-md-2">Tipo Mantenimiento:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmtipomant" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tipoorden")%>"/></div>
		<div class="col-xs-2 col-md-2">Estatus:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmestatus" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("ESTATUS")%>"/></div>
		<div class="col-xs-2" style="margin-top: 5px;">T&eacute;cnico Asignado:</div>
		<div class="col-xs-4" style="margin-top: 5px;"><input disabled type="text" id="frmtecnicoasig" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tecnico")%>"/></div>
<%              if ("TERMINADO".equalsIgnoreCase(estatusActual)) { %>
                <div class="col-xs-12" style="margin-top: 5px;">
                        <div class="col-xs-2 col-md-2">Reabrir Incidencia:</div>
                        <div class="col-xs-4 col-md-4">
                                <select id="reabrirIncidencia" class="form-control" style="width:100%;">
                                        <option value="">NO</option>
                                        <option value="SI">SI</option>
                                </select>
                        </div>
                </div>
<%              } %>
	</div>
	
	<div class="col-xs-12" style=" margin-bottom: 5px;">
	<div style="background-color: #FFF; height: 1px; width: 100%;"></div>
	</div>

	<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 5px;">
	  <li class="nav-item">
	    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#reporte" role="tab" aria-controls="home" aria-selected="true" onclick="ocultarDetalle('reporteseg')">Reporte</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#fechas" role="tab" aria-controls="profile" aria-selected="false" onclick="ocultarDetalle('fechasseg')">Fechas</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#equipo" role="tab" aria-controls="contact" aria-selected="false" onclick="ocultarDetalle('equiposeg')">Equipo</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#servicio" role="tab" aria-controls="contact" aria-selected="false" onclick="ocultarDetalle('servicioseg')">Servicio</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#facturas" role="tab" aria-controls="contact" aria-selected="false" onclick="ocultarDetalle('facturasseg')">Facturas</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#movimientos" role="tab" aria-controls="contact" aria-selected="false" onclick="ocultarDetalle('movimientosseg')">Movimientos</a>
	  </li>
	  
	</ul>
	
	<div class="tab-content" id="myTabContent">
	  <div class="tab-pane fade show in active" id="reporte" role="tabpanel" aria-labelledby="reporte-tab">
	  <div class="col-xs-12" id="reporteseg">
	  	<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Cliente:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmcliente" style="width:100%;" class="form-control" value="<%=registro.getString("empresa")%>" >
					
				</div>
				<div class="col-xs-2">Sucursal:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmsucu" style="width:100%;" class="form-control" value="<%=registro.getString("sucursal")%>" >
					
				</div>
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-2">Domicilio:</div>
				<div class="col-xs-4">
<%-- 				<textarea disabled class="form-control" rows="3" id="frmdireccion" style="width:100%;" value="<%=registro.getString("domicilio")%>"></textarea> --%>
				<input disabled type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("domicilio")%>"/></div>
				<div class="col-xs-2">Ciudad:</div>
				<div class="col-xs-4"><input disabled type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("ciudad")%>"/></div>
				
				
				
			</div>
			</div>
			
			
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Estado:</div>
				<div class="col-xs-4"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("estado")%>"/></div>
<!-- 				<div class="col-xs-2">Gerente:</div> -->
<%-- 				<div class="col-xs-4"><input  disabled type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("gerente")%>"/></div> --%>
				
				 
			</div>
			</div>
			
			
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-2">Fecha de Reporte:</div>
				<div class="col-xs-4">
			                    <input disabled type='text' class="form-control" id='ffecharegistro2' value="<%=registro.getString("fecha")%>"/>
			                    </div>
			    <div class="col-xs-2">Hora Reporte:</div>
				<div class="col-xs-4"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("hora")%>"/></div>
				
				
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Raz&oacute;n del Servicio:</div>
				<div class="col-xs-10">
					<input disabled type="text" id="razonserv" style="width:100%;" class="form-control" value="<%=registro.getString("razonservicio")%>" >
					
				</div>
			
			</div>
			</div>
			</div>
	  </div>
	  
<!-- 	  ********************************************************************fechas tab********************************************************************************************* -->
	  <div class="tab-pane fade" id="fechas" role="tabpanel" aria-labelledby="fechas-tab" onclick="ocultarDetalle(this.id+'seg')">
		<div class="col-xs-12" id="fechasseg">
		<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-3">Fecha/Hora Registro:</div>
				<div class="col-xs-9">
					<input disabled type="text" id="frmfreg" style="width:100%;" class="form-control" value="<%=registro.getString("FECHAREGISTRO")%>" >
					
				</div>

			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-3">Fecha/Hora Reporte:</div>
				<div class="col-xs-9"><input disabled type="text" id="frmfecharep" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("fecha")%> <%=registro.getString("hora")%>"/></div>
				
				
				
				
			</div>
			</div>
			
			
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-3">Fecha/Hora Cita:</div>
				<div class="col-xs-9"><input disabled type="text" id="frmfechacita" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("FECHACITA")%> <%=registro.getString("HORACITA")%>"/></div>
				
				
				
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-3">Fecha/Hora Entrada:</div>
				<div class="col-xs-9">
			          <input disabled type='text' class="form-control" id='frmfechaentrada' value="<%=registro.getString("FECHAENTRADA")%> <%=registro.getString("HORAENTRADA")%>"/>
			     </div>

				
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-3">Fecha/Hora Salida:</div>
				<div class="col-xs-9">
                 <input disabled type='text' class="form-control" id='frmfechasalida' value="<%=registro.getString("FECHASALIDA")%> <%=registro.getString("HORASALIDA")%>"/>
                 </div>

			
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-3">Prioridad:</div>
				<div class="col-xs-9">
                 <input disabled type='text' class="form-control" id='frmprioridad' value="<%=registro.getString("PRIORIDAD")%>"/>
                 </div>

			
			</div>
			</div>
			</div>
	  </div>
<!-- 	  ************************************************************equipo tab******************************************************************* -->
	  <div class="tab-pane fade" id="equipo" role="tabpanel" aria-labelledby="equipo-tab">
	  	<div class="col-xs-12" id="equiposeg">
		<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Nombre Equipo:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmequipo" style="width:100%;" class="form-control" value="<%=registro.getString("NOMBREEQUIPO")%>" >
					
				</div>
				<div class="col-xs-2">Marca:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmmarca" style="width:100%;" class="form-control" value="<%=registro.getString("MARCA")%>" >
					
				</div>
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-2">Modelo:</div>
				<div class="col-xs-4"><input disabled type="text" id="frmmodelo" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("MODELO")%>"/></div>
				<div class="col-xs-2"># Serie:</div>
				<div class="col-xs-4"><input disabled type="text" id="frmserie" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("SERIE")%>"/></div>
				
				
				
			</div>
			</div>
			
			
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Voltaje:</div>
				<div class="col-xs-4"><input disabled type="text" id="frmvoltaje" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("VOLTAJE")%>"/></div>
				<div class="col-xs-2">Amperes:</div>
				<div class="col-xs-4"><input  disabled type="text" id="frmAmperes" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("AMPERES")%>"/></div>
				
				
			</div>
			</div>
			
			
			</div>
	  </div>
<!-- 	  *******************************************************************servicio tab****************************************************** -->
	  <div class="tab-pane fade" id="servicio" role="tabpanel" aria-labelledby="servicio-tab">
		<div class="col-xs-12" id="servicioseg">
		<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Recibido por:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmrecibido" style="width:100%;" class="form-control" value="<%=registro.getString("RECIBIDO")%>" >
					
				</div>
				<div class="col-xs-2">Puesto:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmpuesto" style="width:100%;" class="form-control" value="<%=registro.getString("PUESTO")%>" >
					
				</div>
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
			<div class="col-xs-2">Servicio Realizado:</div>
				<div class="col-xs-10"><input disabled type="text" id="frmservreal" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("SERVREAL")%>"/></div>
			</div>
			</div>
			
			
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Comentarios:</div>
				<div class="col-xs-10"><input disabled type="text" id="frmcomentarios" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("COMENTARIOS")%>"/></div>
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Condiciones de Operaci&oacute;n (psi):</div>
				<div class="col-xs-2">
					<input disabled type="text" id="frmrecibido" style="width:100%;" class="form-control" value="<%=registro.getString("CONDAMP1")%>" >
					
				</div>
				<div class="col-xs-2">
					<input disabled type="text" id="frmrecibido" style="width:100%;" class="form-control" value="<%=registro.getString("CONDAMP2")%>" >
					
				</div>
				<div class="col-xs-2">Temperatura Operaci&oacute;n:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmpuesto" style="width:100%;" class="form-control" value="<%=registro.getString("TEMPO")%> °<%=registro.getString("TEMPOUNI")%>" >
					
				</div>
			</div>
			</div>
			
			<div class="col-xs-12" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-2">Voltaje:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmrecibido" style="width:100%;" class="form-control" value="<%=registro.getString("CONDVOLTAJE")%>" >
					
				</div>
		
				<div class="col-xs-2">Amperes:</div>
				<div class="col-xs-4">
					<input disabled type="text" id="frmpuesto" style="width:100%;" class="form-control" value="<%=registro.getString("CONDAMPERES")%>" >
					
				</div>
			</div>
			</div>
			
			</div>
	  </div>
	  <div class="tab-pane fade" id="facturas" role="tabpanel" aria-labelledby="facturas-tab">
		<%
				registros = llamado.consultaFacturas(idorden,"N");
		
		%>
		<div class="col-xs-12" id="facturasseg">
		<table id="tablafacturas" class="table table-striped table-bordered" style="font-size:11px; width: 100%;">
        <thead>
            <tr>
		  		<th>Folio Factura</th>
                <th>Proveedor</th>
                <th>Monto</th>


            </tr>
        </thead>
        <tbody>
        <%for(int i=0; i<registros.length(); i++){
        	registro=registros.getJSONObject(i);%>
        	<tr>
        		<td><%=registro.getString("folio") %></td>
        		<td><%=registro.getString("proveedor") %></td>
        		<td><%=registro.getString("monto") %></td>
        	</tr>
        <%} %>
        </tbody>
        </table>
		</div>
		<%
				registros = llamado.consultaSinFacturas(idorden,"S");
		
		%>
		<div class="col-xs-12" style="margin-top: 5px; font-size: 11em; font-weight: bold;">
			<table id="" class="" style="font-size:11px; width: 100%;">
     
		        <tbody>
		        <%for(int i=0; i<registros.length(); i++){
		        	registro=registros.getJSONObject(i);%>
		        	<tr>
		        		
		        		<td>Autorizado a Liquidar sin Factura por: <%=registro.getString("usuario") %>
		        		<%=registro.getString("nombre") %>
		        		<%=registro.getString("fecha") %></td>
		        	</tr>
		        <%} %>
		        </tbody>
		     </table>
		</div>
	  
	</div>
	<div class="tab-pane fade" id="movimientos" role="tabpanel" aria-labelledby="movimientos-tab">
		<%
				registros = llamado.consultaMovimientos(idorden);
		
		%>
		<div class="col-xs-12" id="movimientosseg" style="overflow: auto;">
		<table id="tablamovimientos" class="table table-striped table-bordered" style="font-size:11px; width: 100%;">
        <thead>
            <tr>
		  		<th>Acci&oacute;n</th>
                <th>Estatus Anterior</th>
                <th>Estatus Siguiente</th>
                <th>T&eacute;cnico Anterior</th>
                <th>T&eacute;cnico Siguiente</th>
                <th>Motivo</th>
				<th>Usuario Registro</th>
				<th style="min-width: 100px;">Fecha Registro</th>
            </tr>
        </thead>
        <tbody>
        <%for(int i=0; i<registros.length(); i++){
        	registro=registros.getJSONObject(i);%>
        	<tr>
        		<td><%=registro.getString("accion") %></td>
        		<td><%=registro.getString("estatusanterior") %></td>
        		<td><%=registro.getString("estatussiguiente") %></td>
        		<td><%=registro.getString("tecant") %></td>
        		<td><%=registro.getString("tecact") %></td>
        		<td><%=registro.getString("motivo") %></td>
        		<td><%=registro.getString("usuario") %></td>
        		<td><%=registro.getString("fecha") %> <%=registro.getString("hora") %></td>
        	</tr>
        <%} %>
        </tbody>
        </table>
		</div>
	</div>
	</div>
	
	<div id="reanudarOverlay" class="reanudar-overlay">
		<div class="reanudar-dialog">
			<h4>Reabrir Incidencia</h4>
			<p>&#191;Desea reabrir la incidencia seleccionada?</p>
			<div>
				<button id="reanudarAceptar" class="btn btn-primary">Aceptar</button>
				<button id="reanudarCancelar" class="btn btn-default">Cancelar</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	function ocultarDetalle(value)
	{
		$("#reporteseg").css("display","none");
		$("#fechasseg").css("display","none");
		$("#equiposeg").css("display","none");
		$("#servicioseg").css("display","none");
		$("#facturasseg").css("display","none");
		$("#movimientosseg").css("display","none");
		$("#"+value).css("display","inline");
		
	}
	</script>
</body>
</html>

