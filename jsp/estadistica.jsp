<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="bean.DatosGrafica"%>
<%@ page import="bean.DatosGrafica2"%>

<%@ page import="bean.ConsultaDatosFiltro"%>
<%@ page import="bean.DatosExpTec"%>
<%@ page import="clases.Tarea"%>
<%@page import="java.util.ArrayList"%>
<%

	DatosGrafica consulta = new DatosGrafica();
	DatosGrafica2 consulta2 = new DatosGrafica2();
	ConsultaDatosFiltro consulta3= new ConsultaDatosFiltro();
	
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
	JSONArray lista = consulta.consultaDatosEstadistica(empresa, division, area, cope, lbr);
	JSONArray lista2 = consulta2.consultaDatosEstadistica2(lbr);
	
	//arraylists para obtener los datos de division, area y cope y mostrarlos en filtro
	JSONArray DivisionLista = consulta3.obtieneDivisiones(lbr, request.getParameter("empresa") != null ? request.getParameter("empresa"): ""); 
	JSONArray AreaLista = consulta3.obtieneAreas(lbr,request.getParameter("division") != null ? request.getParameter("division"): "");
	JSONArray CopeLista = consulta3.obtieneCopes(lbr,request.getParameter("area") != null ? request.getParameter("area"): "");
	JSONArray lista3 = consulta3.obtieneFiltro(empresa,division,area,cope,lbr);

%>
<section class="wrapper">
<div class="row mt" style="margin:5px;">
<div class="col-md-12"><h4>Consulta de tareas por estatus</h4></div>
<!-- --------- -->
	<div class="col-md-12" style="background-color: #77a2ce; padding-bottom: 12px; padding-top: 10px;">
<!-- 		----------------------------------------------------------Empresa--------------------------------------- -->
			<div class="col-sm-6 col-md-4 col-lg-2">
				<div class="row" style="padding-top: 5px;">
					<div class="col-xs-3 col-sm-4" style="color: #FFFFFF;">Empresa:</div>
					<div class="col-xs-9 col-sm-8">

		<script type="text/javascript">
			$('#empresa').multiselect({
			buttonWidth: '100%',
			includeSelectAllOption: true});
		</script>

						<select id="empresa" class="form-control input-sm" multiple style="width: 100%; text-align: left;"onchange="cambioFiltrosDivision()">
							<option  value="06">TELMEX</option>
							<option  value="01">SISCOPE</option>
							<option  value="02">INTELMEX</option>
						</select>
					</div>
				</div>
			</div>
			
