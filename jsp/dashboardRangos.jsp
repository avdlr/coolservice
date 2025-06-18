<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%
ConsultaCatalogo catalogos = new ConsultaCatalogo();
JSONArray zonas = catalogos.consultaZonas();
JSONArray tipomantenimiento = catalogos.consultaTipoTrabajo("");
%>
<section class="wrapper">    
    <meta charset="utf-8">  
     <meta http-equiv="X-UA-Compatible" content="IE=edge">    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
          	<div class="col-xs-12 col-sm-6 col-md-3" style="margin-top:5px;">
          		<div class="row">
          			<div class="col-xs-4">Zona:</div>
          			<div class="col-xs-8">
          				<select class="form-control input-sm" id="fzonas">
          					<option value="">Seleccionar...</option>
							<%
								JSONObject registro = new JSONObject();
								for (int i=0; i<zonas.length(); i++)
								{
									registro = zonas.getJSONObject(i);
									%>
										<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
									<%
								}
							%>
          				</select>
          			</div>
          		</div>
          	</div>
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
                    <input type='text' class="form-control" />
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
                    <input type='text' class="form-control" />
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
          	
	          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="padding-top:5px;" id="trabajostecnico">
<!-- 	          		<strong class="text-primary"> Trabajos de T&eacute;cnicos (HOY)</strong> -->
<!-- 					<div class="blue-box table-responsive" id="agendasAbiertas"><table style="width:100%;" class="tableOciLeft"> <tbody><tr class="trHeaderOci"> <th class="text-left"> Zona </th> <th> Total </th> <th> Liquidados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr> -->
<!-- 					<tr><td align="left">PACIFICO</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Hoy','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mañana','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','2 a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Citas Telmex','Mayor a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NORTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">2</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">0</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 					<tr><td align="left">NOROESTE</td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Hoy','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">5</span></a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mañana','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','2 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">2</a></td></tr> -->
					
<!-- 					<tr class="trFooterOci"> <td class="text-left"> Total  </td><td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Hoy','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning "> 10</span></a> </td> <td> <a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mañana','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3 </a></td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','2 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 3</a> </td> <td><a onclick="cambiarTitulo('DiaVen'),detalle('AGA','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
<!-- 					</tbody></table></div> -->
					
<!-- 				<div class="row text-center footerBlueBox"> -->
<!-- 					<div class="col-xs-12 col-md-12 col-sm-12"> -->
<!-- 						<label id="rcallAGA" class="aWithe"><i class="fa fa-refresh"></i> Actualizar</label> -->
<!-- 					</div> -->
<!-- 				</div> -->
				</div>
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"  style="padding-top:5px;" id="trabajostecnicorango">
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
	          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"  style="padding-top:5px;" id="trabajoempresahoy">
<!-- 		          	<strong class="text-primary"> Trabajos por Empresa (HOY)</strong> -->
<!-- 		          		<div class="blue-box table-responsive" id="agendasVencidas"><table style="width:100%;" class="tableOciLeft" > <tbody> -->
<!-- 		          		<tr class="trHeaderOci"> <th class="text-left"> Empresa </th> <th> Total </th> <th> Liquiados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr> -->
<!-- 		          		<tr><td class="text-left">Carl's Jr</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','1 Día','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','2 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','3 a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','Mayor a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 		          		<tr><td class="text-left">KFC</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
<!-- 		          		<tr><td class="text-left">PIZZA HUT</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
<!-- 		          		<tr><td class="text-left">PESCADERIA</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
		      
<!-- 		          		<tr class="trFooterOci"> <td class="text-left"> Total  </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','1 Día','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> <span class="label label-warning ">12</span></a> </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','2 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">  4 </a></td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','3 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 4</a> </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
<!-- 		          		</table></div> -->
<!-- 					<div class="row text-center footerBlueBox"> -->
<!-- 						<div class="col-xs-12 col-md-12 col-sm-12 "> -->
<!-- 							<label id="rcallAGV" class="aWithe"><i class="fa fa-refresh"></i> Actualizar</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
	          	</div>
	          	
	          	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"  style="padding-top:5px;" id="trabajoempresarango">
<!-- 		          	<strong class="text-primary"> Trabajos por Sucursal (Rango Fechas)</strong> -->
<!-- 		          		<div class="blue-box table-responsive" id="agendasVencidas"><table style="width:100%;" class="tableOciLeft" > <tbody> -->
<!-- 		          		<tr class="trHeaderOci"> <th class="text-left"> Empresa </th> <th> Total </th> <th> Liquiados </th> <th> Abiertos </th> <th> Cumplimiento Cita </th> </tr> -->
<!-- 		          		<tr><td class="text-left">Carl's Jr</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','1 Día','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','2 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','3 a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Citas Telmex','Mayor a 5 Días','ABIERTO','ALTA_SERV')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr> -->
<!-- 		          		<tr><td class="text-left">KFC</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
<!-- 		          		<tr><td class="text-left">PIZZA HUT</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
<!-- 		          		<tr><td class="text-left">PESCADERIA</td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','1 Día','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"><span class="label label-warning ">3</span></a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','2 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','3 a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td><td><a onclick="cambiarTitulo(''),detalle('AGV','Desagregacion','Mayor a 5 Días','ABIERTO','desagregac')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">1</a></td></tr></tbody> -->
		      
