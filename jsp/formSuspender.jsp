<%@page import="bean.GestionTareas"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion"): ""; 
	String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): ""; 
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray empresas = catalogos.consultaEmpresa();
	JSONArray tipomantenimiento = catalogos.consultaTipoTrabajo("");
	
	GestionTareas llamado = new GestionTareas();
    JSONArray registros = llamado.consultaDetalleOrden(idorden);
    JSONObject registro = new JSONObject();
    if(registros.length()>0)
    {
    	registro = registros.getJSONObject(0);
    }

%>

<div  id="loadingfrmtec" style="height: 100%;">
<div class="col-xs-12">


	<div class="row">
	<div class="col-xs-2">Orden de Servicio:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmordenServicio" style="width:100%;" class="form-control"  placeholder="Orden de Servicio" value="<%=orden%>"/></div>
	<div class="col-xs-2">Tipo de Mantenimiento:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmtipomantenimiento" style="width:100%;" class="form-control"  placeholder="Tipo Mantenimiento" value="<%=registro.getString("tipoorden")%>"/></div>
</div>
</div>
<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Cliente:</div>
	<div class="col-xs-4">
		<input disabled type="text" id="frmcliente" style="width:100%;" class="form-control"  placeholder="Cliente" value="<%=registro.getString("empresa")%>"/>
	</div>
	<div class="col-xs-2">Sucursal:</div>
	<div class="col-xs-4">
		<input disabled type="text" id="frmsucu" style="width:100%;" class="form-control"  placeholder="Sucursal" value="<%=registro.getString("sucursal")%>"/>
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-2">Ciudad:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad" value="<%=registro.getString("ciudad")%>"/></div>
	<div class="col-xs-2">Gerente/Supervisor:</div>
	<div class="col-xs-4"><input disabled type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente" value="<%=registro.getString("gerente")%>"/></div>
	
	
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
<div class="col-xs-2">Fecha de Reporte:</div>
	<div class="col-xs-4">
	<input disabled type="text" id="ffecharegistro" style="width:100%;" class="form-control"  placeholder="Fecha Registro" value="<%=registro.getString("fecha")%>"/>
	</div>
    <div class="col-xs-2">Hora Reporte:</div>
	<div class="col-xs-4"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="Hora" value="<%=registro.getString("hora")%>"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div style="background-color: #929498; height: 1px; width: 100%;"></div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div class="row">
	<div class="col-xs-2">Motivo:</div>
	<div class="col-xs-10">
	<input  type="text" id="frmmotivo" style="width:100%;" class="form-control"  placeholder="Motivo de Suspensión" value=""/>
	</div>

	
	
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#container").mLoading("hide");
});
</script>