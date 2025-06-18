
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="servlet.Usuarios_ObtieneRegistros"%>
<%@ page import="clases.Usuarios_Resumen"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@page import="zntclases.Resumen" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--[if lt IE 10]>
        	<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />
        	<script src="<%=request.getContextPath()%>/js/html5.js"></script>
        	<![endif]-->
<script type="text/javascript">	
		<%
		
		String mensaje="";
		Usuarios_ObtieneRegistros objConf = new Usuarios_ObtieneRegistros();
		int registrosporpaginaAg=12;
		String valUsuario = request.getParameter("valUsuario")!=null ? request.getParameter("valUsuario"):"";
		String usuarioLogin = request.getParameter("usuarioLogin")!=null ? request.getParameter("usuarioLogin"):"";
		String PAGINAAg  = request.getParameter("pagina") != null ? request.getParameter("pagina"):"1";
		ArrayList lista_resumenConfiguracion = new ArrayList();
	  	lista_resumenConfiguracion = objConf.obtieneResConf(valUsuario,Integer.parseInt(PAGINAAg));
		String numRegistrosAg = String.valueOf(objConf.obtieneTotalReg(valUsuario));
		int TOTALPAGINASAg = Integer.parseInt(numRegistrosAg) / registrosporpaginaAg;
		if (Integer.parseInt(numRegistrosAg) % registrosporpaginaAg>0 || TOTALPAGINASAg==0)
		{
			TOTALPAGINASAg++;
		}
		int a;int b;
		int c=Integer.parseInt(PAGINAAg);
		a = ((c - 1) * 12 ) + 1;
		b = a  - 1 + lista_resumenConfiguracion.size() ;

		if (Integer.parseInt(numRegistrosAg) == 0){
			mensaje ="0 registros" ;	
		}else{
			mensaje = a + " al " + b + " de " + numRegistrosAg ;	
		}
	%>
		var valUsuario = "<%=valUsuario%>";
		$('#dvDescripcion').hide();

		function information_show()
		{
			 var alto  = $(document).height();
		     var ancho = $(document).width();
		     var top   = (alto/2)-100;
		     var left  = (ancho/2)-300;      
			$('#dvDescripcion').css({top:top,left:(left)}).fadeIn(500);
		}
		function information_hide()
		{
			$('#dvDescripcion').fadeOut(500);
		}
		function cambiacolor_over(celda)
		{
			celda.style.backgroundColor="#76BAF8";  
			celda.style.color ="red";
		}
		function cambiacolor_out(celda)
		{
			if(celda.id=="odd")
			{
			celda.style.backgroundColor="#E6EEEE";
			celda.style.color ="black";
			}
			else
			{
			celda.style.backgroundColor="#ffffff";	
			celda.style.color ="black";
			}
			
		}
		var paginaAg = <%=PAGINAAg%>;
		var totalPaginasAg = <%=TOTALPAGINASAg%>;
		
	 

		 
		function siguienteAg()
	
		{
			if (paginaAg < totalPaginasAg)
			{
				paginaAg++;
				var parametros = "";
				var usuarioLogin = "<%=usuarioLogin%>";
				if(valUsuario!="") { parametros+="&valUsuario="+escape(valUsuario); }
				parametros += "&pagina="+paginaAg;
				parametros += "&usuarioLogin="+usuarioLogin;
				 
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/usuarios_resumen.jsp?'+parametros);
			}

		}
		
		function atrasAg()
		{
			if (paginaAg > 1 )
			 
			{
				paginaAg--;
				var parametros = "";
				var usuarioLogin = "<%=usuarioLogin%>";
				if(valUsuario!="") { parametros+="&valUsuario="+escape(valUsuario); }
				parametros += "&pagina="+paginaAg;
				parametros += "&usuarioLogin="+usuarioLogin;
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/usuarios_resumen.jsp?'+parametros);
			}
		}

		function primerPagAg()
	
		{
			if(paginaAg > 1)
			 
			{
				var parametros = "";
				var usuarioLogin = "<%=usuarioLogin%>";
				if(valUsuario!="") { parametros+="&valUsuario="+escape(valUsuario); }
				parametros += "&pagina=1";
				parametros += "&usuarioLogin="+usuarioLogin;
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/usuarios_resumen.jsp?'+parametros);
			}
		}
			
		function ultimaPagAg()
		{
			if(paginaAg < totalPaginasAg)
		 
			{
				var parametros = "";
				var usuarioLogin = "<%=usuarioLogin%>";
				if(valUsuario!="") { parametros+="&valUsuario="+escape(valUsuario); }
				parametros += "&pagina="+totalPaginasAg;
				parametros += "&usuarioLogin="+usuarioLogin;
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/usuarios_resumen.jsp?'+parametros);
			}
		}
			
