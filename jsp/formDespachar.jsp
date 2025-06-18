<%@page import="bean.GestionTareas"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%
    String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
    String orden = request.getParameter("orden") != null ? request.getParameter("orden"): ""; 
    GestionTareas llamado = new GestionTareas();
    JSONArray registros = llamado.consultaDetalleOrden(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }
    %>
</head>
<body>
<div  id="loadingfrmtec" style="height: 100%;">
<div class="col-xs-12">

<div class="row">
	<div class="col-xs-2">Orden de Servicio:</div>
	<div class="col-xs-4"><input type="text" disabled id="frmordenServicio" style="width:100%;" class="form-control"  placeholder="Orden de Servicio" value="<%=orden%>"/></div>
<!-- 	<div class="col-xs-2">&Uacute;ltimo T&eacute;cnico:</div> -->
<%-- 	<div class="col-xs-4"><input disabled type="text" id="frmultimotec" style="width:100%;" class="form-control"  placeholder="nombre del tecnico" value="<%=registro.getString("tecnico")%>"/></div> --%>
	<div class="col-xs-2">Tipo de Mantenimiento:</div>
	<div class="col-xs-4">
		<input type="text" disabled id="frmtipomantenimiento" style="width:100%;" class="form-control" value="<%=registro.getString("tipoorden")%>" />
		</div>
</div>
</div>




<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Cliente:</div>
	<div class="col-xs-4">
		<input type="text" disabled id="frmcliente" style="width:100%;" class="form-control" value="<%=registro.getString("empresa")%>" >
		
	</div>
	<div class="col-xs-2">Sucursal:</div>
	<div class="col-xs-4">
		<input type="text" disabled id="frmsucu" style="width:100%;" class="form-control" value="<%=registro.getString("sucursal")%>" >
		
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-2">Domicilio:</div>
	<div class="col-xs-10"><input disabled type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="nombre de la dirección" value="<%=registro.getString("domicilio")%>"/></div>

	
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">

	<div class="col-xs-2">Ciudad:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad" value="<%=registro.getString("ciudad")%>"/></div>
		<div class="col-xs-2">Estado:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="nombre del estado" value="<%=registro.getString("estado")%>"/></div>
	
	
</div>
</div>



<!-- <div class="col-xs-12" style="padding-top: 5px;"> -->
<!-- <div class="row"> -->

<!-- 	<div class="col-xs-2">Gerente/Supervisor:</div> -->
<%-- 	<div class="col-xs-4"><input disabled type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente" value="<%=registro.getString("gerente")%>"/></div> --%>
	
	
<!-- </div> -->
<!-- </div> -->

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-2">Fecha de Reporte:</div>
	<div class="col-xs-4">
                    <input disabled type='text' class="form-control" id='ffecharegistro2' value="<%=registro.getString("fecha")%>"/>
                    </div>
    <div class="col-xs-2">Hora Reporte:</div>
	<div class="col-xs-4"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="Hora" value="<%=registro.getString("hora")%>"/></div>
	
	
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
<div class="col-xs-12" style="padding-top: 25px;">
<div style="background-color: #929498; height: 1px; width: 100%;"></div>
</div>
	<div style="margin-top: 25px;" class="col-xs-3">Recibido por:</div>
	<div style="margin-top: 25px;" class="col-xs-9">
		<input type="text" id="frmrecibido" style="width:100%;" class="form-control" value="" placeholder="Nombre de quien recibió"/>
	</div>
	<div style="margin-top: 25px;" class="col-xs-3">Puesto:</div>
	<div style="margin-top: 25px;" class="col-xs-9">
		<input type="text" id="frmpuesto" style="width:100%;" class="form-control" value="" placeholder="Puesto de quien recibió"/>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#frmrecibido").attr('maxlength','150');
	$("#frmpuesto").attr('maxlength','150');

	$("#container").mLoading("hide");

});
</script>
</body>
</html>
