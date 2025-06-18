<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="bean.DatosGrafica2"%>

<%@ page import="bean.ConsultaDatosFiltro"%>
<%@ page import="bean.DatosExpTec"%>
<%@ page import="clases.Tarea"%>
<%@page import="java.util.ArrayList"%>

<%
	ConsultaDatosFiltro consulta= new ConsultaDatosFiltro();

	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
JSONArray lista2 = consulta.obtieneFiltro(empresa,division,area,cope,lbr);
 %>
<div id="grafcs2">
	<div class="row mt" style="margin: 5px;">
		<div class="col-md-12"></div>
		<!-- ---------------------------------------------------------------------------------------------------------------->
		<!-- 		serial chart -->
		<div class="col-lg-12">
			<div id="chartdiv" style="width: 100%; height: 500px;"></div>
		</div>
	</div>
</div>

<script src="../assets/js/chart-master/Chart.js"></script>
<script src="../assets/js/chartjs-conf.js"></script>

	<!-- AmChart resources -->
	<script src="../assets/amcharts/amcharts.js"></script>
    <script src="../assets/amcharts/serial.js"></script>
    <script src="../assets/amcharts/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="../assets/amcharts/plugins/export/export.css" type="text/css" media="all" />
    <script src="../assets/amcharts/themes/light.js"></script>
    <script src="../assets/amcharts/themes/black.js"></script>

<script>
	var graficaStack = null;
	var graficaDona = null,

		graficaStack = JSON.parse('<%=lista2.toString()%>');
</script>
<script src="../assets/js/serialChart.js"></script>
	<script src="../assets/js/serialChart2.js"></script>
	<script type="text/javascript">           </script>