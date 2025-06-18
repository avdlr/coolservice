<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="bean.GestionTareas"%>
<%
String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "0";
String zona = request.getParameter("zona") != null ? request.getParameter("zona"): "";
String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
GestionTareas llamado = new GestionTareas();
ConsultaCatalogo catalogos = new ConsultaCatalogo();
JSONArray zonas = catalogos.consultaZonas();
JSONArray tipomantenimiento = catalogos.consultaTipoTrabajo("");
String descEmpresa = catalogos.consultaDescEmpresa(empresa);

int registrosporpaginaAg = 6;
int registrosporpaginaSu = 20;

int numRegistrosAg = llamado.totalRegZonaCliente(empresa, zona, fechaini, fechafin);
int TOTALPAGINASAg = numRegistrosAg / registrosporpaginaAg;

if (numRegistrosAg % registrosporpaginaAg>0 || TOTALPAGINASAg==0)
{
	TOTALPAGINASAg++;
}
if(TOTALPAGINASAg<2)
{
	TOTALPAGINASAg=2;
}
int numRegistrosSu = llamado.totalRegSucursalCliente(empresa, "", fechaini, fechafin);
int TOTALPAGINASSu = numRegistrosSu / registrosporpaginaSu;

if (numRegistrosSu % registrosporpaginaSu>0 || TOTALPAGINASSu==0)
{
	TOTALPAGINASSu++;
}
%>
<section class="wrapper">    

    
<!--     <div class="row"> -->
<!--          <div class="col-md-12 "> -->
 
<!--          <ul class="list-inline text-gray"> -->
<!-- 			   <li class="text-primary"> <h2>Dashboard </h2> </li> -->
<!-- <!-- 			   <li id="lblDivStat"></li> --> 
<!-- <!-- 			   <li id="lblAreStat"></li>     --> 
<!-- <!-- 			   <li id="lblCopStat"></li> --> 
<!-- 		</ul>   -->
<!--          </div> -->
       
<!--     </div> -->
         <!--**********************************************************************************************************************************************************  --> 
         <!--************************************************************  ROW 1  *************************************************************************************  --> 
         <!--**********************************************************************************************************************************************************  --> 
          	<div class="row" >
          	<div class="col-xs-12 " style="margin-top:15px;">

