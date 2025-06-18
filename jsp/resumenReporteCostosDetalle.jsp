<%@page import="bean.GestionTareas"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>


<%
	
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String sucursal = request.getParameter("sucursal") != null ? request.getParameter("sucursal"): "";
	String tipoorden = request.getParameter("tipoorden") != null ? request.getParameter("tipoorden"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String pagina = request.getParameter("pagina") != null ? request.getParameter("pagina"): "1";
	String confact = request.getParameter("confact") != null ? request.getParameter("confact"): "N";

	GestionTareas llamado= new GestionTareas();
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray acciones= catalogos.consultaAcciones();

	int registrosporpaginaAgDET = 15;
	String mensaje ="";
	llamado.setCantP(registrosporpaginaAgDET);
	JSONArray lista = llamado.consultareporteCostosDetalle(empresa, sucursal, tipoorden, fechaini, fechafin, Integer.parseInt(pagina),confact);
	
	JSONObject registro = new JSONObject();
	
	int numRegistrosAg = llamado.getNumreg();
	int totalPaginasAgDET = numRegistrosAg / registrosporpaginaAgDET;
	String[] accionesDet=null;
	if (numRegistrosAg % registrosporpaginaAgDET>0 || totalPaginasAgDET==0)
	{
		totalPaginasAgDET++;
	}
	int a;int b;
	int c=Integer.parseInt(pagina);
	a = ((c - 1) * registrosporpaginaAgDET ) + 1;
	b = a  - 1 + lista.length() ;


	if (numRegistrosAg == 0){
		mensaje ="0 registros" ;	
	}else{
		mensaje = a + " al " + b + " de " + numRegistrosAg ;	
	}
	
	JSONObject registroEstado = new JSONObject();
%>

<div class="col.xs-12" align="right"><button  id="btnExcel" onclick="generarExcel()" title="Generar Excel" class="btn btn-default btn-xs"><img alt="" src="../img/647702-excel-512.png" style="width: 20px;">&nbsp;Generar Excel</button></div>
<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px; width: 100%; margin-top: 15px;">
        <thead>
            <tr>
<!-- 		  		<th>Estatus</th> -->
		  		<th style="min-width: 120px;">Empresa</th>
                <th style="min-width: 120px;">Scursal</th>
                <th style="min-width: 120px;">Estatus</th>
                <th style="min-width: 120px;">Folio Orden</th>
                <th style="min-width: 120px;">T&eacute;cnico</th>
                <th style="min-width: 120px;">Nombre T&eacute;cnico</th>
                <th style="min-width: 120px;">Monto Facturas</th>
                <th style="min-width: 120px;">Costo Estimado</th>


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

						<td><%=registro.getString("empresa") %></td>
		                <td><%=registro.getString("sucursal") %></td>
		                <td><%=registro.getString("estatus") %></td>
		                <td><%=registro.getString("folio") %></td>
		                
		                <td><%=registro.getString("cvetecnico") %></td>
		<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
		<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
		
		                	
		                <td><%=registro.getString("tecnico") %> </td>
		                 <td><%=registro.getString("montofact") %> </td>
		                  <td><%=registro.getString("costoestimado") %> </td>

	
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
                                        <a href="#" onclick="primerPagDET();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-first.gif" alt="Primera" width="16" height="16"></a>
                                    	<a href="#" onclick="atrasDET();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-prev.gif" alt="Anterior" width="16" height="16"></a>
                                    	</span>                                    	
                                    	<span id="pageCountDisplC" style="float:left;"><%=mensaje%></span>
                                    	 <span style="float:left;">  
                                    	<a href="#" onclick="siguienteDET();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-next.gif" alt="Siguiente" width="16" height="16"></a>
                                    	<a href="#" onclick="ultimaPagDET();"><img border="0" src="<%=request.getContextPath()%>/assets/img/page-last.gif" alt="Ultima" width="16" height="16"></a>
                                    	</span>  
                             
                                    </td>
                                    <td align="right" width="50%"> <span>Página <%=pagina %> de <%=totalPaginasAgDET %> </span></td>
                                </tr>                                
                        </table>
				
					
				</div>
    
 
  <script>
    
//   checkedRows = [];
 	$(function(){
 		$("#container").mLoading("hide");

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
	
	var parempresaDET = '<%=empresa%>';
	var parsucursalDET = '<%=sucursal%>';
	var partipoordenDET = '<%=tipoorden%>';
	var parfechainiDET = '<%=fechaini%>';
	var parfechafinDET = '<%=fechafin%>';
	var paginaAgDET = <%=pagina%>;
	var totalPaginasAgDET = <%=totalPaginasAgDET%>; 
	var confact = '<%=confact%>'; 
 	
 	function siguienteDET()
	{
		if (paginaAgDET < totalPaginasAgDET)
		{
			paginaAgDET++;
			var parametros = "accion=C&pagina="+paginaAgDET+"&usuario=<%=usuario%>";
			if(parempresaDET!=""){parametros+="&empresa="+parempresaDET;}
	 		if(parsucursalDET!=""){parametros+="&sucursal="+parsucursalDET;}
	 		if(partipoordenDET!=""){parametros+="&tipoorden="+partipoordenDET;}
	 		if(parfechainiDET!=""){parametros+="&fechaini="+parfechainiDET;}
	 		if(parfechafinDET!=""){parametros+="&fechafin="+parfechafinDET;}
	 		if(confact!=""){parametros+="&confact="+confact;}
// 			alert(parametros);
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}

	}
		
	function atrasDET()
	{
		if (paginaAgDET > 1 )
		{
			paginaAgDET--;
			var parametros = "accion=C&pagina="+paginaAgDET+"&usuario=<%=usuario%>";
			if(parempresaDET!=""){parametros+="&empresa="+parempresaDET;}
	 		if(parsucursalDET!=""){parametros+="&sucursal="+parsucursalDET;}
	 		if(partipoordenDET!=""){parametros+="&tipoorden="+partipoordenDET;}
	 		if(parfechainiDET!=""){parametros+="&fechaini="+parfechainiDET;}
	 		if(parfechafinDET!=""){parametros+="&fechafin="+parfechafinDET;}
	 		if(confact!=""){parametros+="&confact="+confact;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}
		
	function primerPagDET()
	{
		if(paginaAgDET > 1)
		{
			var parametros = "accion=C&pagina=1"+"&usuario=<%=usuario%>";
			if(parempresaDET!=""){parametros+="&empresa="+parempresaDET;}
	 		if(parsucursalDET!=""){parametros+="&sucursal="+parsucursalDET;}
	 		if(partipoordenDET!=""){parametros+="&tipoorden="+partipoordenDET;}
	 		if(parfechainiDET!=""){parametros+="&fechaini="+parfechainiDET;}
	 		if(parfechafinDET!=""){parametros+="&fechafin="+parfechafinDET;}
	 		if(confact!=""){parametros+="&confact="+confact;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}
		
	function ultimaPagDET()
	{
		if(paginaAgDET < totalPaginasAgDET)
		{
			var parametros = "accion=C&pagina="+totalPaginasAgDET+"&usuario=<%=usuario%>";
			if(parempresaDET!=""){parametros+="&empresa="+parempresaDET;}
	 		if(parsucursalDET!=""){parametros+="&sucursal="+parsucursalDET;}
	 		if(partipoordenDET!=""){parametros+="&tipoorden="+partipoordenDET;}
	 		if(parfechainiDET!=""){parametros+="&fechaini="+parfechainiDET;}
	 		if(parfechafinDET!=""){parametros+="&fechafin="+parfechafinDET;}
	 		if(confact!=""){parametros+="&confact="+confact;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});
    
    function generarExcel()
    {
    	
    	var parametros = "tipo=costos&titulo="+escape("Reporte de Costos")+"&usuario=<%=usuario%>";
    	if(parempresaDET!=""){parametros+="&empresa="+parempresaDET;}
 		if(parsucursalDET!=""){parametros+="&sucursal="+parsucursalDET;}
 		if(partipoordenDET!=""){parametros+="&tipoorden="+partipoordenDET;}
 		if(parfechainiDET!=""){parametros+="&fechaini="+parfechainiDET;}
 		if(parfechafinDET!=""){parametros+="&fechafin="+parfechafinDET;}
 		if(confact!=""){parametros+="&confact="+confact;}
 		
    	window.open("../ExcelReportes?"+parametros);
    	
    }
   
 </script>   