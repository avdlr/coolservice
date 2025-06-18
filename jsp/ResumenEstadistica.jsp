<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="bean.ConsultaDatosFiltro"%>
<%@ page import="bean.DatosGrafica"%>


<%
	DatosGrafica consulta = new DatosGrafica();
	ConsultaDatosFiltro consulta3= new ConsultaDatosFiltro();

	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
	JSONArray lista = consulta.consultaDatosEstadistica(empresa, division, area, cope, lbr);
	JSONArray lista3 = consulta3.obtieneFiltro(empresa,division,area,cope,lbr);
	
	int pixels = 400;
	int margen = 0;
	if (lista3.length() <= 2){pixels = 200; margen = 150;}
 %>

<div id="grafcs">
	<div class="row mt" style="margin: 5px;"> 
		<div class="col-md-12"></div>
		<!-- ------------------------------------------------------------------------------------------>
		<div class="col-lg-4">
			<h4>
				<i class="fa fa-angle-right"></i> Graficas pie y stocked 
			</h4>
			<div id="chartdiv0" style="width: 100%; height: 400px;"></div>
		</div>

		<!-- 		serial chart -->
		<div class="col-lg-8">
			<div id="chartdiv" style="width: 100%; margin-top: <%= margen %>px; height: <%= pixels %>px;"></div>
		</div>
	</div>
</div>

<script src="../assets/js/chart-master/Chart.js"></script>
<script src="../assets/js/chartjs-conf.js"></script>

<!-- AmChart resources -->
<script src="../assets/amcharts/amcharts.js"></script>
<script src="../assets/amcharts/serial.js"></script>
<script src="../assets/amcharts/pie.js"></script>
<script src="../assets/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="../assets/amcharts/plugins/export/export.css" type="text/css"
	media="all" />
<script src="../assets/amcharts/themes/light.js"></script>
<script src="../assets/amcharts/themes/black.js"></script>

<script>
    var graficaStack = null;
	var graficaDona = null,

		graficaDona = JSON.parse('<%=lista.toString()%>'); 
		graficaStack = JSON.parse('<%=lista3.toString()%>');
</script>
<script src="../assets/js/serialChart.js"></script>
	<script src="../assets/js/pieChart.js">   </script>
	<script type="text/javascript">           </script>