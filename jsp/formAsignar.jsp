<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String idorden = request.getParameter("idorden") != null ? request.getParameter("idorden"): ""; 
    String orden = request.getParameter("orden") != null ? request.getParameter("orden"): ""; 
    String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): ""; 
    String tipo = request.getParameter("tipo") != null ? request.getParameter("tipo"): ""; 
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray tecnicos  = catalogos.consultaTecnicos();
	String ultimotec = catalogos.consultaUltimoTecnico(idorden);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <title>Insert title here</title> -->
</head>
<body>

<div  id="loadingfrmtec" style="height: 100%;">
<div class="col-xs-12">

<div class="row">
	<div class="col-xs-3">Orden:</div> 
	<div class="col-xs-9"><input disabled type="text" id="frmordenServicio" style="width:100%;" class="form-control" value="<%=orden %>" placeholder="Orden de Servicio"/></div>
	<div style="margin-top: 5px;" class="col-xs-3">T&eacute;cnico:</div>
	<div style="margin-top: 5px;" class="col-xs-9"><select id="frmtecnico" style="width:100%;" class="form-control"  >
		<option value="">Seleccionar..</option>
		<%
			JSONObject registro = new JSONObject();
			for (int i=0; i<tecnicos.length(); i++)
			{
				registro = tecnicos.getJSONObject(i);
				%>
					<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
				<%
			}
		%>
	 </select></div>
	 <%if(tipo.equals("reasignacion")) {%>
	 <div style="margin-top: 5px;" class="col-xs-3">Motivo:</div>
	<div style="margin-top: 5px;"  class="col-xs-9"><input  type="text" id="frmmotivo" style="width:100%;" class="form-control"  placeholder="Motivo de reasignacion" value=""/></div>
	<%} %>
	 <div style="margin-top: 20px;" class="col-xs-3">&Uacute;ltimo T&eacute;cnico:</div>
	<div style="margin-top: 20px;"  class="col-xs-9"><input disabled type="text" id="frmultimotec" style="width:100%;" class="form-control"  placeholder="..." value="<%=ultimotec%>"/></div>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	$("#frmtecnico").select2({
		 dropdownParent: $("#dialog")
	});
	$("#frmmotivo").attr('maxlength','1000');
	
	$("#container").mLoading("hide");
});



</script>
</body>
</html>
