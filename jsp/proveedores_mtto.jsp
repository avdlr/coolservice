<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html>
	<head>

		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="Pragma" content="no-cache">
		<title>Proveedores</title>
		
<%-- 		<script src="<%=request.getContextPath()%>/assets/js/jquery-1.8.0.js"	type="text/javascript"></script> --%>
<%--         <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style1.css"  type="text/css" media="screen" /> --%>
<%-- 		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/smoothness/jquery-ui-1.8.22.custom.css" type="text/css" media="screen" /> --%>
<!-- 		<script type="text/javascript" src="../assets/js/jquery-ui-1.8.22.custom.min.js"></script> -->
<%-- 		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/jquery-ui.css" type="text/css" media="screen" />  --%>

     	<!--[if lt IE 9]>
      	  <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
       	 <script src="<%=request.getContextPath()%>/js/html5.js"></script>
       	 <![endif]-->
       	 <%
       		String usuarioLogin = request.getParameter("usuario")!=null ? request.getParameter("usuario"):"";
       	 %>
		<script type="text/javascript" >
			
			var datosjson = null;
			
			$.ajax({
				url: "../Proveedores_ObtieneRegistros",   
				cache: false,
				type: "POST",
				success:function(res){
					
					datosjson = $.parseJSON(res);
					var opt;
	 	       		opt = document.createElement('option');
	 	       		opt.value = "";
				    opt.innerHTML = "Seleccione";
				    opt.id = "";

				    document.getElementById('cmbProveedores').appendChild(opt);
				    opt = document.createElement('option');
	 	       		opt.value = "";
				    opt.innerHTML = "Seleccione";

					$.each(datosjson.proveedores, function(i, item)
				    {		 
				     	opt = document.createElement('option');  
 		    			opt.value = item.NombreProveedor; 
      					opt.innerHTML = item.idcsproveedores + " - " + item.NombreProveedor;
 						opt.id = item.idcsproveedores; 
					    document.getElementById('cmbProveedores').appendChild(opt);
				    });
			  
					recargaJSP();
				}
			});   
			
			function limpia_Filtros()
			{
				var selct = document.getElementById('cmbProveedores');
				var opt;
				opt = selct.options[0];
				opt.selected = true;
		 
			}
			
			function recargaJSP()
			{
				var valProveedor = $("#cmbProveedores").find("option:selected").attr("id");
				var usuarioLogin = "<%=usuarioLogin%>";
				
				var parametros = "valProveedor="+valProveedor;
				parametros += "&usuarioLogin="+usuarioLogin;
				$("#divresumenListaBlanca").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/proveedores_resumen.jsp?'+parametros);
			}
			
			function obtieneValCmb()
			{
				var valProveedor = $("#cmbProveedores").find("option:selected").attr("id");
				var usuarioLogin = "<%=usuarioLogin%>";
			  
				var parametros = "valProveedor="+valProveedor;
				parametros += "&usuarioLogin="+usuarioLogin;
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
		        $("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/proveedores_resumen.jsp?'+parametros);
			}
		</script>
	</head>
	<body>
		<section id="main" class="wrapper">
		<div class="col-xs-12">
  			<article class="module width_full">
				<div class="container">
					<header id="header">
						<h2 class="section_title" style="text-align: center;">Proveedores</h2>
					</header>
				</div>
				<table align="center" style="padding-top:10px">
					<tr>
						<td style="width: 85%;">
							Proveedores:
							<select class="filtros" id="cmbProveedores" style="width: 75%;">
							</select> 
						</td>
						<td style="width: 15%;">
							<button onclick="obtieneValCmb()" style="width:100%;"  class="btn-primary-custom"><img alt="" style="max-height:13px;">Consultar</button> 
						</td>
					</tr>
				</table>
				<br>
				<div id="dialogoDetalle" align="center"></div>
				<div id="divresumenListaBlanca" align="center"></div> 
						<!-- <div id="divresumenConfDias" align="center"></div> --> 
				</article>
				</div>
		</section>
	</body>
</html>