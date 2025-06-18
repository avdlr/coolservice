<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Empresas_GestionRegistros"%>
<%@page import="clases.Empresas_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valEmpresa = request.getParameter("valEmpresa") != null ? request.getParameter("valEmpresa") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";

	Empresas_GestionRegistros objGestion = new Empresas_GestionRegistros();
	Empresas_Resumen objResumen = new Empresas_Resumen();
	if (accion.equals("M")) {
			objResumen = new Empresas_GestionRegistros().consultaRegistro3(valEmpresa);
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
			var banNomCorto = false;
			var banRfc = false;
				
				if($("#txtNombreEmpresa").val()=="") 
				{
					document.getElementById('sctxtNombreEmpresa').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtNombreCortoEmpresa").val()=="") 
				{
					document.getElementById('sctxtNombreCortoEmpresa').innerHTML="Obligatorio!";
					banNomCorto = true;
				}
				if($("#txtRfcEmpresa").val()=="") 
				{
					document.getElementById('sctxtRfcEmpresa').innerHTML="Obligatorio!";
					banRfc = true;
				}
				
				
				if(!banNom && !banNomCorto && !banRfc)
				{
					document.getElementById('sctxtNombreEmpresa').innerHTML="";
					document.getElementById('sctxtNombreCortoEmpresa').innerHTML="";
					document.getElementById('sctxtRfcEmpresa').innerHTML="";
					
					$.ajax({
						url: "../Empresas_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valEmpresa:				"<%=valEmpresa%>",				
							txtNombreEmpresa: 	  	$("#txtNombreEmpresa").val().toUpperCase(),
							txtNombreCortoEmpresa: 	$("#txtNombreCortoEmpresa").val().toUpperCase(),
							txtRfcEmpresa: 	  		$("#txtRfcEmpresa").val().toUpperCase(),
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
		document.getElementById('sctxtNombreEmpresa').innerHTML = "";
		document.getElementById('sctxtNombreCortoEmpresa').innerHTML = "";
		document.getElementById('sctxtRfcEmpresa').innerHTML = "";

		$("#txtNombreEmpresa").val('');
		$("#txtNombreCortoEmpresa").val('');
		$("#txtRfcEmpresa").val('');
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
					<td><input id="txtNombreEmpresa" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Nombre Corto:</td>
					<td><input id="txtNombreCortoEmpresa" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreCortoEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>RFC:</td>
					<td><input id="txtRfcEmpresa" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtRfcEmpresa" style="font-size: 10px; color: red;"></span></td>
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
					<td><input id="txtClaveEmpresa" disabled="disabled"
						type="text" size="40" maxlength="5" style="width: 264px;"
						value="<%=objResumen.getClaveEmpresa()%>"><span
						id="sctxtClaveEmpresa" style="font-size: 15px; color: red;"></span></td>
				</tr>

				<tr>

					<td>Nombre:</td>
					<td><input id="txtNombreEmpresa" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombreEmpresa()%>"><span
						id="sctxtNombreEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Nombre Corto:</td>
					<td><input id="txtNombreCortoEmpresa" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombreCortoEmpresa()%>"><span
						id="sctxtNombreCortoEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>RFC:</td>
					<td><input id="txtRfcEmpresa" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getRfcEmpresa()%>"><span
						id="sctxtRfcEmpresa" style="font-size: 10px; color: red;"></span></td>
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
