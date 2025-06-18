<%@page import="java.awt.List"%>
<%@ page import="bean.ConsultaEstadoReporte"%>
<%@ page import="bean.DatosExpTec"%>
<%@ page import="clases.EstadoReporte"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONArray"%>
<%
	
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String idunicoincrementable = request.getParameter("idunicoincrementable") != null ? request.getParameter("idunicoincrementable"): "";
	String tipoArchivo = request.getParameter("tipoArchivo") != null ? request.getParameter("tipoArchivo"): "";
	String estatusProceso = request.getParameter("estatusProceso") != null ? request.getParameter("estatusProceso"): "";
	String usuarioRegistro = request.getParameter("usuarioRegistro") != null ? request.getParameter("usuarioRegistro"): "";
	String nombreArchivo = request.getParameter("nombreArchivo") != null ? request.getParameter("nombreArchivo"): "";
	String fechaRegistroRango1 = request.getParameter("fechaRegistroRango1") != null ? request.getParameter("fechaRegistroRango1"): "";
	String fechaRegistroRango2 = request.getParameter("fechaRegistroRango2") != null ? request.getParameter("fechaRegistroRango2"): "";
	String fechaFinProcesoRango1 = request.getParameter("fechaFinProcesoRango1") != null ? request.getParameter("fechaFinProcesoRango1"): "";
	String fechaFinProcesoRango2 = request.getParameter("fechaFinProcesoRango2") != null ? request.getParameter("fechaFinProcesoRango2"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
	//String tipoOrden = request.getParameter("tipoOrden") != null ? request.getParameter("tipoOrden"): "";
	ConsultaEstadoReporte consulta= new ConsultaEstadoReporte();
	DatosExpTec datostecnico = new DatosExpTec();
	//ArrayList<String[]> DivisionLista = consulta.obtieneDivisiones(lbr); 
	//ArrayList<String[]> AreaLista = consulta.obtieneAreas(lbr); 
	//ArrayList<String[]> CopeLista = consulta.obtieneCopes(lbr); 
	//ArrayList<String[]> conEstatus = consulta.obtieneConfEstatus(lbr);
	 ArrayList<EstadoReporte> lista = consulta.obtieneTareas(empresa,idunicoincrementable,tipoArchivo,estatusProceso,usuarioRegistro,nombreArchivo,fechaRegistroRango1,fechaRegistroRango2,
			 fechaFinProcesoRango1,fechaFinProcesoRango2,lbr);
	/* ArrayList<Tarea> lista = null; */
	JSONArray tecnicosLista = datostecnico.consultaDatosExpTec(lbr);

%>
<div id="provisionarAccion"></div>
	<script>
	$(function () {
        $('#fechaRegistroRango1').datetimepicker({
        	format: 'DD/MM/YYYY',
        	locale: 'es'
        });
        $('#fechaRegistroRango2').datetimepicker({
        	format: 'DD/MM/YYYY',
        	locale: 'es',
            useCurrent: false //Important! See issue #1075
        });
        $("#fechaRegistroRango1").on("dp.change", function (e) {
            $('#fechaRegistroRango2').data("DateTimePicker").minDate(e.date);
        });
        $("#fechaRegistroRango2").on("dp.change", function (e) {
            $('#fechaRegistroRango1').data("DateTimePicker").maxDate(e.date);
        });
    });
	
	$(function () {
        $('#fechaFinProcesoRango1').datetimepicker({
        	format: 'DD/MM/YYYY',
            locale: 'es'
        });
        $('#fechaFinProcesoRango2').datetimepicker({
        	format: 'DD/MM/YYYY',
            locale: 'es',
            useCurrent: false //Important! See issue #1075
        });
        $("#fechaFinProcesoRango1").on("dp.change", function (e) {
            $('#fechaFinProcesoRango2').data("DateTimePicker").minDate(e.date);
        });
        $("#fechaFinProcesoRango2").on("dp.change", function (e) {
            $('#fechaFinProcesoRango1').data("DateTimePicker").maxDate(e.date);
        });
    });
	  </script>
<section class="wrapper">
<div class="row mt" style="margin:5px;">
<div class="col-md-12"><h4> Inicio <i class="fa fa-angle-right"></i> Estatus Reportes </h4></div>
</div>

<div class="box collapsed-box">	
<div class="box-header with-border">
          <h3 class="box-title">Filtros</h3>
          <div class="box-tools pull-right">
            <button class="btn btn-box-tool" type="button" data-widget="collapse" data-toggle="collapse" title="Mostrar/Ocultar filtros" data-target="#collapseFiltros" aria-expanded="true" aria-controls="collapseFiltros" data-original-title="Collapse">
				  <i class="fa fa-minus"></i>
			</button>
          </div>
</div>	
</div>

<div class="collapse in" id="collapseFiltros">
	<div class="col-md-12" style="background-color: #77a2ce;padding-bottom: 12px;padding-top: 10px;">
	
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		ID de Reporte:
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="idunicoincrementable" class="form-control" placeholder="">
		</div>
		</div>
		</div>
	
	
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Empresa:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select  id="empresa" class="form-control input-sm" >
				<option value="">Seleccionar...</option>
				<option value="06">TELMEX</option>

			</select>
		</div>
		</div>	
		</div>
		
		
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Tipo Archivo:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select  id="tipoArchivo" class="form-control input-sm" >
				<option value="">Seleccionar...</option>
				<option value="LIQUIDADA">LIQUIDADA</option>

			</select>
		</div>
		</div>	
		</div>
		
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Estatus Proceso:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select  id="estatusProceso" class="form-control input-sm" >
				<option value="">Seleccionar...</option>
				<option value="PENDIENTE">PENDIENTE</option>
				<option value="PROCESO">PROCESO</option>
				<option value="TERMINO">TERMINO</option>
			</select>
		</div>
		</div>	
		</div>
		
	
		
		
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Usuario Registro:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="usuarioRegistro" class="form-control" placeholder="">
		</div>
		</div>
		</div>


		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Nombre Archivo:
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="nombreArchivo" class="form-control" maxlength="10" placeholder="">
		</div>
		</div>
		</div>
		
		
		<!-- <div class="col-sm-12 col-md-8 col-lg-4">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-2" style="color:#FFFFFF;">
		Fecha Registro:
		</div>
		<div class="col-xs-9 col-sm-10">
			<div class="row">
			<div class="col-xs-6">
				<input type="date" id="fechaRegistroRango1" style="width:100%;" class="form-control" placeholder="Mínimo"/>
			</div>
			<div class="col-xs-6">
				<input type="date" id="fechaRegistroRango2" style="width:100%;" class="form-control" placeholder="Máximo"/>
			</div>
			</div>
		</div>
		</div>
		</div> -->
		
		<!-- Fechas para filtros -->
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Fecha Registro:
		</div>
		<div class="col-xs-9 col-sm-8">
			<div class="form-group">
            <div class='input-group date' id='fechaRegistroRango1'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		
		</div>
		<div class="col-xs-9 col-sm-8">
		 <div class="form-group">
            <div class='input-group date' id='fechaRegistroRango2'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
		
		
			<!-- <div class="col-sm-12 col-md-8 col-lg-4">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-2" style="color:#FFFFFF;">
		Fecha fin Proceso:
		</div>
		<div class="col-xs-9 col-sm-10">
			<div class="row">
			<div class="col-xs-6">
				<input type="date" id="fechaFinProcesoRango1" style="width:100%;" class="form-control" placeholder="Mínimo"/>
			</div>
			<div class="col-xs-6">
				<input type="date" id="fechaFinProcesoRango2" style="width:100%;" class="form-control" placeholder="Máximo"/>
			</div>
			</div>
		</div>
		</div>
		</div> -->
		
		<!-- Fechas para filtros -->
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Fecha fin Proceso:
		</div>
		<div class="col-xs-9 col-sm-8">
			<div class="form-group">
            <div class='input-group date' id='fechaFinProcesoRango1'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		
		</div>
		<div class="col-xs-9 col-sm-8">
		 <div class="form-group">
            <div class='input-group date' id='fechaFinProcesoRango2'>
                <input type='text' class="form-control input-sm"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
		</div>
		</div>
		</div>
		
		<div class="col-md-4 col-lg-2 col-lg-offset-0 col-md-offset-0 col-sm-offset-2 " align="right">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-6">
		<button class="btn btn-primary" onclick="limpiarFiltros()" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		</div>
		<div class="col-xs-6">
		<button class="btn btn-primary" onclick="cargaTareas()" style="margin 2px;"><span class="fa fa-filter"></span> Consultar</button>
		</div>
		

		</div>
		</div>
		
	</div>
</div>
<!-- <div class="row" style="margin:5px;"> -->
<!-- <div class="col.xs-12"><button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button></div> -->
<!-- </div> -->


<div class="row" style="margin: 5px;">
                  <div class="col-md-12">
                      <div class="accordion">
				<div class = "row mt" style="padding-top:10px;" id="divisionTareas">
				<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px;">
        <thead>
            <tr>
                <th>ID de Reporte</th>
                <th>Empresa</th>
                <th>Tipo Archivo</th>
                <th>Fecha Inicio</th>
                <th>Fecha Fin</th>
                <th>Estatus Proceso</th>
                <th>Usuario Registro</th>
                <th>Fecha Registro</th>
                <th>Fecha Inicio Proceso</th>
                <th>Nombre Archivo</th>
                <th>Fecha Fin Proceso</th>
                <th>Acciones&nbsp;&nbsp;&nbsp;</th>
            </tr>
        </thead>
        <tbody>
        <% 
        	int i;
 			EstadoReporte objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (EstadoReporte)lista.get(i);
					
		%>
            <tr class="clickable-row">
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
                <td><input type="hidden" id="tel<%=objDetalle.getENVARIDUNI()%>" value = "<%=objDetalle.getENVARIDUNI() %>"/><%=objDetalle.getENVARIDUNI() %></td>
                <td width="350"><%=objDetalle.getENVAREMPRE() %></td>
                <td><%=objDetalle.getENVARTIPAR() %></td>
                <td><%=objDetalle.getENVARFECIN() %></td>
                <td><%=objDetalle.getENVARFECFI() %></td>
                <td><%=objDetalle.getENVARESTPR() %></td>
                <td><%=objDetalle.getENVARUSRE() %></td>
                <td><%=objDetalle.getENVARFECR() %></td>
                <td><%=objDetalle.getENVARFECIP() %></td>
                <td><%=objDetalle.getENVARNOMA() %></td>
                <td><%=objDetalle.getENVARFECFP() %></td>
                <td>
				<%
// 				if(objDetalle.getEstado().trim().equals("PENDIENTE")) {
				/*if(obj[0].equals(objDetalle.getEstado().trim()) && !obj[1].equals("DETALLE")){
					int validacionAprov = 0;
					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("APROVISIONAR") && objDetalle.getAprovisionamiento().equals("SI")){
						validacionAprov = 1;
					} else
					if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("PRUEBAS") && (!objDetalle.getAprovisionamiento().equals("SI") || objDetalle.getPruebas().equals("SI"))){
						validacionAprov = 1;
					}
					else if(objDetalle.getEstado().trim().equals("DESPACHADA") && obj[1].equals("LIQUIDAR") && (objDetalle.getAprovisionamiento().equals("NO") || objDetalle.getPruebas().equals("NO")))
					{
						validacionAprov = 1;
					}
					if(validacionAprov==0)
					{*/
				%>
				<!-- <button id="<%=objDetalle.getENVARIDUNI() %>" onclick="abrir<%=objDetalle.getENVARIDUNI()%>('<%=objDetalle.getENVARIDUNI() %>')" title="<%=objDetalle.getENVARIDUNI()%>" class="btn <%=objDetalle.getENVARIDUNI() %> btn-xs"><i class="fa <%=objDetalle.getENVARIDUNI() %>"></i></button>--><% 
				
// 				}
					/*}
				
				}

				}*/%>
				<!-- <button onclick="abrirDetalle(')" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button> -->
				<button onclick="" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button>
				</td>
<%--                 <td><%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%><button id="asig<%=objDetalle.getFolioPisa() %>" onclick="abrirAsignar('<%=objDetalle.getFolioPisa() %>')" title="ASIGNAR" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i></button><%} %> <button onclick="despacharTarea('<%=objDetalle.getFolioPisa() %>')" title="DESPACHAR" class="btn btn-primary btn-xs"><i class="fa fa-plug"></i></button> <button onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE" class="btn btn-success btn-xs"><i class="fa fa-search-plus"></i></button></td> --%>
            </tr>
            <%} %>
		  
           
        </tbody>
    </table>
				
				</div>
				</div>
				
				
				
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
              </section>
 <script>
 
 var checkedRows = [];
 var storeTecnicos = JSON.parse('<%=tecnicosLista%>');
 
	$(function(){
// 		$("#selectTecnico").igCombo({
// 	            width: "100%",
// 	            textKey: "descripcion",
// 	            valueKey: "value",
// 	            dataSource: storeTecnicos,
// 	            filteringType: "local",
// 	            filteringCondition: "contains",
// 	            highlightMatchesMode: "contains",
// 	            placeHolder: "Buscar técnico...",
// 	            dropDownOrientation: "bottom"
// // 	         	selectionChanged: storeTecnicos
// 	        });
		$("#selectTecnico").select2({
			data:storeTecnicos,
			placeholder: "Seleccione Técnico"
		});
		
	});
 
 	function seleccionaConTD(idcheck, condicion)
 	{
 		if(condicion){
 		$("#"+idcheck).click();
 		activaSeleccion(idcheck);
 		}
 	}
 	function cargaTareas()
 	{
 		var paridunicoincrementable = $("#idunicoincrementable").val();
 		var parempresa = $("#empresa option:selected").val();
 		var partipoArchivo = $("#tipoArchivo option:selected").val();
 		var parestatusProceso = $("#estatusProceso option:selected").val();
 		var parusuarioRegistro = $("#usuarioRegistro").val();
 		var parnombreArchivo = $("#nombreArchivo").val();
 		var parfechaRegistroRango1 = $("#fechaRegistroRango1").find("input").val();
 		var parfechaRegistroRango2 = $("#fechaRegistroRango2").find("input").val();
 		var parfechaFinProcesoRango1 = $("#fechaFinProcesoRango1").find("input").val();
 		var parfechaFinProcesoRango2 = $("#fechaFinProcesoRango2").find("input").val();
 		
 		var parametros = "lbr="+'<%=lbr%>';
 		
 		if(paridunicoincrementable!=""){parametros+="&idunicoincrementable="+paridunicoincrementable;}
 		if(parempresa!=""){parametros+="&empresa="+parempresa;}
 		if(partipoArchivo!=""){parametros+="&tipoArchivo="+partipoArchivo;}
 		if(parestatusProceso!=""){parametros+="&estatusProceso="+parestatusProceso;}
 		if(parusuarioRegistro!=""){parametros+="&usuarioRegistro="+parusuarioRegistro;}
 		if(parnombreArchivo!=""){parametros+="&nombreArchivo="+parnombreArchivo;}
 		if(parfechaRegistroRango1!=""){parametros+="&fechaRegistroRango1="+parfechaRegistroRango1;}
 		if(parfechaRegistroRango2!=""){parametros+="&fechaRegistroRango2="+parfechaRegistroRango2;}
 		if(parfechaFinProcesoRango1!=""){parametros+="&fechaFinProcesoRango1="+parfechaFinProcesoRango1;}
 		if(parfechaFinProcesoRango2!=""){parametros+="&fechaFinProcesoRango2="+parfechaFinProcesoRango2;}
 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
 		$.ajax({
			url: 'resumenEstatusReportes.jsp?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				 $("#divisionTareas").html(resp);
				 $("#btnAsigMasiva").css("display",'none');
			}
	  });
 	}
 	var tablaTareas;
 	$(function(){
 		tablaTareas= $('#tablaTareas').DataTable({
 			 "scrollX": true,
//  			 paging:false,
 			 seacrching: false
//  			 "sScrollY": 520,
//  			 "scrollCollapse": true
 		 });
 		var alturaactual = $("div .dataTables_scrollBody").css("height");
 		var newheight = parseInt(alturaactual.split("px")[0])+70;
 		$("div .dataTables_scrollBody").css("height",newheight);
 		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});
 	
 	
 	dialog = $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        modal: true,
        buttons: {
          "Aceptar": function() {dialog.dialog( "close" );},
          "Cancelar": function() {
            dialog.dialog( "close" );
          }
        }
      });
 	
 	dialog = $( "#detalleTarea" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        modal: true,
        buttons: [{
        	text : "Aceptar",
          	click: function() {dialog.dialog( "close" );},
        	"class" : "btn btn-primary"
        }]
      });
    function abrirAsignarMasivo()
    {
    	var folios = "";
    	$.each(checkedRows, function(key, value) {
    		if(key>0)
    		{
    			folios+=",";
    		}
			folios+=value.folio;    
		});
    	abrirASIGNAR(folios);
		  
    }
    function abrirREASIGNAR(folioplex)
    {
    	abrirASIGNAR(folioplex);
    }
    function abrirASIGNAR(folioplex)
    {
//     	$("#selectTecnico option[value='']").prop('selected',true);
// 		$("#selectTecnico").select2("val","");
//     	$("#foliopisaasigna").val(folioplex);
//     	dialog = $( "#dialog-form" ).dialog({
//             autoOpen: false,
//             height: 400,
//             width: 350,
//             modal: true,
//             title: "Asignación de Tarea",
//             buttons: [{
//               text : "Aceptar",
//               "class": "btn btn-primary",
//               click: function() {
//             	  var expediente=$("#selectTecnico").find("option:selected").val();
//             	  var nombre=$("#selectTecnico").find("option:selected").text();
<%--             	  parametros="tipo=ASIGNADA&estado=ASIGNADA&foliopisa="+folioplex+"&expediente="+expediente+"&nombre="+escape(nombre)+"&lbr="+'<%=lbr%>'; --%>
//             	  if(expediente!="")
//             	  {
//             	    	swal({
//             	    		title: "",  
//             	    		text: "Desea asignar la order "+folioplex+" al tecnico "+nombre+"?",   
// //                 			text: "You will not be able to recover this imaginary file!",   
//                 			type: "info",   
//                 			showCancelButton: true,   
//                 			cancelButtonText: "Cancelar",
//                 			confirmButtonColor: "#3a5a74",   
//                 			confirmButtonText: "Aceptar",   
//                 			closeOnConfirm: true }, 
//                 			function(){
//                         				$.ajax({
//                                   			url: 'actualizaEstado.jsp?'+parametros,
//                                   			type: "GET",
//                                   			cache: false,
                                  			
//                                   			success: function( resp ) {
//                                   				if(resp.trim()=="OK")
//                                   				{
//                                   					dialog.dialog( "close" );
//                                   					var pardivision = $("#division option:selected").val();
//                                   			 		var pararea = $("#area option:selected").val();
//                                   			 		var parcope = $("#cope option:selected").val();
<%--                                   			 		var partecnologia = '<%=tecnologia%>'; --%>
//                                   			 		var parestatus = $("#estatus option:selected").val();
//                                   			 		var parfechaini = $("#rango1").val();
//                                   			 		var parfechafin = $("#rango2").val();
//                                   			 		var parfoliopisaplex = $("#foliopisaplex").val();
//                                   			 		var parfoliopisa = $("#foliopisa").val();
//                                   			 		var partecnico = $("#tecnico").val();
                                  			 		
<%--                                   			 		var parametros = "lbr="+'<%=lbr%>'; --%>
//                                   			 		if(pardivision!=""){parametros+="&division="+pardivision;}
//                                   			 		if(pararea!=""){parametros+="&area="+pararea;}
//                                   			 		if(parcope!=""){parametros+="&cope="+parcope;}
//                                   			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
//                                   			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
//                                   			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
//                                   			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
//                                   			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
//                                   			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
//                                   			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
//                                   			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
//                                   			 		$.ajax({
//                                   						url: 'resumenTareas.jsp?'+parametros,
//                                   						type: "GET",
//                                   						cache: false,
                                  						
//                                   						success: function( resp ) {
//                                   							 $("#divisionTareas").html(resp);
//                                   							$("#btnAsigMasiva").css("display",'none');
                                  							
//                                   						}
//                                   				  });
//                                   				}
//                                   				else
//                                   				{
//                                   					swal("Error al ASIGNAR tarea", "", "error");
// //                                   					alert("Error al ASIGNAR tarea");
//                                   				}
//                                   			}});
                        	
//                 			});
                			
				  
//             	  }
//             	  else
//             		  {
//             		  swal("Debe seleccionar un técnico", "", "warning");
// //             		  	alert("Debe seleccionar un técnico");
//             		  }
            	  
//             	  }
//             },{
//             	text:"Cancelar",
//             	"class": "btn btn-primary",
//               click: function() {
//                 dialog.dialog( "close" );
//               }
//             }]
//           });
//     	if ($.ui && $.ui.dialog && $.ui.dialog.prototype._allowInteraction) {
//     	    var ui_dialog_interaction = $.ui.dialog.prototype._allowInteraction;
//     	    $.ui.dialog.prototype._allowInteraction = function(e) {
//     	        if ($(e.target).closest('.select2-dropdown').length) return true;
//     	        return ui_dialog_interaction.apply(this, arguments);
//     	    };
//     	}
	var newpage;
<%-- 	$.post('asignacionTarea.jsp',{lbr:'<%=lbr%>', folioplex: folioplex}, function(result){ --%>
// 		newpage = result;
// 		window.open("popup.jsp","Asignación de Tareas","width = 500, height = 500, resizable=no");
// 	});
	
<%--     $.post('asignacionTarea.jsp',{lbr:'<%=lbr%>', folioplex: folioplex}, function(result) { --%>
//         var wA = window.open('asignacionTarea.jsp', "Asignación de Tareas", "width = 500, height = 500");
//         wA.document.write(result);
//         wA.document.close();
//         wA.onbeforeunload= function(){cargaTareas();}
//     });
	var popupAsignacion = window.open("asignacionTarea.jsp?lbr=" + '<%=lbr%>' + 
    			"&folioplex=" + folioplex, folioplex, "width = 500, height = 500");
// 	popupAsignacion.onbeforeunload= function(){cargaTareas();}
//     	dialog.dialog( "open" );
    }
    
    
    function abrirDESPACHAR(foliopisa)
    {
    	swal({
    		title: "",
    		text: "¿Desea despachar la orden: "+foliopisa+"?", 
//     			text: "You will not be able to recover this imaginary file!",   
    			type: "info", 
    			showCancelButton: true, 
    			cancelButtonText: "Cancelar",
    			confirmButtonColor: "#3a5a74",
    			confirmButtonText: "Aceptar", 
    			closeOnConfirm: true }, 
    			function(){
    				var parametros="estado=DESPACHADA&tipo=DESPACHADA&foliopisa="+foliopisa+"&lbr=<%=lbr%>";
    		    	$.ajax({
    		  			url: 'actualizaEstado.jsp?'+parametros,
    		  			type: "GET",
    		  			cache: false,
    		  			
    		  			success: function( resp ) {
    		  				if(resp.trim()=="OK")
    		  				{
    		  					var pardivision = $("#division option:selected").val();
    	      			 		var pararea = $("#area option:selected").val();
    	      			 		var parcope = $("#cope option:selected").val();
    	      			 		var parestatus = $("#estatus option:selected").val();
    	      			 		var parfechaini = $("#rango1").val();
    	      			 		var parfechafin = $("#rango2").val();
    	      			 		var parfoliopisaplex = $("#foliopisaplex").val();
    	      			 		var parfoliopisa = $("#foliopisa").val();
    	      			 		var partecnico = $("#tecnico").val();
    	      			 		
    	      			 		var parametros = "lbr="+'<%=lbr%>';
    	      			 		if(pardivision!=""){parametros+="&division="+pardivision;}
    	      			 		if(pararea!=""){parametros+="&area="+pararea;}
    	      			 		if(parcope!=""){parametros+="&cope="+parcope;}
    	      			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
    	      			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
    	      			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
    	      			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
    	      			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
    	      			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
    	      			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
    	      			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
    	      			 		$.ajax({
    	      						url: 'resumenTareas.jsp?'+parametros,
    	      						type: "GET",
    	      						cache: false,
    	      						
    	      						success: function( resp ) {
    	      							 $("#divisionTareas").html(resp);
   	       								$("#btnAsigMasiva").css("display",'none');
    	      							dialog.dialog( "close" );
    	      						}
    	      				  });
    		  					
    		  					
    		  				}
    		  				else
    		  				{
    		  					swal("Error al despachar orden", "", "error");
//     		  					alert("Error al despachar orden");
    		  				}
    		  			}
    		    	});
    				 });
    	

    }
    
    
    function limpiarFiltros()
    {
    	$("#idunicoincrementable").val("");
    	$("#empresa").val("");
 		$("#tipoArchivo").val("");
 		$("#estatusProceso").val("");
 		$("#usuarioRegistro").val("");
 		$("#nombreArchivo").val("");
 		$("#fechaRegistroRango1").find("input").val("");
 		$("#fechaRegistroRango2").find("input").val("");
 		$("#fechaFinProcesoRango1").find("input").val("");
 		$("#fechaFinProcesoRango2").find("input").val("");
 		cargaTareas();
    }
    dialogDetalle = $( "#detalleTareas" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        title: "Detalle",
        modal: true,
        buttons: [{
          text : "Aceptar",
          "class": "btn btn-primary",
          click: function() {
        	  dialog.dialog( "close" );
          }}]
        });
    
    dialogDetalleMovil = $( "#detalleTareasMovil" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        title: "Detalle",
        modal: true,
        buttons: [{
          text : "Aceptar",
          "class": "btn btn-primary",
          click: function() {
        	  dialog.dialog( "close" );
          }}]
        });
    
    dialogAprov = $( "#provisionarAccion" ).dialog({
        autoOpen: false,
        height: 400,
        width: 350,
        title: "Liquidación",
        modal: true
        });
    
	dialogPruebas = $( "#pruebasDialog" ).dialog({
	        autoOpen: false,
	        height: 400,
	        width: 350,
	        title: "",
	        modal: true,
	        buttons: [{
	            text : "Verificar Servicio",
	            "class": "btn btn-primary",
	            click: function() {
	          	  
	            }},
	            {
		            text : "Cancelar",
		            "class": "btn btn-primary",
		            click: function() {
		            	dialogLiquidacion.dialog( "close" );
		            }}
	            ]
	        });
    function abrirDetalle(division,area,cope,empresa,folioplex,foliopisa,telefono,tecnologia,expedienteplex,distrito,tipotarea,estado,dilacion,telefonocontacto,telefonocelular,fechacontrpda,fechacita,fechapendiente,expediente,tecnico,aprovisionamiento,fechaaprovisionamiento,fechaasignada,fechadespachada,fechaliquidada,facilidades,tipo,valorasignado)
    {
//     	$("#tabDetalle").click();
//     	$("#detalleDivision").html(division);
//     	$("#detalleArea").html(area);
//     	$("#detalleCope").html(cope);
//     	$("#detalleEmpresa").html(empresa);
//     	$("#detalleFolioPlex").html(folioplex);
//     	$("#detalleFolioPisa").html(foliopisa);
//     	$("#detalleTelefono").html(telefono);
//     	$("#detalleTecnologia").html(tecnologia);
//     	$("#detalleExpedientePlex").html(expedienteplex);
//     	$("#detalleDistrito").html(distrito);
//     	$("#detalleTipoTarea").html(tipotarea);
//     	$("#detalleEstado").html(estado);
//     	$("#detalleDilacion").html(dilacion);
//     	$("#detalleTelefonoContacto").html(telefonocontacto);
//     	$("#detalleTelefonoCelular").html(telefonocelular);
//     	$("#detalleFechaContRpda").html(fechacontrpda);
//     	$("#detalleFechaCita").html(fechacita);
//     	$("#detalleFechaPendiente").html(fechapendiente);
//     	$("#detalleExpediente").html(expediente);
//     	$("#detalleTecnico").html(tecnico);
//     	$("#detalleAprovisionamiento").html(aprovisionamiento);
//     	$("#detalleFechaAprovisionamiento").html(fechaaprovisionamiento);
//     	$("#detalleFechaAsignada").html(fechaasignada);
//     	$("#detalleFechaDespachada").html(fechadespachada);
//     	$("#detalleFechaLiquidada").html(fechaliquidada);
//     	$("#detalleFacilidades").html(facilidades);
//     	$("#detalleTipo").html(tipo);
//     	$("#detalleValorAsignado").html(valorasignado);
    	
//     	//VALORESMOVIL
//     	$("#detalleDivisionM").html(division);
//     	$("#detalleAreaM").html(area);
//     	$("#detalleCopeM").html(cope);
//     	$("#detalleEmpresaM").html(empresa);
//     	$("#detalleFolioPlexM").html(folioplex);
//     	$("#detalleFolioPisaM").html(foliopisa);
//     	$("#detalleTelefonoM").html(telefono);
//     	$("#detalleTecnologiaM").html(tecnologia);
//     	$("#detalleExpedientePlexM").html(expedienteplex);
//     	$("#detalleDistritoM").html(distrito);
//     	$("#detalleTipoTareaM").html(tipotarea);
//     	$("#detalleEstadoM").html(estado);
//     	$("#detalleDilacionM").html(dilacion);
//     	$("#detalleTelefonoContactoM").html(telefonocontacto);
//     	$("#detalleTelefonoCelularM").html(telefonocelular);
//     	$("#detalleFechaContRpdaM").html(fechacontrpda);
//     	$("#detalleFechaCitaM").html(fechacita);
//     	$("#detalleFechaPendienteM").html(fechapendiente);
//     	$("#detalleExpedienteM").html(expediente);
//     	$("#detalleTecnicoM").html(tecnico);
//     	$("#detalleAprovisionamientoM").html(aprovisionamiento);
//     	$("#detalleFechaAprovisionamientoM").html(fechaaprovisionamiento);
//     	$("#detalleFechaAsignadaM").html(fechaasignada);
//     	$("#detalleFechaDespachadaM").html(fechadespachada);
//     	$("#detalleFechaLiquidadaM").html(fechaliquidada);
//     	$("#detalleFacilidadesM").html(facilidades);
//     	$("#detalleTipoM").html(tipo);
//     	$("#detalleValorAsignadoM").html(valorasignado);
//     	dialogDetalleMovil = $( "#detalleTareasMovil" ).dialog({
//             autoOpen: false,
//             height: 450,
//             width: 350,
//             title: "Folio Plex: "+folioplex+" Folio Pisa: "+foliopisa+" Teléfono: "+telefono,
//             modal: true,
//             open: function(){
//             	$(this).scrollTop(0);
//             },
//             buttons: [{
//               text : "Aceptar",
//               "class": "btn btn-primary",
//               click: function() {
//             	  dialogDetalleMovil.dialog( "close" );
//               }}]
//             });
//     	dialogDetalle = $( "#detalleTareas" ).dialog({
//             autoOpen: false,
//             height: 530,
//             width: 1218,
//             title: "Folio Plex: "+folioplex+"       Folio Pisa: "+foliopisa+"        Teléfono: "+telefono,
//             modal: true,
//             open: function(){
//             	$(this).scrollTop(0);
//             },
//             buttons: [{
//               text : "Aceptar",
//               "class": "btn btn-primary",
//               click: function() {
//             	  dialogDetalle.dialog( "close" );
            	  
//               }}]
//             });
//     	if($(window).width()<1200)
//     	{
//     		dialogDetalleMovil.parent().find("span.ui-dialog-title").html("Folio Plex: <label style'font-weight: normal;'>"+folioplex+"</label>   &nbsp;&nbsp;&nbsp;    Folio Pisa: <label style'font-weight: normal;'>"+foliopisa+"</label>    &nbsp;&nbsp;&nbsp;     Teléfono: <label style'font-weight: normal;'>"+telefono+"</label>");
//     		dialogDetalleMovil.dialog( "open" );
//     	}
//     	else
//     	{
//     		dialogDetalle.parent().find("span.ui-dialog-title").html("Folio Plex: <label style'font-weight: normal;'>"+folioplex+"</label>   &nbsp;&nbsp;&nbsp;    Folio Pisa: <label style'font-weight: normal;'>"+foliopisa+"</label>    &nbsp;&nbsp;&nbsp;     Teléfono: <label style'font-weight: normal;'>"+telefono+"</label>");
//     		dialogDetalle.dialog( "open" );
//     	}

    	var popupDetalle = window.open("popupDetalle.jsp?division=" + division + 
    			"&area=" +area + "&cope=" +cope + "&empresa=" +empresa +
    			"&folioplex=" +folioplex + "&foliopisa=" +foliopisa +
    			"&telefono=" +telefono + "&tecnologia=" + tecnologia +
    			"&expedienteplex=" +expedienteplex + "&distrito=" +distrito +
    			"&tipotarea=" +tipotarea + "&estado=" +estado +
    			"&dilacion=" +dilacion + "&telefonocontacto=" +telefonocontacto +
    			"&telefonocelular=" + telefonocelular + "&fechacontrpda=" +fechacontrpda + 
    			"&fechacita=" +fechacita + "&fechapendiente=" +fechapendiente +
    			"&expediente=" +expediente + "&tecnico=" +tecnico + 
    			"&aprovisionamiento=" + aprovisionamiento + 
    			"&fechaaprovisionamiento=" + fechaaprovisionamiento + "&fechaasignada=" +fechaasignada +
    			"&fechadespachada=" +fechadespachada + "&fechaliquidada=" + fechaliquidada +
    			"&facilidades=" +facilidades + "&tipo=" + tipo + 
    			"&valorasignado=" +valorasignado
    			, foliopisa, "width = 1500, height = 700");
    	
    }
    
    function abrirAPROVISIONAR(foliopisa)
    {
    	var telefono = $("#tel"+foliopisa).val();
//     	alert(telefono);
//     	dialogAprov = $( "#provisionarAccion" ).dialog({
//             autoOpen: false,
//             height: 600,
//             width: 430,
//             title: "Activación FIBRA a la casa",
//             modal: true,
//             buttons: [{
//             	id: "aprovAprovisionar",
//                 text : "Aprovisionar",
//                 "class": "btn btn-primary",
//                 click: function() {
//                 	llamarAprovisionar();
//                 }},
//                 {
//                 	id: "aprovConsEstatus",
//                     text : "Consultar Estatus",
//                     "class": "btn btn-primary",
//                     click: function() {
                  	 
//                     }},
//                 {
//                   id: "aprovCerrar",
//                   text : "Cerrar",
//                   "class": "btn btn-primary",
//                   click: function() {
//                   	dialogAprov.dialog( "close" );
//                   }},
                  
//                   {
//                     id: "aprovAceptar",
//                     text : "Aceptar",
//                     "class": "btn btn-primary",
//                     click: function() {
                    	
//                     	//actualiza campo aprovisionamiento
<%--                    	var parametros = "folio="+foliopisa+"&telefono="+telefono+"&lbr=<%=lbr%>"; --%>
//     		    	$.ajax({
//     		  			url: '../Aprovisionar?'+parametros,
//     		  			type: "GET",
//     		  			cache: false,
    		  			
//     		  			success: function( resp ) {
//     		  				datosjson = $.parseJSON(resp);
//     		  				if(datosjson.res.trim()=="OK")
//     		  				{

//     		  					var pardivision = $("#division option:selected").val();
//     	      			 		var pararea = $("#area option:selected").val();
//     	      			 		var parcope = $("#cope option:selected").val();
<%--     	      			 		var partecnologia = '<%=tecnologia%>'; --%>
//     	      			 		var parestatus = $("#estatus option:selected").val();
//     	      			 		var parfechaini = $("#rango1").val();
//     	      			 		var parfechafin = $("#rango2").val();
//     	      			 		var parfoliopisaplex = $("#foliopisaplex").val();
//     	      			 		var parfoliopisa = $("#foliopisa").val();
//     	      			 		var partecnico = $("#tecnico").val();
    	      			 		
<%--     	      			 		var parametros = "lbr="+'<%=lbr%>'; --%>
//     	      			 		if(pardivision!=""){parametros+="&division="+pardivision;}
//     	      			 		if(pararea!=""){parametros+="&area="+pararea;}
//     	      			 		if(parcope!=""){parametros+="&cope="+parcope;}
//     	      			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
//     	      			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
//     	      			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
//     	      			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
//     	      			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
//     	      			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
//     	      			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
//     	      			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
//     	      			 		$.ajax({
//     	      						url: 'resumenTareas.jsp?'+parametros,
//     	      						type: "GET",
//     	      						cache: false,
    	      						
//     	      						success: function( resp ) {
//     	      							 $("#divisionTareas").html(resp);
//    	       								$("#btnAsigMasiva").css("display",'none');
//     	      							dialog.dialog( "close" );
//     	      						}
//     	      				  });
    		  					
    		  					
//     		  				}
//     		  				else
//     		  				{
//     		  					swal("Error al aprovisionar orden", "", "error");
// //     		  					alert("Error al despachar orden");
//     		  				}
//     		  			}
//     		    	});
                    	
//                     	dialogAprov.dialog( "close" );
//                     }}]
//             });
//     	$("#aprovAceptar").css("display","none");
//     	dialogAprov.load("aprovisionamiento.jsp?folio="+foliopisa+"&telefono="+telefono);
//     	dialogAprov.dialog( "open" );
<%-- 		$.post('aprovisionamiento.jsp',{lbr:'<%=lbr%>', folio: foliopisa, telefono: telefono}, function(result) { --%>
// 		    var w = window.open("about:blank", "Asignación de Tareas", "width = 500, height = 750");
// 		    w.document.write(result);
// 		    w.document.close();
// // 		    w.onbeforeunload= function(){cargaTareas();}
// 		});
		
		var popupAprov = window.open("aprovisionamiento.jsp?lbr=" + '<%=lbr%>' + 
    			"&folio=" + foliopisa+"&telefono="+telefono, foliopisa, "width = 500, height = 720");
// 		popupAprov.onbeforeunload= function(){cargaTareas();}
    }
    
    
    function abrirPRUEBAS(foliopisa)
    {
//     	dialogPruebas = $( "#pruebasDialog" ).dialog({
// 	        autoOpen: false,
// 	        height: 400,
// 	        width: 470,
// 	        title: "Pruebas",
// 	        modal: true,
// 	        buttons: [{
// 	            text : "Verificar Servicio",
// 	            "class": "btn btn-primary",
// 	            click: function() {
// 	            	var observaciones = $("#observacionesLiq").val();
// 	            	var tipoobj = $("#tipoObjPruebas option:selected").val();
<%-- 	            	var parametros = "folio="+foliopisa+"&tipoobj="+tipoobj+"&observaciones="+observaciones+"&lbr=<%=lbr%>"; --%>
//     		    	$.ajax({
//     		  			url: '../Pruebas?'+parametros,
//     		  			type: "GET",
//     		  			cache: false,
    		  			
//     		  			success: function( resp ) {
//     		  				datosjson = $.parseJSON(resp);
//     		  				if(datosjson.res.trim()=="OK")
//     		  				{

//     		  					var pardivision = $("#division option:selected").val();
//     	      			 		var pararea = $("#area option:selected").val();
//     	      			 		var parcope = $("#cope option:selected").val();
<%--     	      			 		var partecnologia = '<%=tecnologia%>'; --%>
//     	      			 		var parestatus = $("#estatus option:selected").val();
//     	      			 		var parfechaini = $("#rango1").val();
//     	      			 		var parfechafin = $("#rango2").val();
//     	      			 		var parfoliopisaplex = $("#foliopisaplex").val();
//     	      			 		var parfoliopisa = $("#foliopisa").val();
//     	      			 		var partecnico = $("#tecnico").val();
    	      			 		
<%--     	      			 		var parametros = "lbr="+'<%=lbr%>'; --%>
//     	      			 		if(pardivision!=""){parametros+="&division="+pardivision;}
//     	      			 		if(pararea!=""){parametros+="&area="+pararea;}
//     	      			 		if(parcope!=""){parametros+="&cope="+parcope;}
//     	      			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
//     	      			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
//     	      			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
//     	      			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
//     	      			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
//     	      			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
//     	      			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
//     	      			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
//     	      			 		$.ajax({
//     	      						url: 'resumenTareas.jsp?'+parametros,
//     	      						type: "GET",
//     	      						cache: false,
    	      						
//     	      						success: function( resp ) {
//     	      							 $("#divisionTareas").html(resp);
//    	       								$("#btnAsigMasiva").css("display",'none');
//     	      							dialog.dialog( "close" );
//     	      						}
//     	      				  });
    		  					
    		  					
//     		  				}
//     		  				else
//     		  				{
//     		  					swal("Error al hacer pruebas", "", "error");
// //     		  					alert("Error al despachar orden");
//     		  				}
    		  				
//     		  				dialogPruebas.dialog( "close" );
//     		  			}
//     		    	});
	          	  
// 	            }},
// 	            {
// 		            text : "Cancelar",
// 		            "class": "btn btn-primary",
// 		            click: function() {
		            	
		            	
// 		            	dialogPruebas.dialog( "close" );
// 		            }}
// 	            ]
// 	        });
    	
//     	dialogPruebas.dialog( "open" );
		var popupPruebas = window.open("pruebas.jsp?lbr=" + '<%=lbr%>' + 
				"&folio=" + foliopisa, foliopisa, "width = 500, height = 320");
// 		popupPruebas.onbeforeunload= function(){cargaTareas();}
		
    }
    
    function abrirLIQUIDAR(foliopisa)
    {
    	swal({
    		title: "",
    		text: "¿Desea liquidar la orden: "+foliopisa+"?", 
//     			text: "You will not be able to recover this imaginary file!",   
    			type: "info", 
    			showCancelButton: true,   
    			cancelButtonText: "Cancelar",
    			confirmButtonColor: "#3a5a74",   
    			confirmButtonText: "Liquidar",   
    			closeOnConfirm: true }, 
    			function(){
    				var parametros="estado=COMPLETE&tipo=COMPLETE&foliopisa="+foliopisa+"&lbr=<%=lbr%>";
    		    	$.ajax({
    		  			url: 'actualizaEstado.jsp?'+parametros,
    		  			type: "GET",
    		  			cache: false,
    		  			
    		  			success: function( resp ) {
    		  				if(resp.trim()=="OK")
    		  				{
    		  					var pardivision = $("#division option:selected").val();
    	      			 		var pararea = $("#area option:selected").val();
    	      			 		var parcope = $("#cope option:selected").val();
    	      			 		var parestatus = $("#estatus option:selected").val();
    	      			 		var parfechaini = $("#rango1").val();
    	      			 		var parfechafin = $("#rango2").val();
    	      			 		var parfoliopisaplex = $("#foliopisaplex").val();
    	      			 		var parfoliopisa = $("#foliopisa").val();
    	      			 		var partecnico = $("#tecnico").val();
    	      			 		
    	      			 		var parametros = "lbr="+'<%=lbr%>';
    	      			 		if(pardivision!=""){parametros+="&division="+pardivision;}
    	      			 		if(pararea!=""){parametros+="&area="+pararea;}
    	      			 		if(parcope!=""){parametros+="&cope="+parcope;}
    	      			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
    	      			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
    	      			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
    	      			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
    	      			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
    	      			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
    	      			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
    	      			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
    	      			 		$.ajax({
    	      						url: 'resumenTareas.jsp?'+parametros,
    	      						type: "GET",
    	      						cache: false,
    	      						
    	      						success: function( resp ) {
    	      							 $("#divisionTareas").html(resp);
   	       								$("#btnAsigMasiva").css("display",'none');
    	      							dialog.dialog( "close" );
    	      						}
    	      				  });
    		  					
    		  					
    		  				}
    		  				else
    		  				{
    		  					swal("Error al liquidar orden", "", "error");
//     		  					alert("Error al despachar orden");
    		  				}
    		  			}
    		    	});
    			});

    }
    
    $('#tablaTareas').on('click', '.clickable-row', function(event) {
    	  $(this).addClass('active').siblings().removeClass('active');
    	});
    
    function activaSeleccion(folio)
    {
    	var valor=$("#"+folio).is(":checked");
//     	alert(valor);
    	if(valor)
    	{
    		
    		$("#ASI"+folio).prop("disabled",true);
    		$("#qaAsig"+folio).css("display","none");
    		
    		 checkedRows.push({folio: folio});
    	}
    	else
    	{
    		$("#ASI"+folio).prop("disabled",false);
    		$("#qaAsig"+folio).css("display","block");
    		$.each(checkedRows, function(key, value) {
//     			alert(value.folio);
    		    if (value.folio == folio) {
    		      checkedRows.splice(key,1);
    		      return false;
    		    }
    		  });
    	}
    	activaAsignacionMasiva(checkedRows.length);
    }
    
    function activaAsignacionMasiva(cantchk)
    {
    	var cantidad = $("input:checked").length;
    	var cantidadEscondidos = $("input:hidden:checked").length;
		
// 		e.preventDefault();       

// 		alert(cantchk);

    	if(cantchk>0)
    	{
    		
    		$("#btnAsigMasiva").css("display",'inline-block');
    	}
    	else
    	{
    		$("#btnAsigMasiva").css("display",'none');
    	}
    }
    
    
    
    
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
    $('.nav-tabs a').on('show.bs.tab', function(){
//         alert('The new tab is about to be shown.');
    });
    $('.nav-tabs a').on('shown.bs.tab', function(){
//         alert('The new tab is now fully shown.');
    });
    $('.nav-tabs a').on('hide.bs.tab', function(e){
//         alert('The previous tab is about to be hidden.');
    });
    $('.nav-tabs a').on('hidden.bs.tab', function(){
//         alert('The previous tab is now fully hidden.');
    });
 </script>             