<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.GestionTareas"%>
<%
	
%>
<div class="col-xs-12">
<div style="width: 100%;"align="center"><button style="margin-bottom: 10px;" class="btn btn-default" onclick="generarExcel()"><img alt="" src="../img/pdf.png" style="width: 20px;"> Generar PDF</button></div>

</div>
<script type="text/javascript">

function generarExcel()
{
	
	window.open("../GeneraImpreso?idOrden=32&folioOrden=32603777");
	
}



</script>