<!-- 		          		<tr class="trFooterOci"> <td class="text-left"> Total  </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','1 Día','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> <span class="label label-warning ">12</span></a> </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','2 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">  4 </a></td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','3 a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false"> 4</a> </td> <td><a onclick="cambiarTitulo(''),detalle('AGV','T','Mayor a 5 Días','ABIERTO','T')" href="#" data-toggle="modal" data-target="#detalleAgendas" data-backdrop="static" data-keyboard="false">4</a> </td> </tr> -->
<!-- 		          		</table></div> -->
<!-- 					<div class="row text-center footerBlueBox"> -->
<!-- 						<div class="col-xs-12 col-md-12 col-sm-12 "> -->
<!-- 							<label id="rcallAGV" class="aWithe"><i class="fa fa-refresh"></i> Actualizar</label> -->
<!-- 						</div> -->
<!-- 					</div> -->
	          	</div>

     </div>
     <div id="dialog"></div>
          	
          
                     
          
  <script>
  /*************************************************************************************************************/
  /***********************************Oculta los letreso de division are acope que estan seleccionados**********/
  /*************************************************************************************************************/
  $("").css("display","block");
  /***********************Al terminar de cargar la el documento*************************************************/
  //Detona y calcula el size de la ventana y acomoda los semaforos dependiendo la resolucion de la ventana
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
					$("#fzonas").select2();
					$("#ftipot").select2();
					$("#fechainicio").keypress(function(event) {event.preventDefault();});
					$("#fechafin").keypress(function(event) {event.preventDefault();});
// 					gridStructure($(document).width());

					consultaTrabajosTecnico("","","");
					consultaTrabajoEmpresa("","","");
					consultaTrabajoEmpresaRango("0","","");
					actualizaconsultaTrabajosTecnicoRango("","","");
