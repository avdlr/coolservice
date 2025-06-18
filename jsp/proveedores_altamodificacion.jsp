<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Proveedores_GestionRegistros"%>
<%@page import="clases.Proveedores_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valProveedor = request.getParameter("valProveedor") != null ? request.getParameter("valProveedor") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";

	Proveedores_GestionRegistros objGestion = new Proveedores_GestionRegistros();
	Proveedores_Resumen objResumen = new Proveedores_Resumen();
	if (accion.equals("M")) {
			objResumen = new Proveedores_GestionRegistros().consultaRegistro3(valProveedor);
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
				
				if($("#txtNombreProveedor").val()=="") 
				{
					document.getElementById('sctxtNombreProveedor').innerHTML="Obligatorio!";
					banNom = true;
				}
				
				if(!banNom)
				{
					document.getElementById('sctxtNombreProveedor').innerHTML="";
					document.getElementById('sctxtRazonSocial').innerHTML="";
					document.getElementById('sctxtRfcProveedor').innerHTML="";
					document.getElementById('sctxtTelProveedor').innerHTML="";
					
					$.ajax({
						url: "../Proveedores_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valProveedor:				"<%=valProveedor%>",				
							txtNombreProveedor: 	  	$("#txtNombreProveedor").val().toUpperCase(),
							txtRazonSocial: 			$("#txtRazonSocial").val().toUpperCase(),
							txtRfcProveedor: 	  		$("#txtRfcProveedor").val().toUpperCase(),
							txtTelProveedor: 	  		$("#txtTelProveedor").val(),
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
		document.getElementById('sctxtNombreProveedor').innerHTML = "";
		document.getElementById('sctxtRazonSocial').innerHTML = "";
		document.getElementById('sctxtRfcProveedor').innerHTML = "";
		document.getElementById('sctxtTelProveedor').innerHTML = "";

		$("#txtNombreProveedor").val('');
		$("#txtRazonSocial").val('');
		$("#txtRfcProveedor").val('');
		$("#txtTelProveedor").val('');
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
					<td>Nombre:</td>
					<td><input id="txtNombreProveedor" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreProveedor" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Razon Social:</td>
					<td><input id="txtRazonSocial" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtRazonSocial" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>RFC:</td>
					<td><input id="txtRfcProveedor" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtRfcProveedor" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Telefono:</td>
					<td><input id="txtTelProveedor" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtTelProveedor" style="font-size: 10px; color: red;"></span></td>
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
					<td>Clave:</td>
					<td><input id="txtClaveProveedor" disabled="disabled"
						type="text" size="40" maxlength="5" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getClaveProveedor()%>"><span
						id="sctxtClaveProveedor" style="font-size: 15px; color: red;"></span></td>
				</tr>

				<tr>

					<td>Nombre:</td>
					<td><input id="txtNombreProveedor" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombreProveedor()%>"><span
						id="sctxtNombreProveedor" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Razon Social:</td>
					<td><input id="txtRazonSocial" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getRazonSocial()%>"><span
						id="sctxtRazonSocial" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>RFC:</td>
					<td><input id="txtRfcProveedor" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getRfcProveedor()%>"><span
						id="sctxtRfcProveedor" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Telefono:</td>
					<td><input id="txtTelProveedor" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getTelefonoContacto()%>"><span
						id="sctxtTelProveedor" style="font-size: 10px; color: red;"></span></td>
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
