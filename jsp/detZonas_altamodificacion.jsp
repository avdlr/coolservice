<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.DetZonas_GestionRegistros"%>
<%@page import="clases.DetZonas_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valZona = request.getParameter("valZona") != null ? request.getParameter("valZona") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";

	DetZonas_GestionRegistros objGestion = new DetZonas_GestionRegistros();
	JSONArray objCat = new DetZonas_GestionRegistros().obtieneZonas();
	DetZonas_Resumen objResumen = new DetZonas_Resumen();
	if (accion.equals("M")) {
			objResumen = new DetZonas_GestionRegistros().consultaRegistro3(valZona);
	%>
<title>Modificar atributo</title>
<%
		} else {
	%>
<title>Agregar atributo</title>
<%
		}
	%>
<title>Agrega campo reporte</title>

<script type="text/javascript">
			var parametros="";
			var accion = "<%=accion%>"; 
			 
	function agregaRegistro() {
		
			var banNom = false;
			var banPass = false;
			var banPerf = false;
				
				if($("#txtEstado").val()=="") 
				{
					document.getElementById('sctxtEstado').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtCiudad").val()=="") 
				{
					document.getElementById('sctxtCiudad').innerHTML="Obligatorio!";
					banPass = true;
				}
				if($("#txtZona").val()=="") 
				{
					document.getElementById('sctxtZona').innerHTML="Obligatorio!";
					banPerf = true;
				}
				
				
				if(!banNom && !banPass && !banPerf)
				{
					document.getElementById('sctxtEstado').innerHTML="";
					document.getElementById('sctxtCiudad').innerHTML="";
					document.getElementById('sctxtZona').innerHTML="";
					
					$.ajax({
						url: "../DetZonas_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valZona:				"<%=valZona%>",				
							txtEstado: 	  	$("#txtEstado").val().toUpperCase(),
							txtCiudad: 	$("#txtCiudad").val().toUpperCase(),
							txtZona: 	  	$("#txtZona").val().toUpperCase(),
							usuarioLogin:			'<%=usuarioLogin%>',
							accion : 				accion
				},

				success : function(res) {
					if (res == 'OK') {
						if (accion == "A") {
							alert("Exito");
							$("#divAgregarRegistro").dialog("close");
						} else {
							if (accion == "M") {
								alert("Exito");
								$("#divAgregarRegistro").dialog("close");
							}
						}
					} else if (res == 'ERROR') {
						if (accion == "A") {
							alert("Error al realizar la inserción");
						} else {
							if (accion == "M") {
								alert("Error al realizar la actualización");
							}
						}

					}
					recargaJSP();
				}
			});
		}

	}

	function cancelar() {
		document.getElementById('sctxtEstado').innerHTML = "";
		document.getElementById('sctxtCiudad').innerHTML = "";
		document.getElementById('sctxtZona').innerHTML = "";

		$("#txtEstado").val('');
		$("#txtCiudad").val('');
		$("#txtZona").val('');
		$("#divAgregarRegistro").dialog("close");

	}

</script>
</head>
<body>
	<div style="overflow: auto;">
		<table class="tablaGeneral" cellspacing="0" border="0">
			<thead style="text-align: center;">
				<tr>
					<td></td>
				</tr>
			</thead>
			<tbody>
				<%try{
					if (accion.equals("A")) {
				%>
				<tr>
					<td>Estado:</td>
					<td><input id="txtEstado" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtEstado" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Ciudad:</td>
					<td><input id="txtCiudad" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtCiudad" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Zona:</td>
					<td><select id="txtZona" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro = new JSONObject();
									for (int i = 0; i < objCat.length(); i++) {
										registro = objCat.getJSONObject(i);
							%>
							<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtZona" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td></td>
					<td>

						<button onclick="agregaRegistro()"
							style="width: 100%; max-width: 90px; cursor: pointer; height: 25px"
							class="btn-primary-custom">
							<img alt="" src="../img/guardar.png" style="max-height: 12px;">
							Guardar
						</button>

						<button onclick="cancelar()"
							style="width: 100%; max-width: 90px; cursor: pointer; height: 25px"
							class="btn-primary-custom">Cancelar</button>

					</td>

				</tr>
				<%
					} else {
				%>

				<tr>

					<td>Estado:</td>
					<td><input id="txtEstado" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getEstado()%>"><span
						id="sctxtEstado" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Ciudad:</td>
					<td><input id="txtCiudad" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getCiudad()%>"><span
						id="sctxtCiudad" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Perfil:</td>
					<td><select id="txtZona" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro = new JSONObject();
									for (int i = 0; i < objCat.length(); i++) {
										registro = objCat.getJSONObject(i);
							%>
							<option value="<%=registro.getString("value")%>" <%if (registro.getString("value").equals(objResumen.getZona())){ %> selected="true" <%} %>       ><%=registro.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtZona" style="font-size: 10px; color: red;"></span></td>
				</tr>

				<tr>
					<td></td>
					<td>
						<button onclick="agregaRegistro()"
							style="width: 100%; max-width: 90px; cursor: pointer; height: 25px"
							class="btn-primary-custom">
							<img alt="" src="../img/guardar.png" style="max-height: 12px;">
							Guardar
						</button>
						<button onclick="cancelar()"
							style="width: 100%; max-width: 90px; cursor: pointer; height: 25px"
							class="btn-primary-custom">Cancelar</button>
					</td>

				</tr>
				<%
					}
				}catch (Exception e){
					e.printStackTrace();
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
