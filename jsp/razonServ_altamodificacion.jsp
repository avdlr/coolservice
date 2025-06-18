<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.RazonServ_GestionRegistros"%>
<%@page import="clases.RazonServ_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valRazon = request.getParameter("valRazon") != null ? request.getParameter("valRazon") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";

	RazonServ_GestionRegistros objGestion = new RazonServ_GestionRegistros();
	JSONArray objCat = new RazonServ_GestionRegistros().obtieneZonas();
	RazonServ_Resumen objResumen = new RazonServ_Resumen();
	if (accion.equals("M")) {
			objResumen = new RazonServ_GestionRegistros().consultaRegistro3(valRazon);
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
				
				if($("#txtDescripcion").val()=="") 
				{
					document.getElementById('sctxtDescripcion').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtZona").val()=="") 
				{
					document.getElementById('sctxtZona').innerHTML="Obligatorio!";
					banPerf = true;
				}
				
				
				if(!banNom && !banPerf)
				{
					document.getElementById('sctxtDescripcion').innerHTML="";
					document.getElementById('sctxtZona').innerHTML="";
					
					$.ajax({
						url: "../RazonServ_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valRazon:				"<%=valRazon%>",				
							txtDescripcion: 	  	$("#txtDescripcion").val().toUpperCase(),
							txtZona: 	  	$("#txtZona").val(),
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
		document.getElementById('sctxtDescripcion').innerHTML = "";
		document.getElementById('sctxtZona').innerHTML = "";

		$("#txtDescripcion").val('');
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
					<td>Descripcion:</td>
					<td><input id="txtDescripcion" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtDescripcion" style="font-size: 10px; color: red;"></span></td>
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

					<td>Descripcion:</td>
					<td><input id="txtDescripcion" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getDescripcion()%>"><span
						id="sctxtDescripcion" style="font-size: 10px; color: red;"></span></td>
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
