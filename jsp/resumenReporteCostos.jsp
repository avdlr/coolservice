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

	GestionTareas llamado= new GestionTareas();
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	JSONArray acciones= catalogos.consultaAcciones();

	int registrosporpaginaAg = 15;
	String mensaje ="";
	llamado.setCantP(registrosporpaginaAg);
	JSONArray lista = llamado.consultareporteCostos(empresa, sucursal, tipoorden, fechaini, fechafin, Integer.parseInt(pagina));
	
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
		  		<th style="min-width: 120px;">Empresa</th>
                <th style="min-width: 120px;">Scursal</th>
                <th style="min-width: 120px;" align="center">Total Trabajos</th>
                <th style="min-width: 120px;" align="center">Total con Factura</th>
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
		                <td style="background-color: #00a65a !important; color:#FFFFFF; cursor: pointer;" align="center" onclick="abrirDetalleReporte('<%=registro.getString("idempresa") %>', '<%=registro.getString("idsucursal") %>','', '<%=registro.getString("sucursal") %>', '<%=fechaini %>', '<%=fechafin %>','N')"><%=registro.getString("total") %> </td>
		                <td style="background-color: #3c8dbc !important; color:#FFFFFF; cursor: pointer;" align="center" onclick="abrirDetalleReporte('<%=registro.getString("idempresa") %>', '<%=registro.getString("idsucursal") %>','', '<%=registro.getString("sucursal") %>', '<%=fechaini %>', '<%=fechafin %>','S')"><%=registro.getString("totalfact") %></td>
		                
		                <td><%=registro.getString("montofact") %></td>
		<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
		<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
		
		                	
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
				<div id="dialog"></div>
    
 
  <script>
    
//   checkedRows = [];
 	$(function(){
 		
 		var modaldialog = $("#dialog").dialog({
	        autoOpen: false,
	        modal: true,
	        title: "",
	        width: 30,
	        height: 30,

	        buttons: 
	        [ 
//	        	{ id:"aceptarform","data-test":"data test", 
//	        		text: "Aceptar", 
//	        		click:    function() {
//	        			$( this ).dialog( "close" ); 
	        			
//	        			},
//	        		class: "btn btn-defaulf"
//	        	},
	        	{ id:"cancelarform","data-test":"data test", 
	        		text: "Cancelar", 
	        		click:    function() {
//	        			alert($('#cancelarform').data('test')); 
	        			$( this ).dialog( "close" ); 
	        			},
	        		class: "btn btn-defaulf"
	        	}
	        ]
	        
	    });

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
	
	var parempresa = '<%=empresa%>';
	var parsucursal = '<%=sucursal%>';
	var partipoorden = '<%=tipoorden%>';
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
			if(parempresa!=""){parametros+="&empresa="+parempresa;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partipoorden!=""){parametros+="&tipoorden="+partipoorden;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
// 			alert(parametros);
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}

	}
		
	function atras()
	{
		if (paginaAg > 1 )
		{
			paginaAg--;
			var parametros = "accion=C&pagina="+paginaAg+"&usuario=<%=usuario%>";
			if(parempresa!=""){parametros+="&empresa="+parempresa;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partipoorden!=""){parametros+="&tipoorden="+partipoorden;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}
		
	function primerPag()
	{
		if(paginaAg > 1)
		{
			var parametros = "accion=C&pagina=1"+"&usuario=<%=usuario%>";
			if(parempresa!=""){parametros+="&empresa="+parempresa;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partipoorden!=""){parametros+="&tipoorden="+partipoorden;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}
		
	function ultimaPag()
	{
		if(paginaAg < totalPaginasAg)
		{
			var parametros = "accion=C&pagina="+totalPaginasAg+"&usuario=<%=usuario%>";
			if(parempresa!=""){parametros+="&empresa="+parempresa;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partipoorden!=""){parametros+="&tipoorden="+partipoorden;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenReporteCostos.jsp?'+parametros);
		}
	}

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});
    
    
    function abrirDetalleReporte(idempresamod, idsucursalmod,empresamod, sucursalmod, fechainimod, fechafinmod,confact)
    {
    $("#container").mLoading("show");
	var w = window.innerWidth;
	var h = window.innerHeight;
	var tituloform = "";
	var alto = 0;

		tituloform = "Detalle Reporte de Costos ";
		alto=h-150;
		
		if(w<600)
		{
			alto=h;
		}
		else
		{
			alto = 700;
		}

	var modaldialog = $("#dialog").dialog({
	        autoOpen: false,
	        modal: true,
	        title: tituloform,
	        width: w-30,
	        height: alto,

	        buttons: 
	        [ 
//	        	{ id:"aceptarform","data-test":"data test", 
//	        		text: "Aceptar", 
//	        		click:    function() {
//	        			$( this ).dialog( "close" ); 
	        			
//	        			},
//	        		class: "btn btn-defaulf"
//	        	},
	        	{ id:"cancelarform","data-test":"data test", 
	        		text: "Cancelar", 
	        		click:    function() {
//	        			alert($('#cancelarform').data('test')); 
	        			$( this ).dialog( "close" ); 
	        			},
	        		class: "btn btn-defaulf"
	        	}
	        ]
	        
	    });
	

		$("#dialog").load("resumenReporteCostosDetalle.jsp?empresa="+escape(idempresamod)+"&sucursal="+escape(idsucursalmod)+"&fechaini="+escape(fechainimod)+"&fechafin="+escape(fechafinmod)+"&confact="+confact);

		$("#dialog").dialog("open");
		 
    }


 </script>   