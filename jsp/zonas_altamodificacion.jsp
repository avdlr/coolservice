<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Zonas_GestionRegistros"%>
<%@page import="clases.Zonas_Resumen"%>
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

	Zonas_GestionRegistros objGestion = new Zonas_GestionRegistros();
	Zonas_Resumen objResumen = new Zonas_Resumen();
	if (accion.equals("M")) {
			objResumen = new Zonas_GestionRegistros().consultaRegistro3(valZona);
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
				
				if($("#txtNombreZona").val()=="") 
				{
					document.getElementById('sctxtNombreZona').innerHTML="Obligatorio!";
					banNom = true;
				}
				
				if(!banNom)
				{
					document.getElementById('sctxtNombreZona').innerHTML="";
					
					$.ajax({
						url: "../Zonas_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valZona:				"<%=valZona%>",				
							txtNombreZona: 	  	$("#txtNombreZona").val().toUpperCase(),
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
		document.getElementById('sctxtNombreZona').innerHTML = "";

		$("#txtNombreZona").val('');
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
					<td><input id="txtNombreZona" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreZona" style="font-size: 10px; color: red;"></span></td>
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
					<td><input id="txtClaveZona" disabled="disabled"
						type="text" size="40" maxlength="5" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getClaveZona()%>"><span
						id="sctxtClaveZona" style="font-size: 15px; color: red;"></span></td>
				</tr>

				<tr>

					<td>Nombre:</td>
					<td><input id="txtNombreZona" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getDescripcionZona()%>"><span
						id="sctxtNombreZona" style="font-size: 10px; color: red;"></span></td>
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
