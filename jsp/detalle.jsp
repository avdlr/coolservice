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

%>
<style type="text/css">
#reabrir-modal-overlay {
        background-color: rgba(0, 0, 0, 0.45);
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        display: none;
        z-index: 1050;
}

#reabrir-modal {
        background-color: #ffffff;
        border-radius: 4px;
        box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
        margin: 10% auto;
        max-width: 420px;
        padding: 20px;
}

#reabrir-modal h4 {
        font-size: 16px;
        font-weight: bold;
        margin: 0 0 10px 0;
}

#reabrir-modal p {
        margin: 0;
        font-size: 13px;
}

#reabrir-modal .modal-actions {
        margin-top: 20px;
        text-align: right;
}

#reabrir-modal .modal-actions button {
        margin-left: 10px;
        min-width: 90px;
}
</style>
<script type="text/javascript">

document.addEventListener('DOMContentLoaded', function() {
        var statusInput = document.getElementById('frmestatus');
        var reopenSelect = document.getElementById('frmreabririncidencia');
        var modalOverlay = document.getElementById('reabrir-modal-overlay');
        var cancelButton = document.getElementById('reabrirCancelar');
        var acceptButton = document.getElementById('reabrirAceptar');
        var originalStatus = statusInput ? statusInput.value : '';

        function showReopenModal() {
                if (modalOverlay) {
                        modalOverlay.style.display = 'block';
                }
        }

        function hideReopenModal(resetSelection) {
                if (modalOverlay) {
                        modalOverlay.style.display = 'none';
                }

                if (resetSelection) {
                        if (reopenSelect) {
                                reopenSelect.value = '';
                        }

                        if (statusInput) {
                                statusInput.value = originalStatus;
                        }

var originalStatus = "";
$(document).ready(function() {
        $("#container").mLoading("hide");
        originalStatus = $('#frmestatus').val();

        function closeReopenModal(resetSelection) {
                $('#reabrir-modal-overlay').fadeOut(150);
                if (resetSelection) {
                        $('#frmreabririncidencia').val('');
                        $('#frmestatus').val(originalStatus);

                }
        }

        function handleReopenError() {

                hideReopenModal(true);
                window.alert('No fue posible reabrir la incidencia. Intente nuevamente.');
        }

        if (reopenSelect) {
                reopenSelect.addEventListener('change', function() {
                        if (this.value === 'SI') {
                                if (statusInput) {
                                        statusInput.value = 'ASIGNADO';
                                }

                                showReopenModal();
                        } else {
                                if (statusInput) {
                                        statusInput.value = originalStatus;
                                }
                        }
                });
        }

        if (cancelButton) {
                cancelButton.addEventListener('click', function() {
                        hideReopenModal(true);
                });
        }

        if (acceptButton) {
                acceptButton.addEventListener('click', function() {
                        if (acceptButton.hasAttribute('disabled')) {
                                return;
                        }

                        acceptButton.setAttribute('disabled', 'disabled');

                        var params = [
                                'orden=' + encodeURIComponent('<%=idorden%>'),
                                'usuario=' + encodeURIComponent('<%=usuario%>'),
                                'estatus=2',
                                'actualestatus=' + encodeURIComponent(originalStatus),
                                'idaccion=REANUDAR'
                        ].join('&');

                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', 'reanudarIncidencia.jsp', true);
                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=ISO-8859-1');

                        xhr.onreadystatechange = function() {
                                if (xhr.readyState !== 4) {
                                        return;
                                }

                                acceptButton.removeAttribute('disabled');

                                if (xhr.status >= 200 && xhr.status < 300) {
                                        try {
                                                var response = JSON.parse(xhr.responseText);
                                                var reopenSuccessful = false;

                                                if (Array.isArray(response)) {
                                                        for (var i = 0; i < response.length; i++) {
                                                                var item = response[i];
                                                                if (item && item.resp && String(item.resp).toUpperCase() === 'OK') {
                                                                        reopenSuccessful = true;
                                                                        break;
                                                                }
                                                        }
                                                }

                                                if (reopenSuccessful) {
                                                        if (statusInput) {
                                                                statusInput.value = 'ASIGNADO';
                                                        }
                                                        originalStatus = statusInput ? statusInput.value : originalStatus;

                                                        hideReopenModal(false);
                                                        window.alert('La incidencia fue reabierta correctamente.');
                                                } else {
                                                        handleReopenError();
                                                }
                                        } catch (err) {
                                                handleReopenError();
                                        }
                                } else {
                                        handleReopenError();
                                }
                        };

                        xhr.send(params);
                });
        }
                closeReopenModal(true);
                alert('No fue posible reabrir la incidencia. Intente nuevamente.');
        }

        $('#frmreabririncidencia').on('change', function() {
                if ($(this).val() === "SI") {
                        $('#reabrir-modal-overlay').fadeIn(150);
                } else {
                        $('#frmestatus').val(originalStatus);
                }
        });

        $('#reabrirCancelar').on('click', function() {
                closeReopenModal(true);
        });

        $('#reabrirAceptar').on('click', function() {
                var $button = $(this);
                if ($button.prop('disabled')) {
                        return;
                }

                $button.prop('disabled', true);

                $.ajax({
                        url: 'reanudarIncidencia.jsp',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                                orden: '<%=idorden%>',
                                usuario: '<%=usuario%>',
                                estatus: '2',
                                actualestatus: originalStatus,
                                idaccion: 'REANUDAR'
                        }
                }).done(function(resp) {
                        var reopenSuccessful = false;

                        if ($.isArray(resp)) {
                                $.each(resp, function(i, item) {
                                        if (item && item.resp && item.resp.toUpperCase() === 'OK') {
                                                reopenSuccessful = true;
                                                return false;
                                        }
                                });
                        }

                        if (reopenSuccessful) {
                                $('#frmestatus').val('ASIGNADO');
                                closeReopenModal(false);
                                alert('La incidencia fue reabierta correctamente.');
                        } else {
                                handleReopenError();
                        }
                }).fail(function() {
                        handleReopenError();
                }).always(function() {
                        $button.prop('disabled', false);
                });
        });
$(document).ready(function() {
	$("#container").mLoading("hide");
	originalStatus = $('#frmestatus').val();
	$('#frmreabririncidencia').on('change', function() {
		if ($(this).val() === "SI") {
			$('#frmestatus').val('ASIGNADO');
		} else {
			$('#frmestatus').val(originalStatus);
		}
	});

});
</script>
</head>
<body>
	<div class="col-xs-12">
		<div class="col-xs-2 col-md-2">Tipo Mantenimiento:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmtipomant" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tipoorden")%>"/></div>
		<div class="col-xs-2 col-md-2">Estatus:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmestatus" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("ESTATUS")%>"/></div>
		<div class="col-xs-2 col-md-2" style="margin-top: 5px;">Reabrir Incidencia:</div>
		<div class="col-xs-4 col-md-4" style="margin-top: 5px;">
			<select id="frmreabririncidencia" class="form-control" style="width:100%;">
				<option value="">Seleccione</option>
				<option value="SI">SI</option>
			</select>
		</div>
                <div id="reabrir-modal-overlay">
                        <div id="reabrir-modal">
                                <h4>Reabrir incidencia</h4>
                                <p>&iquest;Desea reabrir la incidencia seleccionada?</p>
                                <div class="modal-actions">
                                        <button type="button" id="reabrirCancelar" class="btn btn-default">Cancelar</button>
                                        <button type="button" id="reabrirAceptar" class="btn btn-primary">Aceptar</button>
                                </div>
                        </div>
                </div>
		<div class="col-xs-2" style="margin-top: 5px;">T&eacute;cnico Asignado:</div>
		<div class="col-xs-4" style="margin-top: 5px;"><input disabled type="text" id="frmtecnicoasig" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tecnico")%>"/></div>

				

		
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