$(function() {
				
	$(window).resize(function() {     
		$("#dialogoDetalle").dialog("option", "position", "center"); 
		});
				
				$( "#dialogoDetalle").dialog({
					title:'Detalle Agenda ',
			        autoOpen: false,
			        resizable: true,
			        modal: true,
				    width: 883,
				    height: 490
			    }); 
				
				$( 'a#link' ).click(function(e) {
				
					e.preventDefault();
					var a = this;
					$("#dialogoDetalle").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
					$("#dialogoDetalle").load(a.href);
					$("#dialogoDetalle").dialog( "open" );
					return false;
				});
				
				$( 'INPUT#cerrarDiv' ).click(function(e) {
					
					e.preventDefault();
					var a = this;
					$("#dialogoDetalle").load(a.href);
					$("#dialogoDetalle").dialog( "close" );
					return false;
				});
				
			});

			function abrirDialogo(url)
			{
				$("#dialogoDetalle").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#dialogoDetalle").load(url);
				$("#dialogoDetalle").dialog( "open" );
			}
			
			var visible = false;
			
			function limpiarFiltros()
			{
				limpia_Filtros();
				$("#divresumenListaBlanca").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
				$("#divresumenListaBlanca").load('<%=request.getContextPath()%>'+'/jsp/usuarios_resumen.jsp?');
			}
		 
		function altaCambioRegistro(accion, valUsuario)
		{     
		
			$('#divAgregarRegistro').fadeIn(500);
			
			$(window).resize(function() {     
			 	$("#divAgregarRegistro").dialog("option", "position", "center"); 
			 	});
			if(accion=="A"){
			$( "#divAgregarRegistro").dialog({
				title:'Agregar',
			    autoOpen: false,
			    resizable: false,
			    modal: true,
			    align: "center",
			    width: 450,
			    height: 200, 
			
		 
			}); 
			
		}else{
			$( "#divAgregarRegistro").dialog({
				title:'Cambio',
			    autoOpen: false,
			    resizable: false,
			    modal: true,
			    align: "center",
			    width: 450,
			    height: 200, 
			
		 
			}); 
		}
			$("#divAgregarRegistro").html('<img style=" margin-left:0%; margin-top:5%; width:100px;" src="../img/circulo.gif"></img>');
			$("#divAgregarRegistro").load('<%=request.getContextPath()%>' + '/jsp/usuarios_altamodificacion.jsp?accion='+accion+'&valUsuario='+valUsuario+'&usuarioLogin='+'<%=usuarioLogin%>');
			$("#divAgregarRegistro").dialog('open');
		}
		
		function eliminarRegistro( claveUsuario) //estaba idregistro
		{
			if (confirm('¿Esta seguro que desea eliminar el registro?')) 
			{
				$.ajax({
					url: "../Usuarios_GestionRegistros",
					cache: false,
					type: "POST",
					data: {
						valUsuario: claveUsuario,
						usuarioLogin: "<%=usuarioLogin%>",
					    accion : 'E',
					},
					success:function(res)
					{
						if(res=="ERROR")
						{
							alert("Error al eliminar el registro");
						}
						else
						{
							alert("Exito");
							recargaJSP();
						}
						
					}
				});
			}
		}
		
		function actualizarTabla()
		{
	location.reload();
		}
		</script>
</head>
<body>
	<div style="overflow: auto;">
		<div align="right" >
			<a onclick="altaCambioRegistro('A','')" title="Agregar Registro"><img
				alt="Agregar Registro" src="../img/agregar16.png"
				style="cursor: pointer;"></a> <a id="imglimFiltros"
				onclick="limpiarFiltros()" title="Limpiar filtros"><img alt=""
				src="../img/eraseFilterIcon16.png" style="cursor: pointer;"></a>
		</div>
		<div style="overflow: auto;">
			<table class="tablaResumen" cellspacing="0" border="0">
				<thead>
					<tr>
						<th align='center' style="width: 80px">Clave</th>
						<th align='center' style="width: 80px">Nombre</th>
						<th align='center' style="width: 80px">Password</th>
						<th align='center' style="width: 80px">Perfil</th>
						<th align='center' style="width: 80px">Zona</th>
