<%@page import="bean.GestionTareas"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>


<%
	
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	String cliente = request.getParameter("cliente") != null ? request.getParameter("cliente"): "";
	String sucursal = request.getParameter("sucursal") != null ? request.getParameter("sucursal"): "";
	String tecnico = request.getParameter("tecnico") != null ? request.getParameter("tecnico"): "";
	String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String pagina = request.getParameter("pagina") != null ? request.getParameter("pagina"): "1";
	String noestatus = request.getParameter("noestatus") != null ? request.getParameter("noestatus"): "";

	GestionTareas llamado= new GestionTareas();
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	String tipousuario = catalogos.consultaTiposUsuario(usuario);
	JSONArray acciones= catalogos.consultaAcciones();
	if(tipousuario.equals("T"))
	{
		tecnico = usuario;
	}
	int registrosporpaginaAg = 15;
	String mensaje ="";
	llamado.setCantP(registrosporpaginaAg);
	JSONArray lista = llamado.consultaTareas(tipousuario, "4,5", tecnico, orden, cliente, sucursal, fechaini, fechafin,zona,Integer.parseInt(pagina),"noliq"); 
	
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
		  		<th>Estatus</th>
		  		<th style="min-width: 120px;">Orden de Servicio</th>
                <th style="min-width: 120px;">Cliente</th>
                <th style="min-width: 120px;">Zona</th>
                <th style="min-width: 120px;">Sucursal</th>
                <th style="min-width: 120px;">T&eacute;cnico Asignado</th>
                <th style="min-width: 120px;">Fecha/Hora Cita</th>
                <th style="min-width: 120px;">Fecha/Hora inicio</th>
                <th style="min-width: 120px;">Fecha/Hora fin</th>

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
						<td style="text-align:center;">
						<div class="btn-group" style="width: 100%;">
		                		<span style="width:100%; font-size:10px; cursor:pointer; font-weight: bold;" class="label btn-success dropdown-toggle" data-toggle="dropdown" style="font-size: smaller;"><%=registro.getString("estatus") %></span>
		                		<ul class="dropdown-menu" role="menu" style="margin-left: 100px; margin-top: -30px;"> 
		                		
		                		<%
		                			for(int j=0; j<acciones.length(); j++)
		                			{
		                				registroEstado = acciones.getJSONObject(j);
// 		                				System.out.println("acciones--------------------------"+registroEstado.getString("estatus")+ " - "+registro.getString("estatus") +" - "+ registroEstado.getString("tipoorden")+" - "+registro.getString("tipoorden") +" - "+ registroEstado.getString("perfil") +" - "+ tipousuario);
		                				if(registroEstado.getString("estatus").equals(registro.getString("estatus")) && registroEstado.getString("tipoorden").equals(registro.getString("tipoorden")) && registroEstado.getString("perfil").equals(tipousuario))
		                				{
		                					accionesDet = registroEstado.getString("accion").split(" ");

		                					%>
             					
		                					<li ><span onclick="realiza<%=accionesDet[0]%>('<%=registro.getString("idorden") %>','<%=registro.getString("FolioOrden") %>','<%=registroEstado.getString("sigestatus") %>','<%=registro.getString("idestatus") %>','<%=registroEstado.getString("idaccion") %>')" class="btn <%=registroEstado.getString("clase")%> fa <%=registroEstado.getString("icono")%>" style="width: 100%;"  title="<%=registroEstado.getString("accion")%>">
		                					<label style="font-family: monospace; cursor: pointer;" ><%=registroEstado.getString("accion")%></label></span></li>
		                					<%
		                				}
		                			}
		                		%>
<%-- 		                			<li ><span onclick="realizaDETALLE('<%=registro.getString("idorden") %>','<%=registro.getString("FolioOrden") %>')" class="btn btn-primary fa fa-search-plus" style="width: 100%;"  title="DETALLE"> <label style="font-family: monospace; cursor: pointer;">DETALLE</label></span></li> --%>
<%-- 		                		<li ><span onclick="abrirAsignar('<%=registro.getString("idorden") %>','<%=registro.getString("FolioOrden") %>')" class="btn btn-primary fa fa-user-plus" style="width: 100%;"  title="Asignar"> <label style="font-family: monospace; cursor: pointer;">Asignar</label></span></li> --%>
<!-- 		                		<li ><span onclick="abrirformulario('T')" class="btn btn-primary fa fa-play-circle-o" style="width: 100%;"  title="Despachar"> <label style="font-family: monospace; cursor: pointer;">Despachar</label></span></li> -->
<!-- 		                		<li ><span class="btn btn-primary fa fa-search-plus" style="width: 100%;"  title="DETALLE"> <label style="font-family: monospace; cursor: pointer;">DETALLE</label></span></li> -->
		                		</ul>
		                </div>               
		                </td>
						<td><%=registro.getString("FolioOrden") %></td>
		                <td><%=registro.getString("NombreEmpresa") %></td>
		                <td><%=registro.getString("descripcionZona") %></td>
		                <td><%=registro.getString("NombreSucursal") %></td>
		                
		                <td><%=registro.getString("NombreUsuario") %></td>
		<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
		<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
		
		                	
		                <td><%=registro.getString("FechaCita") %> <%=registro.getString("HoraCita") %></td>
		                <td><%=registro.getString("FechaEntrada") %> <%=registro.getString("HoraEntrada") %></td>
		                <td><%=registro.getString("FechaSalida") %> <%=registro.getString("HoraSalida")%></td>
	
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
	
	var parorden = '<%=orden%>';
	var parcliente = '<%=cliente%>';
	var parsucursal = '<%=sucursal%>';
	var partecnico = '<%=tecnico%>';
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
			if(parorden!=""){parametros+="&orden="+parorden;}
	 		if(parcliente!=""){parametros+="&cliente="+parcliente;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
// 			alert(parametros);
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenTareas.jsp?'+parametros);
		}

	}
		
	function atras()
	{
		if (paginaAg > 1 )
		{
			paginaAg--;
			var parametros = "accion=C&pagina="+paginaAg+"&usuario=<%=usuario%>";
			if(parorden!=""){parametros+="&orden="+parorden;}
	 		if(parcliente!=""){parametros+="&cliente="+parcliente;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenTareas.jsp?'+parametros);
		}
	}
		
	function primerPag()
	{
		if(paginaAg > 1)
		{
			var parametros = "accion=C&pagina=1"+"&usuario=<%=usuario%>";
			if(parorden!=""){parametros+="&orden="+parorden;}
	 		if(parcliente!=""){parametros+="&cliente="+parcliente;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
	 		
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenTareas.jsp?'+parametros);
		}
	}
		
	function ultimaPag()
	{
		if(paginaAg < totalPaginasAg)
		{
			var parametros = "accion=C&pagina="+totalPaginasAg+"&usuario=<%=usuario%>";
			if(parorden!=""){parametros+="&orden="+parorden;}
	 		if(parcliente!=""){parametros+="&cliente="+parcliente;}
	 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
	 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
	 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
	 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
			$("#divisionTareas").html('<img style=" margin-left:45%; margin-top:5%; width:100px;" src="../assets/img/gear_load.gif"></img>');
			$("#divisionTareas").load('<%=request.getContextPath()%>'+'/jsp/resumenTareas.jsp?'+parametros);
		}
	}

    $('#tablaTareas').on('click', '.clickable-row', function(event) {
  	  $(this).addClass('active').siblings().removeClass('active');
  	});

 </script>   