// 					consultaTecnicos("0","","");
// 					setTimeout(consultaSemaforos, 60000);
					intervalid = setInterval(function(){consultaSemaforos(); }, 60000);
					
				});
  
  function consultaTrabajosTecnico(zona, fechainicio, fechafin)
  {
	  var param="zona="+zona+"&fechaini="+fechainicio+"&fechafin="+fechafin;
	  $("#trabajostecnico").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTrabajosTecnico.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajostecnico").html(resp);
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
	  $("#trabajostecnicorango").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
	  $.ajax({
			url: 'visorTecnicos.jsp?'+param,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				$("#trabajostecnicorango").html(resp);
			}
	  });
  }
  
  function actualizaconsultaTecnicos()
  {
	  var parzona = $("#fzonas").val();
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
	  var parzona = $("#fzonas").val();
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  consultaTrabajoEmpresa(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajoEmpresaRango()
  {
	  var parzona = $("#fzonas").val();
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  if(parzona==""){parzona="0";}
	  consultaTrabajoEmpresaRango(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajosTecnico()
  {
	  var parzona = $("#fzonas").val();
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	  consultaTrabajosTecnico(parzona,parfechaini,parfechafin);
  }
  
  function actualizaconsultaTrabajosTecnicoRango()
  {
	  var parzona = $("#fzonas").val();
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
// 	  if(parzona==""){parzona=0;}
	  
	  consultaTrabajosTecnicoRango(parzona,parfechaini,parfechafin);
  }
  
  function consultaSemaforos()
  {
	  var parzona = $("#fzonas").val();
	  var parfechaini = $("#fechainicio").find("input").val();
	  var parfechafin = $("#fechafin").find("input").val();
	  
	consultaTrabajosTecnico(parzona,parfechaini,parfechafin);
	consultaTrabajoEmpresa(parzona,parfechaini,parfechafin);
// 	consultaTecnicos(parzona,parfechaini,parfechafin);
	consultaTrabajosTecnicoRango(parzona,parfechaini,parfechafin);
	if(parzona==""){parzona="0";}
	consultaTrabajoEmpresaRango(parzona,parfechaini,parfechafin);
	
// 	setTimeout(consultaSemaforos, 60000);
  }
  
  function abrirResumenTotalZona(zonapar, fechainipar, fechafinpar, tipo, estatuspar, nombredetalle)
  {
  	$("#container").mLoading("show");
  	var w = window.innerWidth;
  	var h = window.innerHeight;
  	var tituloform = "";
  	var alto = 0;

  		tituloform = "Resumen por Zona";
  		alto=h-150;
  		if(w<600)
  		{
  			alto=h-50;
  		}
  		else
  		{
  			alto = h-50;
  		}

  	var param="estatus="+estatuspar+"&nombredetalle="+escape(nombredetalle)+"&tipo="+escape(tipo);
  	if(zonapar!=""){param+="&zona="+zonapar}
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
  		fechafinpar="";
  	}
  	
  	if(fechainipar!=""){param+="&fechaini="+fechainipar}
  	if(fechafinpar!=""){param+="&fechafin="+fechafinpar}

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
	
  	 $("#dialog").load("detResumTotalZona.jsp?"+param);
  	
  	
      $("#dialog").dialog("open");

  }
  
  
  function abrirResumenTotalRangoEmpresa(empresapar, zonapar, fechainipar, fechafinpar, tipo, estatuspar,nombredetalle)
  {
  	$("#container").mLoading("show");
  	var w = window.innerWidth;
  	var h = window.innerHeight;
  	var tituloform = "";
  	var alto = 0;

  		tituloform = "Resumen por Empresa";
  		alto=h-150;
  		if(w<600)
  		{
  			alto=h-150;
  		}
  		else
  		{
  			alto = h-50;
  		}

  	var param="estatus="+estatuspar+"&empresa="+empresapar+"&tipo="+tipo+"&nombredetalle="+escape(nombredetalle);
  	if(zonapar!=""){param+="&zona="+zonapar}
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
  		fechafinpar="";
  	}
  	
  	if(fechainipar!=""){param+="&fechaini="+fechainipar}
  	if(fechafinpar!=""){param+="&fechafin="+fechafinpar}

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
	
  	 $("#dialog").load("detResumTotalEmpresa.jsp?"+param);
  	
  	
      $("#dialog").dialog("open");

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
	  	if(zonapar!=""){param+="&zona="+zonapar}
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
  
  function limpiarFiltros()
  {
	  var parzona = $("#fzonas").val('').change();
	  var parfechaini = $("#fechainicio").find("input").val("");
	  var parfechafin = $("#fechafin").find("input").val("");
	  
	  consultaSemaforos();
  }
  
  

          	
</script></section>