<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Sucursal_GestionRegistros"%>
<%@page import="clases.Sucursal_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valSucursal = request.getParameter("valSucursal") != null ? request.getParameter("valSucursal") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";

	Sucursal_GestionRegistros objGestion = new Sucursal_GestionRegistros();
	JSONArray objCatEmp = new Sucursal_GestionRegistros().obtieneEmpresas();
	JSONArray objCat = new Sucursal_GestionRegistros().obtieneZonas();
	Sucursal_Resumen objResumen = new Sucursal_Resumen();
	if (accion.equals("M")) {
			objResumen = new Sucursal_GestionRegistros().consultaRegistro3(valSucursal);
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
			var banZona = false;
			var banEmp = false;
				
				if($("#txtNombreSucursal").val()=="") 
				{
					document.getElementById('sctxtNombreSucursal').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtZona").val()=="") 
				{
					document.getElementById('sctxtZona').innerHTML="Obligatorio!";
					banZona = true;
				}
				if($("#txtNombreCortoSucursal").val()=="") 
				{
					document.getElementById('sctxtNombreCortoSucursal').innerHTML="Obligatorio!";
					banPerf = true;
				}
				if($("#txtDomicilioSucursal").val()=="") 
				{
					document.getElementById('sctxtDomicilioSucursal').innerHTML="Obligatorio!";
					banPass = true;
				}
				if($("#txtEmpresa").val()=="") 
				{
					document.getElementById('sctxtEmpresa').innerHTML="Obligatorio!";
					banEmp = true;
				}
				if(!banNom && !banPerf && !banPass && !banZona && !banEmp)
				{
					document.getElementById('sctxtNombreSucursal').innerHTML = "";
					document.getElementById('sctxtEmpresa').innerHTML = "";
					document.getElementById('sctxtNombreCortoSucursal').innerHTML = "";
					document.getElementById('sctxtDomicilioSucursal').innerHTML = "";
					document.getElementById('sctxtZona').innerHTML = "";
					
					$.ajax({
						url: "../Sucursal_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valSucursal:				"<%=valSucursal%>",				
							txtNombreSucursal: 	  		$("#txtNombreSucursal").val().toUpperCase(),
							txtNombreCortoSucursal: 	$("#txtNombreCortoSucursal").val().toUpperCase(),
							txtDomicilioSucursal: 	  	$("#txtDomicilioSucursal").val().toUpperCase(),
							txtEmpresa: 	  			$("#txtEmpresa").val().toUpperCase(),
							txtZona: 	  				$("#txtZona").val().toUpperCase(),
							usuarioLogin:				'<%=usuarioLogin%>',
							accion : 					accion
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
		document.getElementById('sctxtNombreSucursal').innerHTML = "";
		document.getElementById('sctxtNombreCortoSucursal').innerHTML = "";
		document.getElementById('sctxtDomicilioSucursal').innerHTML = "";
		document.getElementById('sctxtZona').innerHTML = "";
		document.getElementById('sctxtEmpresa').innerHTML = "";

		$("#txtNombreSucursal").val('');
		$("#txtNombreCortoSucursal").val('');
		$("#txtDomicilioSucursal").val('');
		$("#txtEmpresa").val('');
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
					<td>Empresa:</td>
					<td><select id="txtEmpresa" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registroEmp = new JSONObject();
									for (int i = 0; i < objCatEmp.length(); i++) {
										registroEmp = objCatEmp.getJSONObject(i);
							%>
							<option value="<%=registroEmp.getString("value")%>"><%=registroEmp.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Nombre Sucursal:</td>
					<td><input id="txtNombreSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Nombre Corto Sucursal:</td>
					<td><input id="txtNombreCortoSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreCortoSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Domicilio Sucursal:</td>
					<td><input id="txtDomicilioSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtDomicilioSucursal" style="font-size: 10px; color: red;"></span></td>
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
					<td>Empresa:</td>
					<td><select id="txtEmpresa" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registroEmp = new JSONObject();
									for (int i = 0; i < objCatEmp.length(); i++) {
										registroEmp = objCatEmp.getJSONObject(i);
							%>
							<option value="<%=registroEmp.getString("value")%>" <%if (registroEmp.getString("value").equals(objResumen.getEmpresa())){ %> selected="true" <%} %>       ><%=registroEmp.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Nombre Sucursal:</td>
					<td><input id="txtNombreSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombre()%>"><span
						id="sctxtNombreSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Nombre Corto Sucursal:</td>
					<td><input id="txtNombreCortoSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombreCorto()%>"><span
						id="sctxtNombreCortoSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Domicilio Sucursal:</td>
					<td><input id="txtDomicilioSucursal" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getDomicilio()%>"><span
						id="sctxtDomicilioSucursal" style="font-size: 10px; color: red;"></span></td>
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
							<option value="<%=registro.getString("value")%>" <%if (registro.getString("value").equals(objResumen.getDetZona())){ %> selected="true" <%} %>       ><%=registro.getString("description")%></option>
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
