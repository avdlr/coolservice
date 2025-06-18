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
	<div class="col-xs-4">Orden</div>
	<div class="col-xs-8"><input type="text" disabled id="frmordenServicio" style="width:100%;" class="form-control"  placeholder="Orden de Servicio" value="<%=orden%>"/></div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">

<div class="row">

	<div class="col-xs-4">Tipo de Mmto:</div>
	<div class="col-xs-8">
		<input type="text" disabled id="frmtipomantenimiento" style="width:100%;" class="form-control" value="<%=registro.getString("tipoorden")%>" />
		</div>
</div>
</div>




<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Cliente:</div>
	<div class="col-xs-8">
		<input type="text" disabled id="frmcliente" style="width:100%;" class="form-control" value="<%=registro.getString("empresa")%>" >
		
	</div>

</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Sucursal:</div>
	<div class="col-xs-8">
		<input type="text" disabled id="frmsucu" style="width:100%;" class="form-control" value="<%=registro.getString("sucursal")%>" >
		
	</div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-4">Domicilio:</div>
	<div class="col-xs-8">
	<textarea disabled class="form-control" rows="5" id="frmdireccion" style="width:100%;" ><%=registro.getString("domicilio")%></textarea>
<%-- 	<input disabled type="text" id="frmdireccion" style="width:100%;" class="form-control"  placeholder="nombre de la dirección" value="<%=registro.getString("domicilio")%>"/> --%>
	</div>

	
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">

	<div class="col-xs-4">Ciudad:</div>
	<div class="col-xs-8"><input disabled type="text" id="frmciudad" style="width:100%;" class="form-control"  placeholder="nombre de la ciudad" value="<%=registro.getString("ciudad")%>"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
		<div class="col-xs-4">Estado:</div>
	<div class="col-xs-8"><input disabled type="text" id="frmestado" style="width:100%;" class="form-control"  placeholder="nombre del estado" value="<%=registro.getString("estado")%>"/></div>
	
	
</div>
</div>



<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">

	<div class="col-xs-4">Gerente:</div>
	<div class="col-xs-8"><input disabled type="text" id="frmgerente" style="width:100%;" class="form-control"  placeholder="nombre del gerente" value="<%=registro.getString("gerente")%>"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
<div class="col-xs-4">Fecha de Rep.:</div>
	<div class="col-xs-8">
                    <input disabled type='text' class="form-control" id='ffecharegistro2' value="<%=registro.getString("fecha")%>"/>
                    </div>
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">

    <div class="col-xs-4">Hora Rep:</div>
	<div class="col-xs-8"><input disabled  type="text" id="frmhorareg" style="width:100%;" class="form-control"  placeholder="Hora" value="<%=registro.getString("hora")%>"/></div>
	
	
</div>
</div>

<div class="col-xs-12" style="padding-top: 5px;">
<div class="row">
	<div class="col-xs-4">Raz&oacute;n del Serv:</div>
	<div class="col-xs-8">
		<input disabled type="text" id="razonserv" style="width:100%;" class="form-control" value="<%=registro.getString("razonservicio")%>" >
		
	</div>
	

</div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div style="background-color: #929498; height: 1px; width: 100%;"></div>
</div>

<div class="col-xs-12" style="padding-top: 25px;">
<div class="row">
	<div class="col-xs-4">Motivo:</div>
	<div class="col-xs-8">
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