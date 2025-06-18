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
	JSONArray tipomantenimiento = catalogos.consultaTipoTrabajo("");
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
	 
	 var parametros = "accion=C&pagina=1&usuario=<%=usuario%>";
	 $("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
		$.ajax({
			url: 'resumenReporteCostos.jsp?'+parametros,
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
          <h3 class="box-title">Reporte de Costos</h3>
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
			Cliente:
			</div>
			<div class="col-xs-9">
			<select  id="fcliente" class="form-control input-sm" onchange="consultasucursalescostos()" >
				<option value="">Seleccionar...</option>
				<%
					JSONObject registro = new JSONObject();
					for (int i=0; i<empresas.length(); i++)
					{
						registro = empresas.getJSONObject(i);
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
			<div class="col-xs-3" style="color:#FFFFFF;">
			Sucursal:
			</div>
			<div class="col-xs-9">
			<select  id="fsucursal" class="form-control input-sm" onchange="" disabled>
				<option value="">Seleccionar...</option>
				
			</select>
				
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

<!-- </div> -->


<div class="row" style="margin: 5px;">
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
		 $("#fcliente").select2( {
//				 dropdownParent: $("#dialog")
		 });
		
		
		
	});
 

 	function cargaTareas()
 	{
 		var partipotarea = "";
 		var parcliente = $("#fcliente").val();
 		var parsucursal = $("#fsucursal").val();
 		var parfechaini = $("#fechainicio").find("input").val();
 		var parfechafin = $("#fechafin").find("input").val();
 
 		var parametros = "accion=C&pagina=1&usuario=<%=usuario%>";
 		if(partipotarea!=""){parametros+="&tipotarea="+partipotarea;}
 		if(parcliente!=""){parametros+="&empresa="+parcliente;}
 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}

 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
 		$.ajax({
			url: 'resumenReporteCostos.jsp?'+parametros,
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

//     	$("#ftipoorden").val('').change();
    	$("#fcliente").val('').change();


//		$("#fempresa").val('');


		$("#fechainicio").find("input").val('');
		$("#fechafin").find("input").val('');
 		cargaTareas();
    }
    
   
    
    function consultasucursalescostos ()
	 {
		 $("#fsucursal").val("");

		 var paramcliente = $("#fcliente").val();
		 
		 param="accion=SUCURSALESREP";
		
		 if(paramcliente!=""){param+="&empresa="+paramcliente;}
		 $.ajax({
				url: '../GestionaTarea?'+param,
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
//				 	       		opt.id = item.ciudad;
//				 	       		opt.class= item.subzona;
							    opt.innerHTML = item.description;
							    document.getElementById('fsucursal').appendChild(opt);
							    
							   
					    		
				 	    });
//					    alert($('#frmsucu').html());
					    $("#fsucursal").select2( {
// 							 dropdownParent: $("#dialog")
						 });
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