<!--           	<div class="col-xs-12 col-sm-6 col-md-3" style="margin-top:5px;"> -->
<!--           		<div class="row"> -->
<!--           			<div class="col-xs-4">Tipo Trabajo:</div> -->
<!--           			<div class="col-xs-8"> -->
<!--           				<select class="form-control input-sm" id="ftipot"> -->
<!--           					<option value="">Seleccionar...</option> -->
<%--           					<% --%>
<!-- // 								registro = new JSONObject(); -->
<!-- // 								for (int i=0; i<tipomantenimiento.length(); i++) -->
<!-- // 								{ -->
<!-- // 									registro = tipomantenimiento.getJSONObject(i); -->
<%-- 									%> --%>
<%-- 										<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option> --%>
<%-- 									<% --%>
<!-- // 								} -->
<%-- 							%> --%>
<!--           				</select> -->
<!--           			</div> -->
<!--           		</div> -->
<!--           	</div> -->
          	<div class="col-xs-12 col-sm-6 col-md-3" style="margin-top:5px;">
          	<div class="row">
          			<div class="col-xs-4">Fecha Inicial:</div>
          			<div class="col-xs-8">
          				<div class='input-group date' id='fechainicio'>
                    <input type='text' class="form-control" value="<%=fechaini %>" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
          			</div>
          		</div>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-3" style="margin-top:5px;">
          	<div class="row">
          			<div class="col-xs-4">Fecha Fin:</div>
          			<div class="col-xs-8">
          				<div class='input-group date' id='fechafin'>
                    <input type='text' class="form-control" value="<%=fechafin %>" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
          			</div>
          		</div>
          	</div>
          	<div class="col-xs-12 col-sm-6 col-md-3" style="margin-top:5px;" align="left">
          	<button class="btn btn-default" onclick="consultaSemaforos()"><span class="fa fa-filter"></span>Consultar</button>
          	<button class="btn btn-default" style="margin-left: 5px; display: inline-block;" onclick="limpiarFiltros()"><span class="fa fa-eraser"></span>Limpiar</button>
          	</div>
          	</div>
          	<div class="col-xs-12 " style="margin-top:5px;">
          		<span style="color:#000; font-weight: bold;">Empresa:</span> <span style="font-weight: bold;"><%=descEmpresa %></span>
          	</div>
          	<%
          	for(int i=0; i<TOTALPAGINASAg; i++){ %>
          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"  style="padding-top:5px; min-height: 280px;" id="visorzona<%=i%>">

<!-- 		          	<strong class="text-primary"> Trabajos de Técnicos (Rango Fechas)</strong> -->
<!-- 		          		<div class="blue-box table-responsive" id="agendasVencidas"><table style="width:100%;" class="tableOciLeft" > <tbody> -->
<!-- 		          		<tr class="trHeaderOci"> <th class="text-left"> Empresa </th> <th> Total </th> <th> Liquiados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr> -->
<!-- 		          		<tr><td align="left">PACIFICO</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Hoy','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mañana','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','2 a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mayor a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NORTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">2</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">0</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NOROESTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">5</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td></tr> -->
<!-- 					<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
<!-- 		          		</table></div> -->
<!-- 					<div class="row text-center footerBlueBox"> -->
<!-- 						<div class="col-xs-12 col-md-12 col-sm-12 "> -->
<!-- 							<label id="rcallAGV" class="aWithe"><i class="fa fa-refresh"></i> Actualizar</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
	          	</div>
	          	<%} %>
	          	
	          	<%
          	for(int i=0; i<TOTALPAGINASSu; i++){ %>
          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"  style="padding-top:5px;" id="visorsucursal<%=i%>">

<!-- 		          	<strong class="text-primary"> Trabajos de Técnicos (Rango Fechas)</strong> -->
<!-- 		          		<div class="blue-box table-responsive" id="agendasVencidas"><table style="width:100%;" class="tableOciLeft" > <tbody> -->
<!-- 		          		<tr class="trHeaderOci"> <th class="text-left"> Empresa </th> <th> Total </th> <th> Liquiados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr> -->
<!-- 		          		<tr><td align="left">PACIFICO</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Hoy','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mañana','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','2 a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mayor a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NORTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">2</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">0</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NOROESTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">5</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td></tr> -->
<!-- 					<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
<!-- 		          		</table></div> -->
<!-- 					<div class="row text-center footerBlueBox"> -->
<!-- 						<div class="col-xs-12 col-md-12 col-sm-12 "> -->
<!-- 							<label id="rcallAGV" class="aWithe"><i class="fa fa-refresh"></i> Actualizar</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
	          	</div>
	          	<%} %>


     </div>
     <div id="dialog"></div>
          	
          
                     
          
  <script>
  /*************************************************************************************************************/
  /***********************************Oculta los letreso de division are acope que estan seleccionados**********/
  /*************************************************************************************************************/
  
  $("").css("display","block");
  /***********************Al terminar de cargar la el documento*************************************************/
  //Detona y calcula el size de la ventana y acomoda los semaforos dependiendo la resolucion de la ventana
  var totalPaginasAg = <%=TOTALPAGINASAg%>; 
  var totalPaginasSu = <%=TOTALPAGINASSu%>
			  $(document).ready(function() {
				  
				  $("#dialog").dialog({
			 	        autoOpen: false,
			 	        modal: true,
			 	        title: "Formulario",
			 	        buttons: {
			 	            Close: function () {
			 	                $(this).dialog('close');
			 	            }
			 	        }
			 	    });
					
					$('#fechainicio').datetimepicker(
							{
//			 					 format: 'YYYY-MM-DD HH:MM:ss' 
								format: 'YYYY-MM-DD' 
							});
					$('#fechafin').datetimepicker({
//			 			format: 'YYYY-MM-DD HH:MM:ss' 
						format: 'YYYY-MM-DD' 
					});
// 					$("#fzonas").select2();
					$("#ftipot").select2();
					$("#fechainicio").keypress(function(event) {event.preventDefault();});
					$("#fechafin").keypress(function(event) {event.preventDefault();});
					

					for(var i=0; i<totalPaginasAg; i++)
					{
						consultaZonaVisor(i, '<%=fechaini%>', '<%=fechafin%>', i+1);
					}
					
					for(var i=0; i<totalPaginasSu; i++)
					{
						consultaSucursalVisor(i, '<%=fechaini%>', '<%=fechafin%>', i+1);
					}
					

					intervalid = setInterval(function(){consultaSemaforos(); }, 60000);
					
				});
  
  function consultaZonaVisor(iddiv, fechainicio, fechafin, pagina)
  {
	  var param="empresa=<%=empresa%>&fechaini="+fechainicio+"&fechafin="+fechafin+"&pagina="+pagina;
	  $("#visorzona"+iddiv).html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorClienteZonas.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#visorzona"+iddiv).html(resp);
			}
	  });
  }
  
  function consultaSucursalVisor(iddiv, fechainicio, fechafin, pagina)
  {
	  var param="empresa=<%=empresa%>&fechaini="+fechainicio+"&fechafin="+fechafin+"&pagina="+pagina;
	  $("#visorsucursal"+iddiv).html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorClienteSucursal.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#visorsucursal"+iddiv).html(resp);
			}
	  });
  }
  
  function consultaTrabajosTecnicoRango(zona, fechainicio, fechafin)
  {
	  var param="zona="+zona+"&fechaini="+fechainicio+"&fechafin="+fechafin;
	  $("#trabajostecnicorango").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTrabajosTecnicoRango.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajostecnicorango").html(resp);
			}
	  });
  }
  
  function consultaTrabajoEmpresa(zona, fechainicio, fechafin)
  {
	  var param="zona="+zona+"&fechaini="+fechainicio+"&fechafin="+fechafin;
	  $("#trabajoempresahoy").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTrabajosEmpresa.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajoempresahoy").html(resp);
			}
	  });
  }
  
  function consultaTecnicos(zona, fechainicio, fechafin)
  {
	  var param="zona="+zona+"&fechaini="+fechainicio+"&fechafin="+fechafin;
	  $("#trabajostecnicos").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTecnicos.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajostecnicos").html(resp);
			}
	  });
  }
  
  function actualizaconsultaTecnicos()
  {
// 	  var parzona = $("#fzonas").val();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  consultaTecnicos(parzona,parfechaini,parfechafin);
  }
  
  function consultaTrabajoEmpresaRango(zona, fechainicio, fechafin)
  {
	  var param="zona="+zona+"&fechaini="+fechainicio+"&fechafin="+fechafin;
	  $("#trabajoempresarango").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTrabajosEmpresaRango.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajoempresarango").html(resp);
			}
	  });
  }
  
  function actualizaconsultaTrabajoEmpresa()
  {
// 	  var parzona = $("#fzonas").val();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  consultaTrabajoEmpresa(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajoEmpresaRango()
  {
// 	  var parzona = $("#fzonas").val();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  if(parzona==""){parzona="0";}
	  consultaTrabajoEmpresaRango(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajosTecnico()
  {
// 	  var parzona = $("#fzonas").val();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  consultaTrabajosTecnico(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajosTecnicoRango()
  {
// 	  var parzona = $("#fzonas").val();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
// 	  if(parzona==""){parzona=0;}
	  
	  consultaTrabajosTecnicoRango(parzona,parfechaini,parfechafin);
  }
  
  function consultaSemaforos()
  {
// 	  var parzona = $("#fzonas").val();
	  ocultarmenu();
	  var parzona ="";
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  
	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
	  $.ajax({
			url: 'dashboardCliente.jsp?usuario=<%=usuario%>&empresa=<%=empresa%>&fechaini='+parfechaini+"&fechafin="+parfechafin,
//				data: ,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				 $("#main-content").html(resp);
				 
			}
	  });
  }
  

  
  
  function abrirResumenGeneral(empresapar, zonapar, fechainipar, fechafinpar, tipo, estatuspar,usuariopar,pagina,estatusgeneral,nombredetalle)
  {
  	$("#container").mLoading("show");
  	var w = window.innerWidth;
  	var h = window.innerHeight;
  	var tituloform = "";
  	var alto = 0;

		tituloform = "Detalle";
		alto=h-150;
		if(w<600)
		{
			alto=h-50;
		}
		else
		{
			alto = h-50;
		}

		var param="estatus="+estatuspar+"&empresa="+empresapar+"&tipo="+tipo+"&pagina="+pagina+"&nombredetalle="+escape(nombredetalle);
		param+="&zona="+zonapar
// 	  	if(zonapar!=""){param+="&zona="+zonapar}
	  	if(tipo=="hoy")
	  	{
	  		var today = new Date();
	  		var dd = today.getDate();
	  		var mm = today.getMonth()+1; //January is 0!

	  		var yyyy = today.getFullYear();
	  		if(dd<10){
	  		    dd='0'+dd;
	  		} 
	  		if(mm<10){
	  		    mm='0'+mm;
	  		} 
	  		var today = yyyy+'-'+mm+'-'+dd;
	  		fechainipar=today;
	  	}
	  	
	  	if(fechainipar!=""){param+="&fechaini="+fechainipar}
	  	if(fechafinpar!=""){param+="&fechafin="+fechafinpar}
	  	if(usuariopar!=""){param+="&usuario="+usuariopar}
	  	
	  	
	  	
  	var modaldialog = $("#dialog").dialog({
	        autoOpen: false,
	        modal: true,
	        title: tituloform,
	        width: w-30,
	        height: alto,

	        buttons: 
	        [ 
	        	{ id:"regresarform","data-test":"data test", 
	        		text: "Regresar", 
	        		click:    function() {
//	        			alert($('#cancelarform').data('test')); 
// 	        			$( this ).dialog( "close" ); 
// 						alert(pagina);
						if(pagina=="empresa")
						{
// 							alert('hola1');
							abrirResumenTotalRangoEmpresa(empresapar, zonapar, fechainipar, fechafinpar, tipo, estatusgeneral);
						}
						else if(pagina=="zona")
						{
// 							alert('hola2');
							abrirResumenTotalZona(zonapar, fechainipar, fechafinpar, tipo, estatusgeneral);
						}
	        			},
	        		class: "btn btn-defaulf"
	        	},
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

  	  $("#dialog").load("detalleGeneral.jsp?"+param);
  	
  	
      $("#dialog").dialog("open");

  }
  
  function abrirResumenGeneralSucursal(empresapar, zonapar, fechainipar, fechafinpar, tipo, estatuspar,usuariopar,pagina,estatusgeneral,nombredetalle,sucursal)
  {
  	$("#container").mLoading("show");
  	var w = window.innerWidth;
  	var h = window.innerHeight;
  	var tituloform = "";
  	var alto = 0;

		tituloform = "Detalle";
		alto=h-150;
		if(w<600)
		{
			alto=h-50;
		}
		else
		{
			alto = h-50;
		}

		var param="estatus="+estatuspar+"&empresa="+empresapar+"&tipo="+tipo+"&pagina="+pagina+"&nombredetalle="+escape(nombredetalle)+"&sucursal="+escape(sucursal);
		param+="&zona="+zonapar
// 	  	if(zonapar!=""){param+="&zona="+zonapar}
	  	if(tipo=="hoy")
	  	{
	  		var today = new Date();
	  		var dd = today.getDate();
	  		var mm = today.getMonth()+1; //January is 0!

	  		var yyyy = today.getFullYear();
	  		if(dd<10){
	  		    dd='0'+dd;
	  		} 
	  		if(mm<10){
	  		    mm='0'+mm;
	  		} 
	  		var today = yyyy+'-'+mm+'-'+dd;
	  		fechainipar=today;
	  	}
	  	
	  	if(fechainipar!=""){param+="&fechaini="+fechainipar}
	  	if(fechafinpar!=""){param+="&fechafin="+fechafinpar}
	  	if(usuariopar!=""){param+="&usuario="+usuariopar}
	  	
	  	
	  	
  	var modaldialog = $("#dialog").dialog({
	        autoOpen: false,
	        modal: true,
	        title: tituloform,
	        width: w-30,
	        height: alto,

	        buttons: 
	        [ 
	        	
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

  	  $("#dialog").load("detalleGeneral.jsp?"+param);
  	
  	
      $("#dialog").dialog("open");

  }
  
  function limpiarFiltros()
  {
// 	  var parzona = $("#fzonas").val('').change();
	  var parfechaini = $("#fechainicio").find("input").val("");
	  var parfechafin = $("#fechafin").find("input").val("");
	  
	  consultaSemaforos();
  }
  
  

          	
</script></section>