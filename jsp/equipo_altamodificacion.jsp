<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Equipo_GestionRegistros"%>
<%@page import="clases.Equipo_Resumen"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String accion = request.getParameter("accion") != null ? request.getParameter("accion") : "";
	String valEquipo = request.getParameter("valEquipo") != null ? request.getParameter("valEquipo") : "";
	String usuarioLogin = request.getParameter("usuarioLogin") != null
			? request.getParameter("usuarioLogin")
			: "";
	JSONArray objCatSuc = null;
	Equipo_GestionRegistros objGestion = new Equipo_GestionRegistros();
	JSONArray objCat = new Equipo_GestionRegistros().obtieneEmpresas();
	Equipo_Resumen objResumen = new Equipo_Resumen();
	if (accion.equals("M")) {
			objResumen = new Equipo_GestionRegistros().consultaRegistro3(valEquipo);
		 	objCatSuc = new Equipo_GestionRegistros().obtieneSucursalesM(objResumen.getEmpresa());
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
			var banSerie = false;
				
				if($("#txtNombreEquipo").val()=="") 
				{
					document.getElementById('sctxtNombreEquipo').innerHTML="Obligatorio!";
					banNom = true;
				}
				if($("#txtEmpresa").val()=="") 
				{
					document.getElementById('sctxtEmpresa').innerHTML="Obligatorio!";
					banZona = true;
				}
				if($("#txtMarca").val()=="") 
				{
					document.getElementById('sctxtMarca').innerHTML="Obligatorio!";
					banPerf = true;
				}
				if($("#txtModelo").val()=="") 
				{
					document.getElementById('sctxtModelo').innerHTML="Obligatorio!";
					banPass = true;
				}
				if($("#txtSerie").val()=="") 
				{
					document.getElementById('sctxtSerie').innerHTML="Obligatorio!";
					banSerie = true;
				}
				if($("#txtSucursal").val()=="") 
				{
					document.getElementById('sctxtSucursal').innerHTML="Obligatorio!";
					banEmp = true;
				}
				if(!banNom && !banPerf && !banPass && !banZona && !banEmp && !banSerie)
				{
					document.getElementById('sctxtNombreEquipo').innerHTML = "";
					document.getElementById('sctxtSucursal').innerHTML = "";
					document.getElementById('sctxtMarca').innerHTML = "";
					document.getElementById('sctxtModelo').innerHTML = "";
					document.getElementById('sctxtSerie').innerHTML = "";
// 					document.getElementById('sctxtEmpresa').innerHTML = "";
					
					$.ajax({
						url: "../Equipo_GestionRegistros",
						cache: false,
						type: "POST",
						data: {
							valEquipo:					"<%=valEquipo%>",				
							txtNombreEquipo: 	  		$("#txtNombreEquipo").val().toUpperCase(),
							txtMarca: 					$("#txtMarca").val().toUpperCase(),
							txtModelo: 	  				$("#txtModelo").val().toUpperCase(),
							txtSucursal: 	  			$("#txtSucursal").find("option:selected").attr("id"),
							txtSerie: 	  				$("#txtSerie").val().toUpperCase(),
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
	
	function ObtieneSucursales( empresa) //estaba idregistro
	{
		document.getElementById('txtSucursal').innerHTML = "";
		var datosjson = null;
			$.ajax({
				url: "../Equipo_GestionRegistros",
				cache: false,
				type: "POST",
				data: {
					empresaSel: empresa.value,
				    accion : 'O',
				},
				success:function(res)
				{
					datosjson = $.parseJSON(res);
					var opt;
	 	       		opt = document.createElement('option');
	 	       		opt.value = "";
				    opt.innerHTML = "Seleccione";
				    opt.id = "";

				    document.getElementById('txtSucursal').appendChild(opt);
				    opt = document.createElement('option');
	 	       		opt.value = "";
				    opt.innerHTML = "Seleccione";

					$.each(datosjson.sucursales, function(i, item)
				    {		 
				     	opt = document.createElement('option');  
 		    			opt.value = item.description; 
      					opt.innerHTML = item.description;
 						opt.id = item.value; 
					    document.getElementById('txtSucursal').appendChild(opt);
				    });
					
				}
			});
	}
	
	function cancelar() {
		document.getElementById('sctxtNombreEquipo').innerHTML = "";
		document.getElementById('sctxtMarca').innerHTML = "";
		document.getElementById('sctxtModelo').innerHTML = "";
		document.getElementById('sctxtSerie').innerHTML = "";
		document.getElementById('sctxtEmpresa').innerHTML = "";
		document.getElementById('sctxtSucursal').innerHTML = "";

		$("#txtNombreEquipo").val('');
		$("#txtMarca").val('');
		$("#txtModelo").val('');
		$("#txtSerie").val('');
		$("#txtSucursal").val('');
		$("#txtEmpresa").val('');
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
					<td><select id="txtEmpresa" style="width: 264px;" onchange="ObtieneSucursales(this);">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registroEmp = new JSONObject();
									for (int i = 0; i < objCat.length(); i++) {
										registroEmp = objCat.getJSONObject(i);
							%>
							<option value="<%=registroEmp.getString("value")%>"><%=registroEmp.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Sucursal:</td>
					<td><select id="txtSucursal" style="width: 264px;">
					</select><span id="sctxtSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Nombre:</td>
					<td><input id="txtNombreEquipo" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtNombreEquipo" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Marca:</td>
					<td><input id="txtMarca" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtMarca" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Modelo:</td>
					<td><input id="txtModelo" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtModelo" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>
					<td>Serie:</td>
					<td><input id="txtSerie" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"><span
						id="sctxtSerie" style="font-size: 10px; color: red;"></span></td>
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
					<td><select id="txtEmpresa" style="width: 264px;" onchange="ObtieneSucursales(this);">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registroEmp = new JSONObject();
									for (int i = 0; i < objCat.length(); i++) {
										registroEmp = objCat.getJSONObject(i);
							%>
							<option value="<%=registroEmp.getString("value")%>" <%if (registroEmp.getString("value").equals(objResumen.getEmpresa())){ %> selected="true" <%} %>       ><%=registroEmp.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtEmpresa" style="font-size: 10px; color: red;"></span></td>
				</tr>

				<tr>
					<td>Sucursal:</td>
					<td><select id="txtSucursal" style="width: 264px;">
							<option value="">Seleccionar..</option>
							<%
								JSONObject registroSuc = new JSONObject();
									for (int i = 0; i < objCatSuc.length(); i++) {
										registroSuc = objCatSuc.getJSONObject(i);
							%>
							<option value="<%=registroSuc.getString("value")%>" <%if (registroSuc.getString("value").equals(objResumen.getSucursal())){ %> selected="true" <%} %>       ><%=registroSuc.getString("description")%></option>
							<%
								}
							%>
					</select><span id="sctxtSucursal" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Nombre:</td>
					<td><input id="txtNombreEquipo" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getNombre()%>"><span
						id="sctxtNombreEquipo" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Marca:</td>
					<td><input id="txtMarca" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getMarca()%>"><span
						id="sctxtMarca" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Modelo:</td>
					<td><input id="txtModelo" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getModelo()%>"><span
						id="sctxtModelo" style="font-size: 10px; color: red;"></span></td>
				</tr>
				<tr>

					<td>Serie:</td>
					<td><input id="txtSerie" type="text" size="75"
						maxlength="75" style="width: 264px; text-transform:uppercase;"
						value="<%=objResumen.getSerie()%>"><span
						id="sctxtSerie" style="font-size: 10px; color: red;"></span></td>
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
