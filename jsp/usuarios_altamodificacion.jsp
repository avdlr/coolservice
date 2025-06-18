<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Usuarios_GestionRegistros"%>
<%@page import="clases.Usuarios_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valUsuario = request.getParameter("valUsuario") != null ? request.getParameter("valUsuario") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";
			
	Usuarios_GestionRegistros objGestion = new Usuarios_GestionRegistros();
	JSONArray objCat = new Usuarios_GestionRegistros().obtienePerfiles();
	JSONArray objCat2 = new Usuarios_GestionRegistros().obtieneEmpresas(); 
	JSONArray objCat3 = new Usuarios_GestionRegistros().obtieneZonas(); 
	Usuarios_Resumen objResumen = new Usuarios_Resumen();
	if (accion.equals("M")) {
			objResumen = new Usuarios_GestionRegistros().consultaRegistro3(valUsuario);
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
			var valorEmp = <%=objResumen.getPerfilUsuario()%>;
			if(valorEmp=="7"){
				$('.trhideclass1').show();
				
			} else{
				$('.trhideclass1').hide();
			}
			
			 
	function agregaRegistro() {
		
			var banNom = false;
			var banPass = false;
			var banPerf = false;
			var banEmpr = false;
			var banZona = false;
			
				
				if($("#txtNombreUsuario").val()=="") 
				{
					document.getElementById('sctxtNombreUsuario').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtPasswordUsuario").val()=="") 
				{
					document.getElementById('sctxtPasswordUsuario').innerHTML="Obligatorio!";
					banPass = true;
				}
				if($("#txtPerfilUsuario").val()=="") 
				{
					document.getElementById('sctxtPerfilUsuario').innerHTML="Obligatorio!";
					banPerf = true;
				}
				if($("#txtZona").val()=="") 
				{
					document.getElementById('sctxtZona').innerHTML="Obligatorio!";
					banZona = true;
				}
				if($("#txtPerfilUsuario option:selected").text()=="Usuario Externo" && $("#txtEmpresa").val()=="") 
				{
					document.getElementById('sctxtEmpresa').innerHTML="Obligatorio!";
					banEmpr = true;
				}
				
				
				
				if(!banNom && !banPass && !banPerf && !banEmpr && !banZona)
				{
					document.getElementById('sctxtNombreUsuario').innerHTML="";
					document.getElementById('sctxtPasswordUsuario').innerHTML="";
					document.getElementById('sctxtPerfilUsuario').innerHTML="";
					document.getElementById('sctxtEmpresa').innerHTML="";
					document.getElementById('sctxtZona').innerHTML="";
					
					$.ajax({
						url: "../Usuarios_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valUsuario:				"<%=valUsuario%>",				
							txtNombreUsuario: 	  	$("#txtNombreUsuario").val().toUpperCase(),
							txtPasswordUsuario: 	$("#txtPasswordUsuario").val().toUpperCase(),
							txtPerfilUsuario: 	  	$("#txtPerfilUsuario").val().toUpperCase(),
							txtEmpresa: 	  		$("#txtEmpresa").val().toUpperCase(),
							txtZona: 	  			$("#txtZona").val().toUpperCase(),
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
	
	function validaPerfil() {
		
		if($("#txtPerfilUsuario option:selected").text()=="Usuario Externo") 
		{
			$('.trhideclass1').show();
		} else{
			$('.trhideclass1').hide();
		}
	}

	function cancelar() {
		document.getElementById('sctxtNombreUsuario').innerHTML = "";
		document.getElementById('sctxtPasswordUsuario').innerHTML = "";
		document.getElementById('sctxtPerfilUsuario').innerHTML = "";
		document.getElementById('sctxtEmpresa').innerHTML = "";
		document.getElementById('sctxtZona').innerHTML = "";

		$("#txtNombreUsuario").val('');
		$("#txtPasswordUsuario").val('');
		$("#txtPerfilUsuario").val('');
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
					<td>Nombre:</td>
					<td><input id="txtNombreUsuario" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input id="txtPasswordUsuario" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtPasswordUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Perfil:</td>
					<td><select id="txtPerfilUsuario" style="width: 264px;" onchange="validaPerfil()">
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
					</select><span id="sctxtPerfilUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Zona:</td>
					<td><select id="txtZona" style="width: 264px;" onchange="validaPerfil()">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro3 = new JSONObject();
									for (int i = 0; i < objCat3.length(); i++) {
										registro3 = objCat3.getJSONObject(i);
							%>
							<option value="<%=registro3.getString("value")%>"><%=registro3.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtZona" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr class="trhideclass1">
					<td>Empresa:</td>
					<td><select id="txtEmpresa" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro2 = new JSONObject();
									for (int i = 0; i < objCat2.length(); i++) {
										registro2 = objCat2.getJSONObject(i);
							%>
							<option value="<%=registro2.getString("value")%>"><%=registro2.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
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
					<td><input id="txtClaveUsuario" disabled="disabled"
						type="text" size="40" maxlength="5" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getClaveUsuario()%>"><span
						id="sctxtClaveUsuario" style="font-size: 15px; color: red;"></span></td>
				</tr>

				<tr>

					<td>Nombre:</td>
					<td><input id="txtNombreUsuario" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombreUsuario()%>"><span
						id="sctxtNombreUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input id="txtPasswordUsuario" type="text" size="20"
						maxlength="20" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getPassword()%>"><span
						id="sctxtPasswordUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Perfil:</td>
					<td><select id="txtPerfilUsuario" style="width: 264px;" onchange="validaPerfil()">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro = new JSONObject();
									for (int i = 0; i < objCat.length(); i++) {
										registro = objCat.getJSONObject(i);
							%>
							<option value="<%=registro.getString("value")%>" <%if (registro.getString("value").equals(objResumen.getPerfilUsuario())){ %> selected="true" <%} %>       ><%=registro.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtPerfilUsuario" style="font-size: 10px; color: red;"></span></td>
				</tr>
				
				<tr>
					<td>Zona:</td>
					<td><select id="txtZona" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro3 = new JSONObject();
									for (int i = 0; i < objCat3.length(); i++) {
										registro3 = objCat3.getJSONObject(i);
							%>
							<option value="<%=registro3.getString("value")%>" <%if (registro3.getString("value").equals(objResumen.getZona())){ %> selected="true" <%} %>       ><%=registro3.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtZona" style="font-size: 10px; color: red;"></span></td>
				</tr>
				
				<tr class="trhideclass1">
					<td>Empresa:</td>
					<td><select id="txtEmpresa" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registro2 = new JSONObject();
									for (int i = 0; i < objCat2.length(); i++) {
										registro2 = objCat2.getJSONObject(i);
							%>
							<option value="<%=registro2.getString("value")%>" <%if (registro2.getString("value").equals(objResumen.getEmpresa())){ %> selected="true" <%} %>       ><%=registro2.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
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