<!-- 						<th align='center' style="width: 80px">Fecha Creacion</th> -->
<!-- 						<th align='center' style="width: 80px">Usuario Alta</th> -->
						<th align='center' style="width: 80px">Estatus</th>


						<th align='center' style="width: 80px">Acciones</th>
					</tr>
				</thead>

				<%
					Usuarios_Resumen objResumenConfiguracion = new Usuarios_Resumen();
									 			int i;
									 			String bgcolor = "";
													for (i = 0; i < lista_resumenConfiguracion.size(); i++) {
														objResumenConfiguracion = (Usuarios_Resumen)lista_resumenConfiguracion.get(i);
														if( bgcolor.equals("") ){
														     bgcolor = "odd";
														     
														}else{
														     bgcolor = "";
														}
				%>
				<tbody>

					<TR valign="middle" class="<%=bgcolor%>">
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getClaveUsuario()%></TD>
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getNombreUsuario()%></TD>
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getPassword()%></TD>
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getPerfilUsuario()%></TD>
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getZona()%></TD>
						<%-- PASO 9  AGREGAR EL REGISTRO ---%>
<%-- 						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getFechaHoraUsuario()%></TD> --%>
<%-- 						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getCreacionUsuario()%></TD> --%>
						<TD align="left" id="<%=bgcolor%>">&nbsp;<%=objResumenConfiguracion.getEstatusUsuario()%></TD>
						
							<td align="center" id="<%=bgcolor%>">
							<a
								onclick="altaCambioRegistro('M','<%=objResumenConfiguracion.getClaveUsuario().trim()%>')"
								title="Editar Registro"><img alt="Editar Registro"
									src="../img/editar5.png" style="cursor: pointer;"></a> 
									<a
								onclick="eliminarRegistro('<%=objResumenConfiguracion.getClaveUsuario().trim()%>')"
								title="Eliminar Registro"><img alt="Eliminar Registro"
									src="../img/eliminar2.png" style="cursor: pointer;"></a>
									</TD>
						
					</TR>


					<% 
						}
						if( bgcolor.equals("") )
						{
						     bgcolor = "odd";
						     
						}
						else
						{
						     bgcolor = "";
						}
					%>
				
				<tbody>

					<%
						 int j;
						 for(j=11; j >= i; j-- ) {
						  if( bgcolor.equals("") ){
						     bgcolor = "odd";
						   }else{
						     bgcolor = "";
						}
					%>

					<TR valign="middle" class="<%=bgcolor%>">
						<TD colspan="26">&nbsp;</TD>
					</TR>
					<%
						}
					%>

				</tbody>
			</table>
		</div>
		<div style="overflow: auto; margin-left: 2%;">
			<table style="margin: 0 auto;" align="center" width="100%">
				<tr>
					<td align="left" width="50%"><span style="float: left;">
							<a href="#" onclick="primerPagAg();"><img border="0"
								src="<%=request.getContextPath()%>/img/page-first.gif"
								alt="Primera" width="16" height="16"></a> <a href="#"
							onclick="atrasAg();"><img border="0"
								src="<%=request.getContextPath()%>/img/page-prev.gif"
								alt="Anterior" width="16" height="16"></a>
					</span> <span id="pageCountDisplC" style="float: left;"><%=mensaje%></span>
						<span style="float: left;"> <a href="#"
							onclick="siguienteAg();"><img border="0"
								src="<%=request.getContextPath()%>/img/page-next.gif"
								alt="Siguiente" width="16" height="16"></a> <a href="#"
							onclick="ultimaPagAg();"><img border="0"
								src="<%=request.getContextPath()%>/img/page-last.gif"
								alt="Ultima" width="16" height="16"></a>
					</span></td>
				</tr>
			</table>


		</div>
		<div id="dvDescripcion" style="position: absolute;"></div>
	</div>
	<div id="divAgregarRegistro"></div>
</body>
</html>