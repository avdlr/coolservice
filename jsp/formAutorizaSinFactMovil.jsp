<%@page import="bean.GestionTareas"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): ""; 
	
	GestionTareas llamado = new GestionTareas();
    JSONArray registros = llamado.consultaDetalleOrden(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Terminar Orden</title>
</head>
<body>
<div class="col-xs-12">

<div class="row">
	<div class="col-xs-3">Orden de Servicio:</div>
	<div class="col-xs-9"><input disabled type="text" id="frmordenServicio" style="width:100%;" class="form-control"  placeholder="Orden de Servicio" value="<%=orden%>"/></div>
	
</div>
</div>

<div class="col-xs-12">
<div class="row">
	<div class="col-xs-3">&Uacute;ltimo T&eacute;cnico:</div>
	<div class="col-xs-9"><input disabled type="text" id="frmultimotec" style="width:100%;" class="form-control"  placeholder="nombre del tecnico" value="<%=registro.getString("tecnico")%>"/></div>
	
</div>
</div>


<div class="col-xs-12" style="padding-top: 5px;">

<div class="row">
	<div class="col-xs-3">Tipo de Mantenimiento:</div>
	<div class="col-xs-9">
		<input disabled type="text" id="frmtipomantenimiento" style="width:100%;" class="form-control" value="<%=registro.getString("tipoorden")%>" />
		</div>
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Cliente:</div>
	<div class="col-xs-9">
		<input disabled type="text" id="frmcliente" style="width:100%;" class="form-control" value="<%=registro.getString("empresa")%>" >
		
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Sucursal:</div>
	<div class="col-xs-9">
		<input disabled type="text" id="frmsucu" style="width:100%;" class="form-control" value="<%=registro.getString("sucursal")%>" >
		
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-3">Domicilio:</div>
	<div class="col-xs-9">
	<textarea disabled class="form-control" rows="5" id="frmdireccion" style="width:100%;" ><%=registro.getString("domicilio")%></textarea>
<%-- 	<input disabled type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="nombre de la dirección" value="<%=registro.getString("domicilio")%>"/> --%>
	</div>
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Ciudad:</div>
	<div class="col-xs-9"><input disabled type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad" value="<%=registro.getString("ciudad")%>"/></div>
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Estado:</div>
	<div class="col-xs-9"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="nombre del estado" value="<%=registro.getString("estado")%>"/></div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Gerente:</div>
	<div class="col-xs-9"><input disabled type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente" value="<%=registro.getString("gerente")%>"/></div>
	
	
</div>
</div>


<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-3">Fecha de Reporte:</div>
	<div class="col-xs-9">
                    <input disabled type='text' class="form-control" id='ffecharegistro2' value="<%=registro.getString("fecha")%>"/>
                    </div>

	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
    <div class="col-xs-3">Hora Reporte:</div>
	<div class="col-xs-9"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="Hora" value="<%=registro.getString("hora")%>"/></div>
	
	
</div>
</div>


<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-3">Raz&oacute;n del Servicio:</div>
	<div class="col-xs-9">
		<input disabled type="text" id="razonserv" style="width:100%;" class="form-control" value="<%=registro.getString("razonservicio")%>" >
		
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div style="background-color: #929498; height: 1px; width: 100%;"></div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div class="row">
	
	<div class="col-xs-12"><input type="checkbox" id="autorizarCierre"   value="S"/> Autorizar al t&eacute;cnico para liquidar orden de servicio sin factura.</div>
	
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#container").mLoading("hide");
});
</script>
</body>
</html>