<!-- 			------------------------------------------------------ Division ----------------------------------------------->
			<div class="col-sm-6 col-md-4 col-lg-2">
				<div class="row" style="padding-top: 5px;">
					<div class="col-xs-3 col-sm-4" style="color: #FFFFFF;">Divisi&oacute;n:</div>
					<div class="col-xs-9 col-sm-8">
					
						<select id="division" class="form-control input-sm" onchange="cambioFiltrosArea()"> <!--  onchange="deshabilitarDivisionVsArea()" -->
							<option value="">Seleccionar...</option>
							<%
								int jD;
									JSONObject obj2D;
									for ( jD = 0; jD < DivisionLista.length(); jD++) {				
									obj2D = (JSONObject)DivisionLista.getJSONObject(jD);
							%>
							<option value="<%=obj2D.getString("id")%>"><%=obj2D.getString("desc")%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
			</div>
			
<!-- 			------------------------------------------------------ Area ----------------------------------------------->
			
			<div class="col-sm-6 col-md-4 col-lg-2">
				<div class="row" style="padding-top: 5px;">
					<div class="col-xs-3 col-sm-4" style="color: #FFFFFF;">Area:
					</div>
					<div class="col-xs-9 col-sm-8">
						<select id="area" class="form-control input-sm" onchange="cambioFiltrosCope()"> <!--  disabled onchange="deshabilitarAreaVsCope()"  -->
							<option value="">Seleccionar...</option>
							<%
								int jA;
									JSONObject obj2A;
									for ( jA = 0; jA < AreaLista.length(); jA++) {				
									obj2A = (JSONObject)AreaLista.getJSONObject(jA);
							%>
							<option value="<%=obj2A.getString("id")%>"><%=obj2A.getString("desc")%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
			</div>
			
<!-- 			------------------------------------------------------ Cope ----------------------------------------------->
			
			<div class="col-sm-6 col-md-4 col-lg-2">
				<div class="row" style="padding-top: 5px;">
					<div class="col-xs-3 col-sm-4" style="color: #FFFFFF;">Cope:
					</div>
					<div class="col-xs-9 col-sm-8">
						<select id="cope" class="form-control input-sm"  ><!-- disabled -->
							<option value="">Seleccionar...</option>
							<%
								int jC;
								JSONObject obj2C;
								for (jC = 0; jC < CopeLista.length(); jC++) {
									obj2C = (JSONObject) CopeLista.getJSONObject(jC);
							%>
							<option value="<%=obj2C.getString("id")%>"><%=obj2C.getString("desc")%></option>
							<%
								}
							%>

						</select>
					</div>
				</div>
			</div>


			<!-- FIN -->

			<div
				class="col-md-4 col-lg-2 col-lg-offset-0 col-md-offset-0 col-sm-offset-2 "
				align="right">
				<div class="row">
					<div class="col-xs-6">
						<button class="btn btn-primary" onclick="cargaGraficaFiltro()"
							style="">
							<span class="fa fa-filter"></span> Consultar
						</button>
					</div>
					<div class="col-xs-6">
						<button id="btnlimpiar" class="btn btn-primary"	style="">
							<span class="fa fa-eraser"></span> Limpiar
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
             
<!-- ------------------------------------------------------------AQUI EMPIEZAN GRAFICAS  ↓ -->
<div id="grafcs">
	<div class="row mt" style="margin: 5px;">
		<div class="col-md-12">
		</div>
		<!-- ------------------------------------------------------------------------------------------>
		<div class="col-lg-4">
			<div id="chartdiv0" style="width: 100%; height: 400px;"></div>
		</div>

		<!-- 		serial chart -->
		<div class="col-lg-8">
			<div id="chartdiv" style="width: 100%; height: 400px;"></div>
		</div>
	</div>
</div>
	<!-- ------------------------------------------------------------------------------------------------------------------- -->
	
</section>

<script src="../assets/js/chart-master/Chart.js"></script>
<script src="../assets/js/chartjs-conf.js"></script>

	<!-- AmChart resources -->
	<script src="../assets/amcharts/amcharts.js"></script>
    <script src="../assets/amcharts/serial.js"></script>
    <script src="../assets/amcharts/pie.js"></script>
    <script src="../assets/amcharts/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="../assets/amcharts/plugins/export/export.css" type="text/css" media="all" />
    <script src="../assets/amcharts/themes/light.js"></script>
    <script src="../assets/amcharts/themes/black.js"></script>

<!--    EN SRC CAMBIAR A LA DEBIA -->

<script>

	var graficaStack = null;
	var graficaDona = null,

		graficaDona = JSON.parse('<%=lista.toString()%>'); 
		graficaStack = JSON.parse('<%=lista3.toString()%>');
		
		function setDepth() {
			if (document.getElementById("rb2").checked) {
				chart.depth3D = 15;
				chart.angle = 30;
				chart2.depth3D = 15;
				chart2.angle = 30;

			} else {
				chart.depth3D = 0;
				chart.angle = 0;
				chart2.depth3D = 0;
				chart2.angle = 0;
			}
			chart.validateNow();
			//chart2.validateNow();
			$('a[href="http://www.amcharts.com/javascript-charts/"]').css("display","none");
		}

// 		function deshabilitarDivisionVsArea() {
// 			if (document.getElementById("division").value != "") {
// 				document.getElementById("area").disabled = false;
// 			} else {
// 				document.getElementById("area").disabled = true;
// 				document.getElementById("cope").disabled = true;
// 				document.getElementById("cope").innerHTML = "<option value=\"\">Seleccionar...</option>";
// 				document.getElementById("cope").value = "";
// 			}
// 		}

// 		function deshabilitarAreaVsCope() {
// 			if (document.getElementById("division").value != "") {
// 				document.getElementById("cope").disabled = false;
// 			} else {
// 				document.getElementById("cope").disabled = true;
// 			}
// 		}
		
		$('#btnlimpiar').click(function(){
			$('#empresa').multiselect('deselect',['06','01','02']);
			$("#division").val("");
			$("#area").val("");
			$("#cope").val("");
		
			cambioFiltrosDivision();
			cambioFiltrosArea();
			cambioFiltrosCope();
		});
		
		//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
		//CAMBIAR CARGA DE TABLA A GRAFICAS
		function cargaGraficaFiltro()
		{
	 		var parempresa = $("#empresa").val();
	 		var pardivision = $("#division option:selected").val();
	 		var pararea = $("#area option:selected").val();
	 		var parcope = $("#cope option:selected").val();
	 		
	 		var parametros = "lbr="+'<%=lbr%>';
	 		
	 		if(parempresa!=""){parametros+="&empresa="+parempresa;}
	 		if(pardivision!=""){parametros+="&division="+pardivision;}
	 		if(pararea!=""){parametros+="&area="+pararea;}
	 		if(parcope!=""){parametros+="&cope="+parcope;}
	 		
	 		$("#grafcs").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
	 		$.ajax({
				url: 'ResumenEstadistica.jsp?'+parametros,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#grafcs").html(resp);
				}
		  });
	 	}
		//▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
		
		function cambioFiltrosDivision(){
		var parempresa = $("#empresa").val();
		var parametros = "accion=division&lbr="+'<%=lbr%>';
 		
 		if(parempresa!=""){parametros+="&empresa="+parempresa;}
 		
 		$("#division").html("<option value=''>Seleccionar...</option>" );
 		$("#area").html("<option value=\"\">Seleccionar...</option>" );
 		$("#cope").html("<option value=\"\">Seleccionar...</option>" );
 		$("#division").disabled=true;
 		$.ajax({
 			url: '../ConsultaTablaZe?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				var parseo = JSON.parse(resp);
				$.each(parseo, function(i, item)
					    {
		 	       			opt = document.createElement('option');
				 	       		opt.value = item.id;
							    opt.innerHTML = item.desc;
							    document.getElementById('division').appendChild(opt);
				 	    });
				$("#division").disabled=false;
			}
 		})
	}
		
		function cambioFiltrosArea(){
	 		var pardivision = $("#division option:selected").val();
			var parametros = "accion=area&lbr="+'<%=lbr%>';
	 		
	 		if(pardivision!=""){parametros+="&division="+pardivision;}
			
	 		$("#area").html("<option value=''>Seleccionar...</option>" );
	 		$("#cope").html("<option value=\"\">Seleccionar...</option>" );
	 		$("#area").disabled=true;
	 		$.ajax({
	 			url: '../ConsultaTablaZe?'+parametros,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					var parseo = JSON.parse(resp);
					$.each(parseo, function(i, item)
						    {
			 	       			opt = document.createElement('option');
					 	       		opt.value = item.id;
								    opt.innerHTML = item.desc;
								    document.getElementById('area').appendChild(opt);
					 	    });
					$("#area").disabled=false;
				}
	 		})
		}
		
		function cambioFiltrosCope(){
	 		var pararea = $("#area option:selected").val();
			var parametros = "accion=cope&lbr="+'<%=lbr%>';

			if (pararea != "") {parametros += "&area=" + pararea;}

			$("#cope").html("<option value=''>Seleccionar...</option>" );
			$("#cope").disabled = true;
			$.ajax({
				url : '../ConsultaTablaZe?' + parametros,
				type : "GET",
				cache : false,

				success : function(resp) {
					var parseo = JSON.parse(resp);
					$.each(parseo, function(i, item) {
						opt = document.createElement('option');
						opt.value = item.id;
						opt.innerHTML = item.desc;
						document.getElementById('cope').appendChild(opt);
					});
					$("#cope").disabled=false;
				}
			})
		}
		
</script>
	<script src="../assets/js/serialChart.js"></script>
	<script src="../assets/js/pieChart.js">   </script>
	<script type="text/javascript">           </script>