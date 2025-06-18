<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="bean.ConsultaCatalogo"%>
<%@page import="bean.GestionTareas"%>


<%
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	ConsultaCatalogo catalogos = new ConsultaCatalogo();
	GestionTareas llamado = new GestionTareas();
	JSONArray empresas = catalogos.consultaEmpresa();
	JSONArray tecnicos = catalogos.consultaTecnicos();
	JSONArray proveedores = catalogos.consultaProveedores();
	llamado.setCantP(15);
// 	JSONArray lista = llamado.consultaTareas("", "0", "", "", "", "", "", "",1);
	String tipousuario = catalogos.consultaTiposUsuario(usuario);
%>
<script type="text/javascript">
<%-- var empresas = $.parseJSON('<%=empresas.toString()%>'); --%>

<%-- 	var lista = $.parseJSON('<%=lista.toString().replace("'", "&apos;")%>'); --%>
// 	$.each(empresas, function(i, item)
// 	{
// 				$("#prueba").append(item.description);

// 	});
// alert(empresas[0].clave);
 $(document).ready(function() {
	 $("#fproveedor").select2();
	 var parametros = "accion=C&pagina=1&usuario=<%=usuario%>&sinfact=N";
	 $("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
		$.ajax({
			url: 'resumenReporteFacturas.jsp?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				 $("#divisionTareas").html(resp);
//				 $("#btnAsigMasiva").css("display",'none');
			}
	  });
 });
 
 function consultasucursales ()
 {
	 var idempresa = $('#fempresa').val();
	 var idzona = $('#fzonas').val();
	 $.ajax({
			url: '../GestionaTarea?empresa='+idempresa+"&accion=SUCURSALES&zona="+idzona,
			cache: false,
			success: function( resp ) {
				datosjson = $.parseJSON(resp);
				 
				if(datosjson.length>0)
				{
				
					$('#fsucursal').html("");
					
					var opt;
				  	opt = document.createElement('option');
				 	opt.value = "";
				    opt.innerHTML = 'Seleccione';
				    document.getElementById('fsucursal').appendChild(opt);
				   
				    $.each(datosjson, function(i, item)
				    {
				    	
	 	       				opt = document.createElement('option');
			 	       		opt.value = item.value;
						    opt.innerHTML = item.description;
						    document.getElementById('fsucursal').appendChild(opt);
				    		
			 	    });
				    
				    $("#fsucursal").select2();
				    $("#fsucursal").prop("disabled",false);
				}
				else
				{
					$('#fsucursal').html("<option value=''>Seleccionar...</option>");
					  $("#fsucursal").select2();
					  $("#fsucursal").prop("disabled",true);
				}
			}
	});
 }
</script>
<section class="wrapper">
<!-- <div id="prueba"></div> -->
<div class="box collapsed-box" style="margin-top: 5px;">	
<div class="box-header with-border">
          <h3 class="box-title">Reporte de Facturas</h3>
          <div class="box-tools pull-right">
            <button class="btn btn-box-tool" type="button" data-widget="collapse" data-toggle="collapse" title="Mostrar/Ocultar filtros" data-target="#collapseFiltros" aria-expanded="true" aria-controls="collapseFiltros" data-original-title="Collapse">
				  <i class="fa fa-minus"></i>
			</button>
          </div>
</div>	
</div>

<div class="collapse in" id="collapseFiltros">

	

	<div class="col-md-12" style="display: inline-block;background-color: #929498;padding-bottom: 12px;padding-top: 10px; margin-bottom: 5px;">
		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
			<div class="row" style="padding-top: 5px;">
			<div class="col-xs-3" style="color:#FFFFFF;">
			Proveedor:
			</div>
			<div class="col-xs-9">
			<select  id="fproveedor" class="form-control input-sm" onchange="consultasucursales()" >
				<option value="">Seleccionar...</option>
				<%
					JSONObject registro = new JSONObject();
					for (int i=0; i<proveedores.length(); i++)
					{
						registro = proveedores.getJSONObject(i);
						%>
							<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
						<%
					}
				%>
			</select>
				
			</div>
			</div>	
		</div>
		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-lg-4" style="color:#FFFFFF;">
		Folio Factura:
		</div>
		<div class="col-xs-9 col-lg-8">
			<input type="text" id="ffoliofact" placeholder="ingresar factura" class="form-control input-sm"/>
		</div>
		</div>	
		</div>
	
		
		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-lg-4" style="color:#FFFFFF;">
		Fecha Inicio:
		</div>
		<div class="col-xs-9 col-lg-8">
<!-- 				<input type="text" id="rango1" style="width:100%;" class="form-control" maxlength="4" placeholder="Mínimo"/> -->
				<div class='input-group date' id='fechainicio'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
		</div>
		</div>	

		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 col-lg-4" style="color:#FFFFFF;">
		Fecha Fin:
		</div>
		<div class="col-xs-9 col-lg-8">
<!-- 				<input type="text" id="rango2" style="width:100%;" class="form-control" maxlength="4" placeholder="Máximo"/> -->
				<div class='input-group date' id='fechafin'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			</div>

		</div>
	



		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 " style="color:#FFFFFF;">
		Folio Orden:
		</div>
		<div class="col-xs-9 ">
			<input type="text" id="ffolioorden" placeholder="ingresar orden" class="form-control input-sm"/>
		</div>
		</div>
		</div>
		
		<div class="col-sm-12 col-md-6 col-lg-3" style="height: 40px;">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-6 " style="color:#FFFFFF;">
		Incluir OS sin Factura:
		</div>
		<div class="col-xs-6 ">
			<input id="sinfact" type="checkbox">
		</div>
		</div>
		</div>
		
		
		
		
<!-- 		<div class="col-md-5 col-md-4 col-lg-3 col-lg-offset-9 col-md-offset-0 col-sm-offset-0 " align="right" style="margin-top: 5px;"> -->
		<div class="col-md-12 col-md-4 col-lg-4   " align="right" style="margin-top: 5px;">
<!-- 		<div class="row"> -->
		<div class="col-xs-5 col-sm-3 col-md-6">
		<button class="btn btn-default" onclick="limpiarFiltros()" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		</div>
		<div class="col-xs-5 col-sm-3 col-md-6">
		<button class="btn btn-default" onclick="cargaTareas()" style="margin 2px;"><span class="fa fa-filter"></span> Consultar</button>
		</div>
		

<!-- 		</div> -->
		</div>
		

</div>
</div>

<!-- <div class="row" style="margin:0px;"> -->
<div class="col.xs-12" align="right" style="padding-right: 5px;"><button  id="btnExcel" onclick="generarExcel()" title="Generar Excel" class="btn btn-default btn-xs"><img alt="" src="../img/647702-excel-512.png" style="width: 20px;">&nbsp;Generar Excel</button></div>
<!-- </div> -->


<div class="row" style="margin: 5px;" >
<!-- <div class="col.xs-12"><button  id="btnCapturarInci" onclick="abrirformulario('A')" title="Capturar Incidente" class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i>&nbsp;Capturar Incidente</button></div> -->
                  <div class="col-md-12">
                      <div class="accordion">
				<div class = "row" style="padding-top:10px; overflow:auto;" id="divisionTareas">
				
				
				</div>
				</div>
				
				
				
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
              <div id="dialog"></div>
              </section>
 
<script type="text/javascript">


 
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
// 		$("#selectTecnicoR").select2({
// 			data:storeTecnicos,
// 			placeholder: "Seleccione Técnico"
// 		});
		
// 		$("#selectTecnicoActual").select2({
// 			data:storeTecnicoActual,
// 			placeholder: "Seleccione Técnico"
// 		});

		$('#fechainicio').datetimepicker(
				{
// 					 format: 'YYYY-MM-DD HH:MM:ss' 
					format: 'YYYY-MM-DD' 
				});
		$('#fechafin').datetimepicker({
// 			format: 'YYYY-MM-DD HH:MM:ss' 
			format: 'YYYY-MM-DD' 
		});
		 $("#fechainicio").keypress(function(event) {event.preventDefault();});
		 $("#fechafin").keypress(function(event) {event.preventDefault();});

		
		
		
	});
 

 	function cargaTareas()
 	{
 		var parproveedor = $("#fproveedor").val();
 		var parfoliofact = $("#ffoliofact").val();
 		var parfolioorden = $("#ffolioorden").val();
 		var parfechaini = $("#fechainicio").find("input").val();
 		var parfechafin = $("#fechafin").find("input").val();
 		var parsinfact = $("#sinfact:checked").length;
 		var parametros = "accion=C&pagina=1&usuario=<%=usuario%>";
 		if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
 		if(parsinfact==1){parametros+="&sinfact=";}else{parametros+="&sinfact=N";}
 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}

 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
 		$.ajax({
			url: 'resumenReporteFacturas.jsp?'+parametros,
			type: "GET",
			cache: false,
			
			success: function( resp ) {
				 $("#divisionTareas").html(resp);
// 				 $("#btnAsigMasiva").css("display",'none');
			}
	  });
 	}
 	var tablaTareas;
 	$(function(){
 		
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
 		
//  		tablaTareas= $('#tablaTareas').DataTable({
//  			 "scrollX": true,
// //  			 paging:false,
//  			 seacrching: false
// //  			 "sScrollY": 520,
// //  			 "scrollCollapse": true
//  		 });
//  		var alturaactual = $("div .dataTables_scrollBody").css("height");
//  		var newheight = parseInt(alturaactual.split("px")[0])+70;
//  		$("div .dataTables_scrollBody").css("height",newheight);
//  		$("#tablaTareas_length").append('&nbsp;&nbsp;&nbsp;<button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button>');
 	});
 	

 	
    /**********************************************************************/
    /***********************abrirAsignarMasivo*****************************/ 
    /**********************************************************************/ 	
    function limpiarFiltros()
    {
    	$("#ffoliofact").val('');
    	$("#ffolioorden").val('');
    	$("#ffoliofact").val('');
    	$('#sinfact').prop('checked', false);
//		$("#fempresa").val('');
		$("#fproveedor").val('').change();

		$("#fechainicio").find("input").val('');
		$("#fechafin").find("input").val('');
 		cargaTareas();
    }
    
    function generarExcel()
    {
    	
    	var parametros = "tipo=factura&titulo="+escape("Reporte de Facturas")+"&usuario=<%=usuario%>";
 		if(parproveedor!=""){parametros+="&proveedor="+parproveedor;}
 		if(parfoliofact!=""){parametros+="&foliofact="+parfoliofact;}
 		if(parfolioorden!=""){parametros+="&folioorden="+parfolioorden;}
 		if(parsinfact!="N"){parametros+="&sinfact=";}else{parametros+="&sinfact=N";}
 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
 		
    	window.open("../ExcelReportes?"+parametros);
    	
    }
    
 </script>             