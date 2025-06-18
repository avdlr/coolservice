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
    String costo = llamado.consultaCostoEstimado(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }

    

%>
<script type="text/javascript">
$(document).ready(function() {
	$("#container").mLoading("hide");
});
</script>
</head>
<body>
	<div class="col-xs-12">
		<div class="col-xs-2 col-md-2">Tipo Mantenimiento:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmtipomant" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tipoorden")%>"/></div>
		<div class="col-xs-2 col-md-2">Estatus:</div>
		<div class="col-xs-4 col-md-4"><input disabled type="text" id="frmestatus" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("ESTATUS")%>"/></div>
		<div class="col-xs-2" style="margin-top: 5px;">T&eacute;cnico Asignado:</div>
		<div class="col-xs-4" style="margin-top: 5px;"><input disabled type="text" id="frmtecnicoasig" style="width:100%;" class="form-control"  placeholder="" value="<%=registro.getString("tecnico")%>"/></div>

				

		
	</div>
	<div class="col-xs-12" style=" margin-bottom: 15px;">
	<div style="background-color: #FFF; height: 1px; width: 100%;"></div>
	</div>

	<ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 15px; margin-bottom: 15px;">
	  <li class="nav-item">
<!-- 	    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#reporte" role="tab" aria-controls="home" aria-selected="true" onclick="ocultarDetalle('reporteseg')">Reporte</a> -->
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
			
			<div class="col-xs-6" style="padding-top: 5px;">
			<div class="row">
				<div class="col-xs-4">Costo Estimado:</div>
				<div class="col-xs-8">
					<input  type="text" id="frmcosto" style="width:100%;" class="form-control" value="<%=costo %>" >
					
				</div>
			
			</div>
			</div>
			</div>
	  </div>
	  


	</div>
	
	<script type="text/javascript">
	
	 $(document).ready(function() {
		 
		 $("#frmcosto").keydown(function (e) {
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
	 });
	
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

