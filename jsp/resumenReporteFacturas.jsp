<%@page import="bean.GestionTareas"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>


<%
	
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	
	String proveedor = request.getParameter("proveedor") != null ? request.getParameter("proveedor"): "";
	String foliofact = request.getParameter("foliofact") != null ? request.getParameter("foliofact"): "";
	String folioorden = request.getParameter("folioorden") != null ? request.getParameter("folioorden"): "";
	String sinfact = request.getParameter("sinfact") != null ? request.getParameter("sinfact"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String pagina = request.getParameter("pagina") != null ? request.getParameter("pagina"): "1";
	String noestatus = request.getParameter("noestatus") != null ? request.getParameter("noestatus"): "";

	GestionTareas llamado= new GestionTareas();
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray acciones= catalogos.consultaAcciones();

	int registrosporpaginaAg = 15;
	String mensaje ="";
	llamado.setCantP(registrosporpaginaAg);
	JSONArray lista = llamado.consultareporteFacturas(proveedor, foliofact, folioorden, sinfact, fechaini, fechafin, Integer.parseInt(pagina));
	
	JSONObject registro = new JSONObject();
	
	int numRegistrosAg = llamado.getNumreg();
	int TOTALPAGINASAg = numRegistrosAg / registrosporpaginaAg;
	String[] accionesDet=null;
	if (numRegistrosAg % registrosporpaginaAg>0 || TOTALPAGINASAg==0)
	{
		TOTALPAGINASAg++;
	}
	int a;int b;
	int c=Integer.parseInt(pagina);
	a = ((c - 1) * registrosporpaginaAg ) + 1;
	b = a  - 1 + lista.length() ;


	if (numRegistrosAg == 0){
		mensaje ="0 registros" ;	
	}else{
		mensaje = a + " al " + b + " de " + numRegistrosAg ;	
	}
	
	JSONObject registroEstado = new JSONObject();
%>


<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px; width: 100%;">
        <thead>
            <tr>
<!-- 		  		<th>Estatus</th> -->
		  		<th style="min-width: 120px;">Proveedor</th>
                <th style="min-width: 120px;">Factura</th>
                <th style="min-width: 120px;">Monto Factura</th>
                <th style="min-width: 120px;">Zona</th>
                <th style="min-width: 120px;">Empresa</th>
                <th style="min-width: 120px;">Sucursal</th>
                <th style="min-width: 120px;">Folio Orden</th>
                <th style="min-width: 120px;">Fecha-Hora Registro OS</th>
                <th style="min-width: 120px;">T&eacute;cnico</th>
                <th style="min-width: 120px;">Nombre T&eacute;cnico</th>

            </tr>
        </thead>
        <tbody>
			<%
				registro = new JSONObject();
			System.out.println("----------------cantidad reg"+lista.length());
				for(int i=0; i<lista.length(); i++)
				{
					registro = lista.getJSONObject(i);
					%>
					<tr class="clickable-row">

						<td><%=registro.getString("proveedor") %></td>
		                <td><%=registro.getString("foliofact") %></td>
		                <td><%=registro.getString("monto") %></td>
		                <td><%=registro.getString("zona") %></td>
		                
		                <td><%=registro.getString("empresa") %></td>
		<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
		<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
		
		                	
		                <td><%=registro.getString("sucursal") %> </td>
		                <td><%=registro.getString("folioorden") %> </td>
		                <td><%=registro.getString("fecha") %> </td>
		                <td><%=registro.getString("cvetecnico") %> </td>
		                <td><%=registro.getString("nombretecnico") %> </td>
	
	           	    </tr>
					
					<%
				}
			%>


		  
           
        </tbody>
    </table>
    
<div style="max-width: 100%; margin-bottom: 20px;">
				<table style="margin: 0 auto;" align="center" width="100%">
                                 <tr> 
                                    <td align="left" width="50%">
                                        <span style="float:left;">                                   
                                        <a href="#" onclick="primerPag();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-first.gif" alt="Primera" width="16" height="16"></a>
                                    	<a href="#" onclick="atras();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-prev.gif" alt="Anterior" width="16" height="16"></a>
                                    	</span>                                    	
                                    	<span id="pageCountDisplC" style="float:left;"><%=mensaje%></span>
                                    	 <span style="float:left;">  
                                    	<a href="#" onclick="siguiente();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-next.gif" alt="Siguiente" width="16" height="16"></a>
                                    	<a href="#" onclick="ultimaPag();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-last.gif" alt="Ultima" width="16" height="16"></a>
                                    	</span>  
                             
                                    </td>
                                    <td align="right" width="50%"> <span>Página <%=pagina %> de <%=TOTALPAGINASAg %> </span></td>
                                </tr>                                
                        </table>
				
					
				</div>
    
 
  <script>
    
//   checkedRows = [];
 	$(function(){

//  		{
//  			$("#ftecnico").prop("disabled",true);
//  		}
//  		else
//  		{
//  			$("#ftecnico").prop("disabled",false);
//  		}

//  		 $('#tablaTareas').DataTable({
//  			 "scrollX": true
//  		 });
//  		var alturaactual = $("div .dataTables_scrollBody").css("height");
// 		alert(alturaactual);
//  		var newheight = parseInt(alturaactual.split("px")[0])+70;
// 		alert(newheight);
//  		$("div .dataTables_scrollBody").css("height",newheight);
//  		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});
	
	var parproveedor = '<%=proveedor%>';
	var parfoliofact = '<%=foliofact%>';
	var parfolioorden = '<%=folioorden%>';
	var parsinfact = '<%=sinfact%>';
	var parfechaini = '<%=fechaini%>';
	var parfechafin = '<%=fechafin%>';
	var paginaAg = <%=pagina%>;
	var totalPaginasAg = <%=TOTALPAGINASAg%>; 
 	
 	function siguiente()
	{
		if (paginaAg < totalPaginasAg)
		{
			paginaAg++;
			var parametros = "accion=C&pagina="+paginaAg+"&usuario=<%=usuario%>";
			if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
	 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
	 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
	 		if(parsinfact!=""){parametros+="&sinfact="+parsinfact;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
// 			alert(parametros);
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteFacturas.jsp?'+parametros);
		}

	}
		
	function atras()
	{
		if (paginaAg > 1 )
		{
			paginaAg--;
			var parametros = "accion=C&pagina="+paginaAg+"&usuario=<%=usuario%>";
			if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
	 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
	 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
	 		if(parsinfact!=""){parametros+="&sinfact="+parsinfact;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteFacturas.jsp?'+parametros);
		}
	}
		
	function primerPag()
	{
		if(paginaAg > 1)
		{
			var parametros = "accion=C&pagina=1"+"&usuario=<%=usuario%>";
			if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
	 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
	 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
	 		if(parsinfact!=""){parametros+="&sinfact="+parsinfact;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteFacturas.jsp?'+parametros);
		}
	}
		
	function ultimaPag()
	{
		if(paginaAg < totalPaginasAg)
		{
			var parametros = "accion=C&pagina="+totalPaginasAg+"&usuario=<%=usuario%>";
			if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
	 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
	 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
	 		if(parsinfact!=""){parametros+="&sinfact="+parsinfact;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteFacturas.jsp?'+parametros);
		}
	}

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});

 </script>   