<%@page import="java.awt.List"%>
<%@ page import="bean.ConsultaTareas"%>
<%@ page import="clases.Tarea"%>
<%@page import="java.util.ArrayList"%>
<%
	
	String empresa = request.getParameter("empresa") != null ? request.getParameter("empresa"): "";
	String division = request.getParameter("division") != null ? request.getParameter("division"): "";
	String area = request.getParameter("area") != null ? request.getParameter("area"): "";
	String cope = request.getParameter("cope") != null ? request.getParameter("cope"): "";
	String tecnologia = request.getParameter("tecnologia") != null ? request.getParameter("tecnologia"): "";
	String estatus = request.getParameter("estatus") != null ? request.getParameter("estatus"): "";
	String fechaini = request.getParameter("fechaini") != null ? request.getParameter("fechaini"): "";
	String fechafin = request.getParameter("fechafin") != null ? request.getParameter("fechafin"): "";
	String foliopisaplex = request.getParameter("foliopisaplex") != null ? request.getParameter("foliopisaplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String tecnico = request.getParameter("tecnico") != null ? request.getParameter("tecnico"): "";
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	String tipoOrden = request.getParameter("tipoOrden") != null ? request.getParameter("tipoOrden"): "";
	ConsultaTareas consulta= new ConsultaTareas();
	ArrayList<String[]> DivisionLista = consulta.obtieneDivisiones(lbr); 
	ArrayList<String[]> AreaLista = consulta.obtieneAreas(lbr); 
	ArrayList<String[]> CopeLista = consulta.obtieneCopes(lbr); 
	ArrayList<String[]> conEstatus = consulta.obtieneConfEstatus(lbr);
	ArrayList<Tarea> lista = consulta.obtieneImpresiones(empresa,division,area,cope,tecnologia,estatus,fechaini,fechafin,foliopisaplex,foliopisa,tecnico, tipoOrden,lbr);
%>


<section class="wrapper">
<div class="row mt" style="margin:5px;">
<div class="col-md-12"><h4> Inicio <i class="fa fa-angle-right"></i> Impresiones <i class="fa fa-angle-right"></i> Tareas <%=tecnologia %></h4></div>

	<div class="col-md-12" style="background-color: #77a2ce;padding-bottom: 12px;padding-top: 10px;">
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
		Divisi&oacute;n:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="division" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<% 
				int j;
				String[] obj;
				for ( j = 0; j < DivisionLista.size(); j++) {
				
				obj = (String[])DivisionLista.get(j);
				%>
				<option value="<%=obj[0]%>"><%=obj[1]%></option>
				<%}%>
			</select>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Area:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="area" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<% 
				for ( j = 0; j < AreaLista.size(); j++) {
				
				obj = (String[])AreaLista.get(j);
				%>
				<option value="<%=obj[0]%>"><%=obj[1]%></option>
				<%}%>
			</select>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Cope:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="cope" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<% 
				for ( j = 0; j < CopeLista.size(); j++) {
				
				obj = (String[])CopeLista.get(j);
				%>
				<option value="<%=obj[0]%>"><%=obj[1]%></option>
				<%}%>
			</select>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2 ">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Tipo:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="tipoOrden" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<option value="ORDENES">ORDEN</option>
				<option value="GARANTIA">GARANT&Iacute;A</option>
			</select>
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Estatus:
		</div>
		<div class="col-xs-9 col-sm-8">
			<select id="estatus" class="form-control input-sm">
				<option value="">Seleccionar...</option>
				<option value="ASIGNADA">ASIGNADA</option>
				<option value="DESPACHADA">DESPACHADA</option>

			</select>
		</div>
		</div>
		</div>
		
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Folio PisaPlex:
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="foliopisaplex" class="form-control" placeholder="">
		</div>
		</div>
		</div>
		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		Folio Pisa:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="foliopisa" class="form-control" placeholder="">
		</div>
		</div>
		</div>

		<div class="col-sm-6 col-md-4 col-lg-2">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-4" style="color:#FFFFFF;">
		T&eacute;cnico:
		</div>
		<div class="col-xs-9 col-sm-8">
			<input type="text" id="tecnico" class="form-control" placeholder="">
		</div>
		</div>
		</div>
		<div class="col-sm-12 col-md-8 col-lg-4">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-sm-2" style="color:#FFFFFF;">
		Rango Dilaci&oacute;n:
		</div>
		<div class="col-xs-9 col-sm-10">
			<div class="row">
			<div class="col-xs-6">
				<input type="text" id="rango1" style="width:100%;" class="form-control" placeholder="Mínimo"/>
			</div>
			<div class="col-xs-6">
				<input type="text" id="rango2" style="width:100%;" class="form-control" placeholder="Máximo"/>
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



<div class="row" style="margin:5px;">
                  <div class="col-md-12">
                      <div class="accordion">
				<div class = "row mt" style=" padding-top:10px;" id="divisionTareas">
				<table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px;">
        <thead>
            <tr>
		  		<th>Seleccion</th>
                <th>Folio PisaPlex</th>
                <th>Folio Pisa</th>
                <th>Tipo Tarea</th>
                <th>Tipo</th>
<!--                 <th>Tecnolog&iacute;a</th> -->
                <th>Estado</th>
                <th>Tel&eacute;fono</th>
                <th>Empresa</th>
                <th>Distrito</th>
                <th>Cope</th>
                <th>Fecha Cont/Rpda</th>
                <th>Fecha Cita</th>
                <th>Fecha Pendiente</th>
                <th>Dilaci&oacute;n</th>
                <th>Expediente</th>
                
                <th>Fecha Asignada</th>
                <th>Fecha Despachada</th>
                <th>Fecha Liquidaci&oacute;n</th>
                <th>Aprovisionamiento</th>
                <th>Pruebas</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <% 
        	int i;
 			Tarea objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (Tarea)lista.get(i);
					
		%>
            <tr class="clickable-row">
                <td align="center"> <div class="btn-group" data-toggle="buttons" >
                <label class="btn btn-default" style="font-size: 4px; color:#000;">
                	<input type="checkbox" id="<%=objDetalle.getFolioPisa() %>" autocomplete="off" onchange="activaSeleccion(this.id)" />
                	<span class="glyphicon glyphicon-ok"></span>
                </label></div> </td>
                <td><%=objDetalle.getFolioPisaPlex() %></td>
                <td><%=objDetalle.getFolioPisa() %></td>
                <td><%=objDetalle.getTipoTarea() %></td>
                <td><%=objDetalle.getTipo() %></td>
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
                <td style="text-align:center;">
                <div class="btn-group" style="width: 100%;">
                		<span style="width:100%; font-size:10px; cursor:pointer; font-weight: bold;" class="label btn-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>pendiente<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>asignada<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>despachada<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>objetada<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>liquidada<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>peligro<%}%> dropdown-toggle" data-toggle="dropdown" style="font-size: smaller;"><%=objDetalle.getEstado() %></span>
                		<ul class="dropdown-menu" role="menu" style="margin-left: 100px; margin-top: -30px;">
         
                		<li ><span class="btn btn-default fa fa-print" style="width: 100%;" onclick="" title="IMPRIMIR"> <label style="font-family: monospace; cursor: pointer;">IMPRIMIR</label></span></li>
						</ul>
                	</div>
                </td>
                <td><%=objDetalle.getTelefono() %></td>
                <td><%=objDetalle.getEmpresa() %></td>
                <td><%=objDetalle.getDistrito() %></td>
                <td><%=objDetalle.getCope() %></td>
                <td><%=objDetalle.getFechaCont() %></td>
                <td><%=objDetalle.getFechaCita() %></td>
                <td><%=objDetalle.getFechaPendiente() %></td>
                <td><%=objDetalle.getDilacion() %></td>
                <td><%=objDetalle.getExpediente() %></td>
                
                <td><%=objDetalle.getFechaAsignada() %></td>
                <td><%=objDetalle.getFechaDespachada() %></td>
                <td><%=objDetalle.getFechaLiquidacion() %></td>
                <td><%=objDetalle.getAprovisionamiento() %></td>
                <td><%=objDetalle.getPruebas() %></td>
                <td><button onclick="" title="IMPRIMIR" class="btn btn-default btn-xs"><i class="fa fa-print"></i></button></td>
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
 	function cargaTareas()
 	{
 		var parempresa = $("#empresa option:selected").val();
 		var pardivision = $("#division option:selected").val();
 		var pararea = $("#area option:selected").val();
 		var parcope = $("#cope option:selected").val();
 		var partecnologia = '<%=tecnologia%>';
 		var parestatus = $("#estatus option:selected").val();
 		var parfechaini = $("#rango1").val();
 		var parfechafin = $("#rango2").val();
 		var parfoliopisaplex = $("#foliopisaplex").val();
 		var parfoliopisa = $("#foliopisa").val();
 		var partecnico = $("#tecnico").val();
 		var partipo = $("#tipoOrden option:selected").val();
 		
 		var parametros = "lbr="+'<%=lbr%>';
 		
 		if(parempresa!=""){parametros+="&empresa="+parempresa;}
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
 		if(partipo!=""){parametros+="&tipoOrden="+partipo;}
 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
 		$.ajax({
			url: 'resumenImpresiones.jsp?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				 $("#divisionTareas").html(resp);
				 $("#btnImprimir").css("display",'none');
			}
	  });
 	}
 	var tablaTareas;
 	$(function(){
//  		$("#rango1").datepicker();
//  		$("#rango2").datepicker();
 		tablaTareas= $('#tablaTareas').DataTable({
 			 "scrollX": true
 		 });

 		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnImprimir" onclick="" title="IMPRIMIR SELECCIONADOS" class="btn btn-default"><i class="fa fa-print"></i>&nbsp;&nbsp;Imprimir</button>');
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
    	abrirAsignar(folios);
		  
    }
   
    
    function limpiarFiltros()
    {
    	$("#empresa").val("");
    	$("#division").val("");
 		$("#area").val("");
 		$("#cope").val("");
 		$("#tipoOrden").val("");
 		$("#estatus").val("");
 		$("#rango1").val("");
 		$("#rango2").val("");
 		$("#foliopisaplex").val("");
 		$("#foliopisa").val("");
 		$("#tecnico").val("");
 		cargaTareas();
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
    		$("#asig"+folio).prop("disabled",true);
    		 checkedRows.push({folio: folio});
    	}
    	else
    	{
    		$("#asig"+folio).prop("disabled",false);
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
    		
    		$("#btnImprimir").css("display",'inline-block');
    	}
    	else
    	{
    		$("#btnImprimir").css("display",'none');
    	}
    }
 </script>             