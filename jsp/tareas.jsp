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
	JSONArray zonas = catalogos.consultaZonas();
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
	 $("#fempresa").select2();
	 $("#fzonas").select2();
	 $("#fsucursal").select2();
	  $("#fsucursal").prop("disabled",true);
	 $("#ftecnico").select2();
	 var parametros = "accion=C&pagina=1&usuario=<%=usuario%>";
	 $("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
		$.ajax({
			url: 'resumenTareas.jsp?'+parametros,
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
          <h3 class="box-title">Lista de Tareas</h3>
          <div class="box-tools pull-right">
            <button class="btn btn-box-tool" type="button" data-widget="collapse" data-toggle="collapse" title="Mostrar/Ocultar filtros" data-target="#collapseFiltros" aria-expanded="true" aria-controls="collapseFiltros" data-original-title="Collapse">
				  <i class="fa fa-minus"></i>
			</button>
          </div>
</div>	
</div>

<div class="collapse in" id="collapseFiltros">

	

	<div class="col-md-12" style="display: inline-block;background-color: #929498;padding-bottom: 12px;padding-top: 10px; margin-bottom: 5px;">
		<div class="col-sm-12 col-md-4 col-lg-2">
			<div class="row" style="padding-top: 5px;">
			<div class="col-xs-3" style="color:#FFFFFF;">
			Orden:
			</div>
			<div class="col-xs-9">
				<input type="text" id="idorden" placeholder="ingresar orden" class="form-control input-sm"/>
			</div>
			</div>	
		</div>
		<div class="col-sm-12 col-md-4 col-lg-3">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3" style="color:#FFFFFF;">
		Zona:
		</div>
		<div class="col-xs-9 col-lg-9">
			<select  id="fzonas" class="form-control input-sm" onchange="consultasucursales()" >
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
		
		<div class="col-sm-12 col-md-4 col-lg-3">
			<div class="row" style="padding-top: 5px;">
			<div class="col-xs-3" style="color:#FFFFFF;">
			T&eacute;cnico:
			</div>
			<div class="col-xs-9 ">
				<select id="ftecnico" class="form-control input-sm" >
				<option value="">Seleccionar...</option>
				<%
					registro = new JSONObject();
					for (int i=0; i<tecnicos.length(); i++)
					{
						registro = tecnicos.getJSONObject(i);
						%>
							<option value="<%=registro.getString("value")%>"><%=registro.getString("description")%></option>
						<%
					}
				%>
			</select>
			</div>
			</div>	
		</div>
		
		<div class="col-sm-12 col-md-12 col-lg-4 ">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3" style="color:#FFFFFF;">
		Fecha Cita:
		</div>
		<div class="col-xs-9">
			<div class="row">
			<div class="col-xs-12 col-sm-6">
<!-- 				<input type="text" id="rango1" style="width:100%;" class="form-control" maxlength="4" placeholder="Mínimo"/> -->
				<div class='input-group date' id='fechainicio'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
			<div class="col-xs-12 col-sm-6">
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
		</div>
		</div>


		<div class="col-sm-12 col-md-6 col-lg-5">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 " style="color:#FFFFFF;">
		Cliente:
		</div>
		<div class="col-xs-9">
			<select  id="fempresa" class="form-control input-sm" onchange="consultasucursales()" >
				<option value="">Seleccionar...</option>
				<%
					registro = new JSONObject();
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
		<div class="col-sm-12 col-md-6 col-lg-4">
		<div class="row" style="padding-top: 5px;">
		<div class="col-xs-3 " style="color:#FFFFFF;">
		Sucursal:
		</div>
		<div class="col-xs-9 ">
			<select id="fsucursal" class="form-control input-sm" disabled onchange="">
				<option value="">Seleccionar...</option>
			
			</select>
		</div>
		</div>
		</div>
		
		
		
		
<!-- 		<div class="col-md-5 col-md-4 col-lg-3 col-lg-offset-9 col-md-offset-0 col-sm-offset-0 " align="right" style="margin-top: 5px;"> -->
		<div class="col-md-12 col-md-4 col-lg-3   " align="right" style="margin-top: 5px;">
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
<!-- <div class="col.xs-12"><button  id="btnAsigMasiva" onclick="abrirformulario('A')" title="Capturar Incidente" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Capturar Incidente</button></div> -->
<!-- </div> -->


<div class="row" style="margin: 5px;">
<div class="col.xs-12"><button  id="btnCapturarInci" onclick="abrirformulario('A')" title="Capturar Incidente" class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i>&nbsp;Capturar Incidente</button></div>
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
		if('<%=tipousuario%>'=='T')
		{
			$("#ftecnico").attr('disabled','disabled'); 
			$("#btnCapturarInci").css("display","none");
		}
		
		
		
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
 		var parorden = $("#idorden").val();
 		var parcliente = $("#fempresa").val();
 		var parsucursal = $("#fsucursal").val();
 		var partecnico = $("#ftecnico").val();
 		var parzona = $("#fzonas").val();
 		var parfechaini = $("#fechainicio").find("input").val();
 		var parfechafin = $("#fechafin").find("input").val();
 		var parametros = "accion=C&pagina=1&usuario=<%=usuario%>";
 		if(parorden!=""){parametros+="&orden="+parorden;}
 		if(parcliente!=""){parametros+="&cliente="+parcliente;}
 		if(parsucursal!=""){parametros+="&sucursal="+parsucursal;}
 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
 		if(parzona!=""){parametros+="&zona="+parzona;}
 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}

 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
 		$.ajax({
			url: 'resumenTareas.jsp?'+parametros,
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
      
      dialog = $( "#dialog-form-Reasignar" ).dialog({
        autoOpen: false,
        height: 400,
        width: 500,
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
 	
 	
    /**********************************************************************/
    /***********************abrirAsignarMasivo*****************************/ 
    /**********************************************************************/ 	
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
    	abrirASIGNAR(folios,'','');
		  
    }
    
   /**********************************************************************/
   /***********************abrirREASIGNAR********************************/ 
   /**********************************************************************/ 
    
    function abrirREASIGNAR(foliopisa,telefono, folioplex,expediente)
    {
    	var parametros = "folioplex="+folioplex+"&estado=ASIGNADA";
    			$.ajax({
				url: "../ValidarEstadoTarea?"+parametros,
				type: "GET",
				cache: false,
				success: function( resp ) {
							if(resp.trim()=="OK")
    		  				{
    		  					tipoAccion="Reasignar";
    							abrirASIGNAR(foliopisa,telefono,folioplex,expediente);
    		  				}else{
    		  				var mensaje="";
    		  					if(resp.trim() == "COMPLETE"){
    		  						resp="LIQUIDADA";
    		  					}
    		  					swal("", "La tarea ya fue " + resp+".", "error");
    		  					cargaTareas();
    		  				}
  						}
				  });
    	
    	
    }
    /**********************************************************************/
    /***********************abrirASIGNAR********************************/ 
    /**********************************************************************/ 
    function abrirASIGNAR(foliopisa,telefono,folioplex,expediente)
    {
    	// En el parametro estado se le envia el estado en el que fue levantada la acción
    	var parametros="";
    	if(tipoAccion == ""){
    		tipoAccion="Asignar";
    			parametros = "&folioplex="+folioplex+"&estado=PENDIENTE";
    		}else{
    			parametros = "&folioplex="+folioplex+"&estado=ASIGNADA";
    		}
    	
    			$.ajax({
				url: "../ValidarEstadoTarea?"+parametros,
				type: "GET",
				cache: false,
				success: function( resp ) {
							if(resp.trim()=="OK")
    		  				{
    		  					if(tipoAccion=="Asignar"){
    		  						var jsp="asignacionTarea.jsp?folioplex=" + folioplex+"&foliopisa=" + foliopisa+"&telefono=" + telefono+"&accion=" + tipoAccion;
    								tipoAccion='';
    								var tipoTarea ="asignar";
     								panelDeTareasADM(tipoTarea,"agregar",folioplex,foliopisa,telefono,estado,jsp);
    		  					}else{
    		  						reasignarTarea(folioplex, foliopisa,telefono,expediente);
    		  					}
    		  					
    		  				}else{
    		  					var mensaje="";
    		  					if(resp.trim() == "COMPLETE"){
    		  						resp="LIQUIDADA";
    		  					}
    		  					swal("", "No se pudo realizo la acción porque la tarea ya esta " + resp+".", "error");
    		  					cargaTareas();
    		  				}
    		  				tipoAccion="";
  						}
				  });

    }
    
    /*========================================================================*/
    function reasignarTarea(folioplex, foliopisa, telefono, expediente)
    {
      $('#selectTecnicoActual').val(expediente).trigger('change.select2');
    	//$("#selectTecnicoR option[value='']").prop('selected',true);
    	$('#selectTecnicoR').val('').trigger('change.select2');
    	$("#foliopisaReasigna").val(foliopisa);
    	dialog = $( "#dialog-form-Reasignar" ).dialog({
            autoOpen: false,
            height: 400,
            width: 500,
            modal: true,
            title: "Reasignación de Tarea",
            buttons: [{
              text : "Aceptar",
              "class": "btn btn-primary",
              click: function() {
              	 var expedienteNuevo=$("#selectTecnicoR").find("option:selected").val();
				 var nombre=$("#selectTecnicoR").find("option:selected").text();
				 var accion = 'Reasignar';
				 parametros="tipo=ASIGNADA&estado=ASIGNADA&folioplex="+folioplex+"&foliopisa="+foliopisa+"&expediente="+expedienteNuevo+"&nombre="+escape(nombre)+"&accion="+accion;
  	  			if(expedienteNuevo!="" && expedienteNuevo!=undefined)
  	  			{
  	    	swal({
  	    		title: "",  
  	    		text: "¿Desea asignar la orden "+foliopisa+" al tecnico "+nombre+"?",     
      			type: "info",   
      			showCancelButton: true,   
      			cancelButtonText: "Cancelar",
      			confirmButtonColor: "#3a5a74",   
      			confirmButtonText: "Aceptar",   
      			closeOnConfirm: false }, 
      			function(){
       				$.ajax({
                 			url: 'actualizaEstado.jsp?'+parametros,
                 			type: "GET",
                 			cache: false,
                 			success: function( resp ) {
                 				if(resp.trim()=="OK")
                 				{
			                 				
			                 				swal({
				            	    		title: "",  
				            	    		text: "La asignación de tarea(s) fue satisfactoria.",   
				                			type: "success",   
				                			showCancelButton: false,   
				                			confirmButtonColor: "#3a5a74",   
				                			confirmButtonText: "Aceptar",   
				                			closeOnConfirm: true }, 
				                			function(){
				                				//Borrar tarea del panel de Tareas
				                				dialog.dialog( "close" );
				                				$('#selectTecnicoR').val('').trigger('change.select2');
				                				// Actualiza el panel de tareas
				                				var jsp="popupDetalle.jsp?folioplex=" +folioplex + "&foliopisa=" +foliopisa + "&telefono=" +telefono + "&expediente=" +expedienteNuevo;
    											var tipoTarea ="detalle";
     											panelDeTareasADM(tipoTarea,"actualizar",folioplex,foliopisa,telefono,"",jsp);
     											cargaTareas();
				                        		}); 
                        		}
                        		else
                        		{
                        			swal("Error al ASIGNAR tarea", "", "error");
                        		}
                        	}});
              	
      			});
  	  }
  	  else
  		  {
  		  swal("Debe seleccionar un técnico", "", "warning");
  		  }
//             	  var expediente=$("#selectTecnico").find("option:selected").val();
//             	  var nombre=$("#selectTecnicoR").find("option:selected").text();
//             	  var accion = 'Reasignar';
<%--             	  parametros="tipo=ASIGNADA&estado=ASIGNADA&folioplex="+folioplex+"&foliopisa="+foliopisa+"&expediente="+expediente+"&nombre="+escape(nombre)+"&lbr="+'<%=lbr%>'+"&accion="+accion; --%>
//             	  if(expediente!="")
//             	  {
//             	    	swal({
//             	    		title: "",  
//             	    		text: "Desea asignar la order "+folioplex+" al tecnico "+nombre+"?",    
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
//                                   			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
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
//                                   				}
//                                   			}});
                        	
//                 			});
                			
				  
//             	  }
//             	  else
//             		  {
//             		  swal("Debe seleccionar un técnico", "", "warning");
//             		  }
            	  
            	  }
            },{
            	text:"Cancelar",
            	"class": "btn btn-primary",
              click: function() {
                dialog.dialog( "close" );
              }
            }]
          });
    	dialog.dialog( "open" );
    }
    /*===============================================================================*/
    
    function abrirDESPACHAR(foliopisa,telefono,folioplex,expediente)
    {
    	var params = "folioplex="+folioplex+"&estado=ASIGNADA";
    			$.ajax({
				url: "../ValidarEstadoTarea?"+params,
				type: "GET",
				cache: false,
				success: function( resp ) {
							if(resp.trim()=="OK")
    		  				{
    		  					swal({
					    		title: "",  
					    		text: "¿Desea despachar la orden: "+foliopisa+"?",      
					    			type: "info",   
					    			showCancelButton: true,   
					    			cancelButtonText: "Cancelar",
					    			confirmButtonColor: "#3a5a74",    
					    			confirmButtonText: "Aceptar",   
					    			closeOnConfirm: true }, 
					    			function(){
					    				  var parametros="estado=DESPACHADA&tipo=DESPACHADA&folioplex="+folioplex+"&foliopisa="+foliopisa;
					    		    	$.ajax({
					    		  			url: 'actualizaEstado.jsp?'+parametros,
					    		  			type: "GET",
					    		  			cache: false,
					    		  			
					    		  			success: function( resp ) {
					    		  				if(resp.trim()=="OK")
					    		  				{
// 					    		  					var pardivision = $("#division option:selected").val();
// 					    	      			 		var pararea = $("#area option:selected").val();
// 					    	      			 		var parcope = $("#cope option:selected").val();
<%-- 					    	      			 		var partecnologia = '<%=tecnologia%>'; --%>
// 					    	      			 		var parestatus = $("#estatus option:selected").val();
// 					    	      			 		var parfechaini = $("#rango1").val();
// 					    	      			 		var parfechafin = $("#rango2").val();
// 					    	      			 		var parfoliopisaplex = $("#foliopisaplex").val();
// 					    	      			 		var parfoliopisa = $("#foliopisa").val();
// 					    	      			 		var partecnico = $("#tecnico").val();
					    	      			 		
<%-- 					    	      			 		var parametros = "lbr="+'<%=lbr%>'; --%>
// 					    	      			 		if(pardivision!=""){parametros+="&division="+pardivision;}
// 					    	      			 		if(pararea!=""){parametros+="&area="+pararea;}
// 					    	      			 		if(parcope!=""){parametros+="&cope="+parcope;}
// 					    	      			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
// 					    	      			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
// 					    	      			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
// 					    	      			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
// 					    	      			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
// 					    	      			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
// 					    	      			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
// 					    	      			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div>");
// 					    	      			 		$.ajax({
// 					    	      						url: 'resumenTareas.jsp?'+parametros,
// 					    	      						type: "GET",
// 					    	      						cache: false,
					    	      						
// 					    	      						success: function( resp ) {
// 					    	      							 $("#divisionTareas").html(resp);
// 					   	       								$("#btnAsigMasiva").css("display",'none');
// 					    	      							dialog.dialog( "close" );
// 					    	      						}
// 					    	      				  });
					    		  					dialog.dialog( "close" );
					    		  				// Actualiza el detalle de la orden si en el momento de la accion se encuentra abierta
				                				var jsp="popupDetalle.jsp?folioplex=" +folioplex + "&foliopisa=" +foliopisa + "&telefono=" +telefono + "&expediente=" +expediente;
    											var tipoTarea ="detalle";
     											panelDeTareasADM(tipoTarea,"actualizar",folioplex,foliopisa,telefono,"",jsp);
     											cargaTareas();
					    		  				}
					    		  				else
					    		  				{
					    		  					swal("Error al despachar orden", "", "error");
					    		  				}
					    		  			}
					    		    	});
					    				 });
    		  				}else{
    		  				var mensaje="";
    		  					if(resp.trim() == "COMPLETE"){
    		  						resp="LIQUIDADA";
    		  					}
    		  					swal("", "La tarea ya fue " + resp+".", "error");
    		  					cargaTareas();
    		  				}
  						}
				  });
    }
    
    
    function limpiarFiltros()
    {
    	$("#idorden").val('');
//  		$("#fempresa").val('');
		$("#fzonas").val('').change();
		$("#fempresa").val('').change();
 		$("#fsucursal").val('').change();
 		$("#ftecnico").val('').change();
 		$("#fechainicio").find("input").val('');
 		$("#fechafin").find("input").val('');
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
/***********************************/
 /*************DETALLE*************/
 /***********************************/
    function abrirDetalle(folioplex,foliopisa,telefono,expediente,estado)
    {
     	//var jsp="popupDetalle.jsp?division=" + division + "&area=" +area + "&cope=" +cope + "&empresa=" +empresa + "&folioplex=" +folioplex + "&foliopisa=" +foliopisa + "&telefono=" +telefono + "&tecnologia=" + tecnologia + "&expedienteplex=" +expedienteplex + "&distrito=" +distrito + "&tipotarea=" +tipotarea + "&estado=" +estado + "&dilacion=" +dilacion + "&telefonocontacto=" +telefonocontacto + "&telefonocelular=" + telefonocelular + "&fechacontrpda=" +fechacontrpda + "&fechacita=" +fechacita + "&fechapendiente=" +fechapendiente + "&expediente=" +expediente + "&tecnico=" +tecnico + "&aprovisionamiento=" + aprovisionamiento + "&fechaaprovisionamiento=" + fechaaprovisionamiento + "&fechaasignada=" +fechaasignada + "&fechadespachada=" +fechadespachada + "&fechaliquidada=" + fechaliquidada + "&facilidades=" +facilidades + "&tipo=" + tipo + "&valorasignado=" +valorasignado;
     	var jsp="popupDetalle.jsp?folioplex=" +folioplex + "&foliopisa=" +foliopisa + "&telefono=" +telefono + "&expediente=" +expediente;
    	var tipoTarea ="detalle";
     	panelDeTareasADM(tipoTarea,"agregar",folioplex,foliopisa,telefono,estado,jsp);

    	
    }  
    /***********************************/
    /*************abrirAPROVISIONAR****/
    /***********************************/  
    function abrirAPROVISIONAR(foliopisa,telefono,folioplex,expediente,estado)
    {
    	var jsp="aprovisionamiento.jsp?foliopisa=" + foliopisa+"&telefono="+telefono+"&folioplex="+folioplex;
    	var tipoTarea ="aprovisionamiento";
     	panelDeTareasADM(tipoTarea,"agregar",folioplex,foliopisa,telefono,estado,jsp);
    	
    }
    /***********************************/
    /*************abrirPRUEBAS*********/
    /***********************************/     
    
    function abrirPRUEBAS(foliopisa,telefono,folioplex,expediente,estado){ 
    
    	var jsp="pruebasdecalidad.jsp?folio=" + foliopisa;
    	var tipoTarea ="pruebas";
     	panelDeTareasADM(tipoTarea,"agregar",folioplex,foliopisa,telefono,estado,jsp);
    }
    /***********************************/
    /*************abrirOBJETAR*********/
    /***********************************/  
    function abrirOBJETAR(foliopisa,telefono,folioplex,expediente,estado)
    {
		// En el parametro estado se le envia el estado en el que fue levantada la acción
    	var parametros = "folioplex="+folioplex+"&estado=DESPACHADA";
  		$.ajax({
		url: "../ValidarEstadoTarea?"+parametros,
		type: "GET",
		cache: false,
		success: function( resp ) {
					if(resp.trim()=="OK")
	  				{
	  					var jsp="objetar.jsp?folioplex=" + folioplex+"&foliopisa=" + foliopisa+"&telefono=" + telefono;
		    			var tipoTarea ="objetar";
		     			panelDeTareasADM(tipoTarea,"agregar",folioplex,foliopisa,telefono,estado,jsp);
		  			}else{
	  					var mensaje="";
	  					if(resp.trim() == "COMPLETE"){
	  						resp="LIQUIDADA";
	  					}
	  					swal("", "No se pudo realizo la acción porque la tarea ya esta " + resp+".", "error");
	  					cargaTareas();
		  			}
				}
		  });
    }
    
    function abrirLIQUIDAR(foliopisa,telefono,folioplex,expediente,estado)
    {
    	var params = "folioplex="+folioplex+"&estado=DESPACHADA";
 		$.ajax({
		url: "../ValidarEstadoTarea?"+params,
		type: "GET",
		cache: false,
		success: function( resp ) {
			if(resp.trim()=="OK")
  		  	{
    	
		    	swal({
		    		title: "",  
		    		text: "¿Desea liquidar la orden: "+foliopisa+"?",   
	    			type: "info",   
	    			showCancelButton: true,   
	    			cancelButtonText: "Cancelar",
	    			confirmButtonColor: "#3a5a74",    
	    			confirmButtonText: "Liquidar",   
	    			closeOnConfirm: true }, 
	    			function(){
	    				var parametros="estado=COMPLETE&tipo=COMPLETE&folioplex="+folioplex+"&foliopisa="+foliopisa;
	    		    	$.ajax({
			    		  			url: 'actualizaEstado.jsp?'+parametros,
			    		  			type: "GET",
			    		  			cache: false,
				    		  		success: function( resp ) 
				    		  		{
				    		  			if(resp.trim()=="OK")
				    		  			{
					    		  			dialog.dialog( "close" );
										    var jsp="popupDetalle.jsp?folioplex=" +folioplex + "&foliopisa=" +foliopisa + "&telefono=" +telefono + "&expediente=" +expediente;
   											var tipoTarea ="detalle";
   											panelDeTareasADM(tipoTarea,"actualizar",folioplex,foliopisa,telefono,estado,jsp);
   											cargaTareas();
					    		  		}else 
					    		  		{
					    		  				swal("Error al liquidar orden", "", "error");
					    		  		}
		    		  				}
							    });
					});
    		}else
    		{
  				var mensaje="";
				if(resp.trim() == "COMPLETE"){
  					resp="LIQUIDADA";
  				}
  				swal("", "La tarea ya fue " + resp+".", "error");
  				cargaTareas();
    		}
  		}
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
    
    
    function activarTecnologia(){
    	var origen= $("#fuente option:selected").val();
    	if(origen=="PLEX"){
    		$("#tecnologia").prop("disabled", false);
    	}else{
    		$("#tecnologia").prop("disabled", true);
    		$("#tecnologia").val("");
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
    
    function abrirformulario(accion)
    {
    	 $("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;
    	if(accion=="A")
    	{
    		tituloform = "Capturar Incidencia";
    		alto=h-150;
    	}
    	else
    	{
    		tituloform = "Despachar Incidencia";
    		alto=h-150;
    	}
    	if(w<800)
		{
			alto=h;
		}
		else
		{
			alto = 650;
		}
    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
 	        			 
 	        			var bandvalida = true;
 	        			var forden = $("#frmordenServicio").val();
 	        			if(forden==""){$("#sec-frmordenServicio").addClass("has-error"); bandvalida=false;}else{$("#sec-frmordenServicio").removeClass("has-error");}
 	        			
 	        			var ftipomant= $("#frmtipomantenimiento").val();
 	        			if(ftipomant==""){$("#sec-frmtipomantenimiento").addClass("has-error"); bandvalida=false;}else{$("#sec-frmtipomantenimiento").removeClass("has-error");}
 	        			var fcliente=$("#frmcliente").val();
 	        			if(fcliente==""){$("#sec-frmcliente").addClass("has-error"); bandvalida=false;}else{$("#sec-frmcliente").removeClass("has-error");}
 	        			var fciudad = $("#frmciudad").val();
 	        			if(fciudad==""){$("#sec-frmciudad").addClass("has-error"); bandvalida=false;}else{$("#sec-frmciudad").removeClass("has-error");}
 	        			var sucdetzona =$("#frmsucu").val();
 	        			sucdetzona = sucdetzona.split(":");
 	        			var fsucursal = sucdetzona[0];
 	        			if(fsucursal==""){$("#sec-frmsucu").addClass("has-error"); bandvalida=false;}else{$("#sec-frmsucu").removeClass("has-error");}
 	        			var fzona = $("#frmzona").val();
 	        			if(fzona==""){$("#sec-frmzona").addClass("has-error"); bandvalida=false;}else{$("#sec-frmzona").removeClass("has-error");}
 	        			var fdireccion = $("#frmdireccion").val();
 	        			//descomentar cuando todas las sucursales tengan direccion
//  	        			if(fdireccion==""){$("#sec-frmdireccion").addClass("has-error"); bandvalida=false;}else{$("#sec-frmdireccion").removeClass("has-error");}
 	        			var fgerentesup=$("#frmgerente").val();
//  	        			if(fgerentesup==""){$("#sec-frmgerente").addClass("has-error"); bandvalida=false;}else{$("#sec-frmgerente").removeClass("has-error");}
 	        			var fechareg = $('#ffecharegistro').find("input").val(); 
 	        			if(fechareg==""){$("#sec-ffecharegistro").addClass("has-error"); bandvalida=false;}else{$("#sec-ffecharegistro").removeClass("has-error");}
 	        			var horareg = $("#frmhorareg").val();
 	        			if(horareg==""){$("#sec-frmhorareg").addClass("has-error"); bandvalida=false;}else{$("#sec-frmhorareg").removeClass("has-error");}
 	        			var razonserv =$("#razonserv option:selected").text();
 	        			if(razonserv==""){$("#sec-razonserv").addClass("has-error"); bandvalida=false;}else{$("#sec-razonserv").removeClass("has-error");}
 	        			
 	        			var detallezona =sucdetzona[1];
//  	        			alert(detallezona);
 	        			if(detallezona=="" || detallezona=="0"){$("#sec-razonserv").addClass("has-error"); bandvalida=false;}else{$("#sec-razonserv").removeClass("has-error");}
//  	        			var data = $('#razonserv').select2('data'); 
						var bandRazonserv = "";
 	        			if(razonserv=="OTRO")
 	        			{
 	        				razonserv = $("#razonservotro").val();
 	        				bandRazonserv = "S";
 	        				if(razonserv==""){$("#sec-razonservotro").addClass("has-error"); bandvalida=false;}else{$("#sec-razonservotro").removeClass("has-error");}
 	        			}
 	        			else
 	        			{
 	        				razonserv =razonserv;
 	        			}
 	        			var prioridad =$("#prioridad").val();
 	        			if(prioridad==""){$("#sec-prioridad").addClass("has-error"); bandvalida=false;}else{$("#sec-prioridad").removeClass("has-error");}
 	        			var param = "accion=A";
 	        			param += "&orden="+escape(forden)+"&tipomantenimiento="+escape(ftipomant)+"&empresa="+escape(fcliente)+"&ciudad="+escape(fciudad)+"&sucursal="+escape(fsucursal)+"&direccion="+escape(fdireccion)+"&gerente="+escape(fgerentesup)+"&fechareg="+escape(fechareg)+"&horareg="+escape(horareg)+"&usuario=<%=usuario%>&razonserv="+escape(razonserv)+"&prioridad="+escape(prioridad)+"&bandRazonserv="+bandRazonserv+"&zona="+fzona+"&subzona="+detallezona;
 	        			if(bandvalida)
 	        			{
 	        				$("#container").mLoading("show");
//  	        			$("#loadingfrm").mLoading();
 	        			
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Incidencia Capturada!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" );
 						                				
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
 												swal("Error al capturar incidencia", "", "error");
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
 	        			}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	if(w<800)
    	{
    		$("#dialog").load("formularioMovil.jsp?accion="+accion);
    	}
    	else
    	{
    		$("#dialog").load("formulario.jsp?accion="+accion);
    	}
        $("#dialog").dialog("open");

    }
    function realizaREASIGNAR(idorden,ordenserv,sigestatus, actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
//     	realizaASIGNAR(idorden,ordenserv);
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Reasignar Técnico";
    		alto=h-150;
    		
    		if(w<600)
    		{
    			alto=h;
    		}
    		else
    		{
    			alto = 300;
    		}

    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
						var param="accion=REASIGNAR";
						var paramtecnico = $("#frmtecnico").val();
						var parammotivo = $("#frmmotivo").val();
						var bandvalida = true;
						if(paramtecnico==""){$("#sec-frmtecnico").addClass("has-error"); bandvalida=false;}else{$("#sec-frmtecnico").removeClass("has-error");}
						if(parammotivo==""){$("#sec-frmmotivo").addClass("has-error"); bandvalida=false;}else{$("#sec-frmmotivo").removeClass("has-error");}
 	        			param += "&orden="+escape(idorden)+"&tecnico="+escape(paramtecnico)+"&usuario=<%=usuario%>&motivo="+parammotivo+"&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
 	        			if(bandvalida)
 	        			{
//  	        			$("#loadingfrmtec").mLoading("show");
 	        			$("#container").mLoading("show");
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Incidencia Asignada!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" ); 
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
//  												$("#loadingfrmtec").mLoading("hide");
 												swal(item.mensaje, "", "error");
 												
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        			
 	        		  });
 	        			
 	        			}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	$("#dialog").load("formAsignar.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden)+"&tipo=reasignacion");
        $("#dialog").dialog("open");
    }
    function realizaASIGNAR(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Asignar Técnico";
    		alto=h-150;
    		if(w<600)
    		{
    			alto=h;
    		}
    		else
    		{
    			alto = 300;
    		}

    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
						var param="accion=ASIGNAR";
						var paramtecnico = $("#frmtecnico").val();
						var bandvalida = true;
						if(paramtecnico==""){$("#sec-frmtecnico").addClass("has-error"); bandvalida=false;}else{$("#sec-frmtecnico").removeClass("has-error");}
 	        			param += "&orden="+escape(idorden)+"&tecnico="+escape(paramtecnico)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
 	        			if(bandvalida)
 	        			{
//  	        			$("#loadingfrmtec").mLoading();
 	        			$("#container").mLoading("show");
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Incidencia Asignada!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" ); 
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
 												swal("Error al asignar incidencia", "", "error");
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
 	        			}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	$("#dialog").load("formAsignar.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
        $("#dialog").dialog("open");

    }
    
    function realizaDESPACHAR(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Iniciar Trabajo";
    		alto=h-150;
    		if(w<600)
    		{
    			alto=h;
    		}
    		else
    		{
    			alto = 600;
    		}

    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
						var param="accion=DESPACHAR";
						var paramrecibido = $("#frmrecibido").val();
						var parampuesto = $("#frmpuesto").val();
						var bandvalida = true;
						if(paramrecibido==""){$("#sec-frmrecibido").addClass("has-error"); bandvalida=false;}else{$("#sec-frmrecibido").removeClass("has-error");}
						if(parampuesto==""){$("#sec-frmpuesto").addClass("has-error"); bandvalida=false;}else{$("#sec-frmpuesto").removeClass("has-error");}
 	        			param += "&orden="+escape(idorden)+"&recibido="+escape(paramrecibido)+"&usuario=<%=usuario%>&puesto="+parampuesto+"&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
 	        			if(bandvalida)
						{
//  	        			$("#loadingfrmtec").mLoading();
 	        			$("#container").mLoading("show");
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Trabajo en Curso!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" ); 
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
 												swal("Error al iniciar Trabajo!", "", "error");
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
						}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar!", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	if(w<800)
    	{
    		$("#dialog").load("formDespacharMovil.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	else
    	{
    		$("#dialog").load("formDespachar.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	
        $("#dialog").dialog("open");

    }
    function realizaTERMINAR(idorden, orden,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Terminar Trabajo";
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
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
 	        			var bandvalida = true;
 	        			var parmarca = $("#marca").val();
 	        			if(parmarca==""){$("#sec-marca").addClass("has-error"); bandvalida=false;}else{$("#sec-marca").removeClass("has-error");}
 	        			var parserie = $("#serie").val();  
//  	        			if(parserie==""){$("#sec-serie").addClass("has-error"); bandvalida=false;}else{$("#sec-serie").removeClass("has-error");}
 	        			var parmodelo = $("#modelo").val();  
//  	        			if(parmodelo==""){$("#sec-modelo").addClass("has-error"); bandvalida=false;}else{$("#sec-modelo").removeClass("has-error");}
 	        			var parvoltaje = $("#voltaje").val();  
 	        			if(parvoltaje==""){$("#sec-parvoltaje").addClass("has-error"); bandvalida=false;}else{$("#sec-parvoltaje").removeClass("has-error");}
 	        			var paramperes = $("#amperes").val(); 
 	        			if(paramperes==""){$("#sec-amperes").addClass("has-error"); bandvalida=false;}else{$("#sec-amperes").removeClass("has-error");}
//  	        			var parrazonserv = $("#razonserv").val();  
 	        			var parservreal = $("#servreal option:selected").text();
 	        			if(parservreal=="Seleccionar..."){$("#sec-servreal").addClass("has-error"); bandvalida=false;}else{$("#sec-servreal").removeClass("has-error");}
 	        			var bandservreal = "";
 	        			if(parservreal=="OTRO")
 	        			{
 	        				bandservreal ="S";
 	        				parservreal=$("#otroServicioReal").val();  
 	        				if(servreal==""){$("#sec-otroServicioReal").addClass("has-error"); bandvalida=false;}else{$("#sec-otroServicioReal").removeClass("has-error");}
 	        			}
 	        			var parcomentarios = $("#comentarios").val();  
 	        			if(parcomentarios==""){$("#sec-comentarios").addClass("has-error"); bandvalida=false;}else{$("#sec-comentarios").removeClass("has-error");}
				var tipoMtto = $("#frmtipomantenimiento").val() || "";
				var parcon1 = $("#cond1").val();
				var parcon2 = $("#cond2").val();
				var partempopera = $("#tempopera").val();
				var parvoltaje2 = $("#voltaje2").val();
				var paramperes2 = $("#amperes2").val();
				var partenicoserv = $("#tenicoserv").val();
//				if(partenicoserv==""){$("#sec-tenicoserv").addClass("has-error"); bandvalida=false;}else{$("#sec-tenicoserv").removeClass("has-error");}

				if(tipoMtto.toUpperCase() !== "PREVENTIVO"){
					if(parcon1==""){$("#sec-cond1").addClass("has-error"); bandvalida=false;}else{$("#sec-cond1").removeClass("has-error");}
					if(parcon2==""){$("#sec-cond2").addClass("has-error"); bandvalida=false;}else{$("#sec-cond2").removeClass("has-error");}
					if(partempopera==""){$("#sec-tempopera").addClass("has-error"); bandvalida=false;}else{$("#sec-tempopera").removeClass("has-error");}
					if(parvoltaje2==""){$("#sec-voltaje2").addClass("has-error"); bandvalida=false;}else{$("#sec-voltaje2").removeClass("has-error");}
					if(paramperes2==""){$("#sec-amperes2").addClass("has-error"); bandvalida=false;}else{$("#sec-amperes2").removeClass("has-error");}
				}else{
					$("#sec-cond1, #sec-cond2, #sec-tempopera, #sec-voltaje2, #sec-amperes2").removeClass("has-error");
				}

				var parnombreequipo =$("#nombreequipo option:selected").text();
				if(parnombreequipo=="Seleccionar..."){$("#sec-nombreequipo").addClass("has-error"); bandvalida=false;}else{$("#sec-nombreequipo").removeClass("has-error");}
				var bandEquipo ="";
				if(parnombreequipo=="OTRO")
				{
				bandEquipo= "S";
				parnombreequipo =$("#otroNombreEquipo").val();
				if(parnombreequipo==""){$("#sec-otroNombreEquipo").addClass("has-error"); bandvalida=false;}else{$("#sec-otroNombreEquipo").removeClass("has-error");}
				}
				var parservterminado = $('input[name=servterminado]:checked').val();
				var partempounidad = $('input[name=tempounidad]:checked').val();
				if(tipoMtto.toUpperCase() !== "PREVENTIVO" && partempounidad==undefined){$("#sec-otroNombreEquipo").addClass("has-error"); bandvalida=false;}else{$("#sec-otroNombreEquipo").removeClass("has-error");}
				if(parservterminado==undefined){parservterminado=""}
 	        			var param = "accion=TERMINAR";
 	        			param += "&orden="+escape(idorden)+"&marca="+escape(parmarca)+"&serie="+escape(parserie)+"&modelo="+escape(parmodelo)+"&voltaje="+escape(parvoltaje)+"&amperes="+escape(paramperes)+"&servreal="+escape(parservreal)+"&comentarios="+escape(parcomentarios);
 	        			param += "&cond1="+escape(parcon1)+"&cond2="+escape(parcon2)+"&tempopera="+escape(partempopera)+"&voltaje2="+escape(parvoltaje2)+"&amperes2="+escape(paramperes2)+"&tenicoserv="+escape(partenicoserv)+"&servterminado="+escape(parservterminado)+"&usuario=<%=usuario%>&nombreequipo="+escape(parnombreequipo)+"&tempounidad="+partempounidad+"&bandservreal="+bandservreal+"&bandEquipo="+bandEquipo+"&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
//  	        			alert(param);
 	        			if(bandvalida)
 	        			{
//  	        			$("#dialog").mLoading("show");
 	        			$("#container").mLoading("show");
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Trabajo Terminado!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" ); 
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
 												if(item.resp=="ERRORCANT")
 	 											{
 													swal("Se debe solicitar cerrar el trabajo sin facturas!", "", "error");
 	 											}
 												else
 												{
 													
 													swal("Error al Terminar Trabajo!", "", "error");
 												}
//  												$("#dialog").mLoading("hide");
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
 	        			}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar!", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	if(w<800)
    	{
    		$("#dialog").load("formTerminarMovil.jsp?usuario=<%=usuario%>&accion=TERMINAR&idorden="+idorden+"&orden="+orden);
    	}
    	else
    	{
    		$("#dialog").load("formTerminar.jsp?usuario=<%=usuario%>&accion=TERMINAR&idorden="+idorden+"&orden="+orden);
    	}
        $("#dialog").dialog("open");

    }
    
    
    function realizaSUSPENDER(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Suspender Trabajo";
    		alto=h-150;
    		if(w<600)
    		{
    			alto=h;
    		}
    		else
    		{
    			alto = 400;
    		}

    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
						var param="accion=SUSPENDER";
						var parammotivo = $("#frmmotivo").val();
						var bandvalida = true;
						if(parammotivo==""){$("#sec-frmmotivo").addClass("has-error"); bandvalida=false;}else{$("#sec-frmmotivo").removeClass("has-error");}
 	        			param += "&orden="+escape(idorden)+"&motivo="+escape(parammotivo)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
 	        			if(bandvalida)
 	        			{
//  	        			$("#loadingfrmtec").mLoading();
 	        			$("#container").mLoading("show");
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 											if(item.resp=="OK")
 											{
 												$("#container").mLoading("hide");
 												swal({
 						            	    		title: "",  
 						            	    		text: "Trabajo Suspendido!.",   
 						                			type: "success",   
 						                			showCancelButton: false,   
 						                			confirmButtonColor: "#3a5a74",   
 						                			confirmButtonText: "Aceptar",   
 						                			closeOnConfirm: true }, 
 						                			function(){
 						                				cargaTareas();
 						                				//Borrar tarea del panel de Tareas
 						                				modaldialog.dialog( "close" ); 
 						                				
 						                        		}); 
 											}
//  												swal("Incidencia Capturada!", "", "success");
 												
 											
 											else
 											{
 												$("#container").mLoading("hide");
 												swal("Error al suspender Trabajo!", "", "error");
 											}
 	        					    		
 	        				 	    });
//  	        					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
 	        			}
 	        			else
 	        			{
 	        				swal("Faltan campos por llenar!", "", "error");
 	        			}
//  	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	if(w<800)
    	{
    		$("#dialog").load("formSuspenderMovil.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	else
    	{
    		$("#dialog").load("formSuspender.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	
        $("#dialog").dialog("open");

    }
    
    function realizaREANUDAR(idorden,ordenserv, sigestatus,actualestatus,idaccion)
    {
    	swal({
	    		title: "",  
	    		text: "¿Desea reanudar el trabajo "+ordenserv+"?",     
  			type: "info",   
  			showCancelButton: true,   
  			cancelButtonText: "Cancelar",
  			confirmButtonColor: "#3a5a74",   
  			confirmButtonText: "Aceptar",   
  			closeOnConfirm: false }, 
  			function(){
  				var param="accion=REANUDAR";
		
     			param += "&orden="+escape(idorden)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
     		
     			$("#loadingfrmtec").mLoading();
     			
     			$.ajax({
     				url: '../GestionaTarea?'+param,
     				type: "GET",
     				cache: false,
     				
     				success: function( resp ) {
     					datosjson = $.parseJSON(resp);
     					 
     					if(datosjson.length>0)
     					{
     					
     					    $.each(datosjson, function(i, item)
     					    {
     					    	
										if(item.resp=="OK")
										{
											swal({
					            	    		title: "",  
					            	    		text: "Trabajo Reanudado!.",   
					                			type: "success",   
					                			showCancelButton: false,   
					                			confirmButtonColor: "#3a5a74",   
					                			confirmButtonText: "Aceptar",   
					                			closeOnConfirm: true }, 
					                			function(){
					                				cargaTareas();
					                				//Borrar tarea del panel de Tareas
// 					                				modaldialog.dialog( "close" ); 
					                				
					                        		}); 
										}
//											swal("Incidencia Capturada!", "", "success");
											
										
										else
										{
											swal("Error al reanudar Trabajo!", "", "error");
										}
     					    		
     				 	    });
//      					modaldialog.dialog( "close" ); 
     				}
     				}
     		  });
          	
  			});
    }
    
    function realizaCERRAR(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	swal({
	    		title: "",  
	    		text: "¿Desea cerrar el trabajo "+ordenserv+"?",     
  			type: "info",   
  			showCancelButton: true,   
  			cancelButtonText: "Cancelar",
  			confirmButtonColor: "#3a5a74",   
  			confirmButtonText: "Aceptar",   
  			closeOnConfirm: false }, 
  			function(){
  			
  				var param="accion=CERRAR";
  				
     			param += "&orden="+escape(idorden)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
     		
     			$("#loadingfrmtec").mLoading();
     			
     			$.ajax({
     				url: '../GestionaTarea?'+param,
     				type: "GET",
     				cache: false,
     				
     				success: function( resp ) {
     					datosjson = $.parseJSON(resp);
     					 
     					if(datosjson.length>0)
     					{
     					
     					    $.each(datosjson, function(i, item)
     					    {
     					    	
										if(item.resp=="OK")
										{
											swal({
					            	    		title: "",  
					            	    		text: "Trabajo Cerrado!.",   
					                			type: "success",   
					                			showCancelButton: false,   
					                			confirmButtonColor: "#3a5a74",   
					                			confirmButtonText: "Aceptar",   
					                			closeOnConfirm: true }, 
					                			function(){
					                				cargaTareas();
					                				//Borrar tarea del panel de Tareas
// 					                				modaldialog.dialog( "close" ); 
					                				
					                        		}); 
										}
//											swal("Incidencia Capturada!", "", "success");
											
										
										else
										{
											swal("Error al cerrar Trabajo!", "", "error");
										}
     					    		
     				 	    });
//      					modaldialog.dialog( "close" ); 
     				}
     				}
     		  });
          	
  			});
    }
    
    //Funcion Agregada por Jorge Gomez para Eliminar Ordenes de Servicio
    function realizaELIMINAR(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	swal({
	    		title: "",  
	    		text: "¿Desea eliminar el trabajo "+ordenserv+"?",     
  			type: "info",   
  			showCancelButton: true,   
  			cancelButtonText: "Eliminar",
  			confirmButtonColor: "#3a5a74",   
  			confirmButtonText: "Aceptar",   
  			closeOnConfirm: false }, 
  			function(){
  			
  				var param="accion=ELIMINAR";
  				
     			param += "&orden="+escape(idorden)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
     		
     			$("#loadingfrmtec").mLoading();
     			
     			$.ajax({
     				url: '../GestionaTarea?'+param,
     				type: "GET",
     				cache: false,
     				
     				success: function( resp ) {
     					datosjson = $.parseJSON(resp);
     					 
     					if(datosjson.length>0)
     					{
     					
     					    $.each(datosjson, function(i, item)
     					    {
     					    	
										if(item.resp=="OK")
										{
											swal({
					            	    		title: "",  
					            	    		text: "Trabajo Eliminado!.",   
					                			type: "success",   
					                			showCancelButton: false,   
					                			confirmButtonColor: "#3a5a74",   
					                			confirmButtonText: "Aceptar",   
					                			closeOnConfirm: true }, 
					                			function(){
					                				cargaTareas();
					                				//Borrar tarea del panel de Tareas
// 					                				modaldialog.dialog( "close" ); 
					                				
					                        		}); 
										}
//											swal("Incidencia Capturada!", "", "success");
											
										
										else
										{
											swal("Error al eliminar Trabajo!", "", "error");
										}
     					    		
     				 	    });
//      					modaldialog.dialog( "close" ); 
     				}
     				}
     		  });
          	
  			});
    }
    
    function realizaAUTORIZA(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
//     	realizaASIGNAR(idorden,ordenserv);
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Autoriza Terminar Tranajo sin Factura";
    		if(w<600)
    		{
    			alto=h;
    		}
    		else
    		{
    			alto = 500;
    		}

    	var modaldialog = $("#dialog").dialog({
 	        autoOpen: false,
 	        modal: true,
 	        title: tituloform,
 	        width: w-30,
 	        height: alto,

 	        buttons: 
 	        [ 
 	        	{ id:"aceptarform","data-test":"data test", 
 	        		text: "Aceptar", 
 	        		click:    function() {
//  	        			alert($("#autorizarCierre:checked").val());
 	        			if($("#autorizarCierre:checkbox:checked").val())
 	        			{
 	        				$("#container").mLoading("show");
 	     				var param="accion=AUTORIZASINFACT";
 	     				
 	        			param += "&orden="+escape(idorden)+"&usuario=<%=usuario%>&estatus="+sigestatus+"&actualestatus="+actualestatus+"&idaccion="+idaccion;
 	        		
 	        			$("#dialog").mLoading();
 	        			
 	        			$.ajax({
 	        				url: '../GestionaTarea?'+param,
 	        				type: "GET",
 	        				cache: false,
 	        				
 	        				success: function( resp ) {
 	        					datosjson = $.parseJSON(resp);
 	        					 
 	        					if(datosjson.length>0)
 	        					{
 	        					
 	        					    $.each(datosjson, function(i, item)
 	        					    {
 	        					    	
 	   										if(item.resp=="OK")
 	   										{
 	   										$("#container").mLoading("hide");
 	   											swal({
 	   					            	    		title: "",  
 	   					            	    		text: "El trabajo ya puede ser terminado!.",   
 	   					                			type: "success",   
 	   					                			showCancelButton: false,   
 	   					                			confirmButtonColor: "#3a5a74",   
 	   					                			confirmButtonText: "Aceptar",   
 	   					                			closeOnConfirm: true }, 
 	   					                			function(){
 	   					                				modaldialog.dialog( "close" ); 
 	   					                				cargaTareas();
 	   					                				//Borrar tarea del panel de Tareas
// 	    					                				modaldialog.dialog( "close" ); 
 	   					                				
 	   					                        		}); 
 	   										}
// 	   											swal("Incidencia Capturada!", "", "success");
 	   											
 	   										
 	   										else
 	   										{
 	   										$("#container").mLoading("hide");
 	   											swal("Error al autorizar terminar el trabajo!", "", "error");
 	   										}
 	        					    		
 	        				 	    });
// 	         					modaldialog.dialog( "close" ); 
 	        				}
 	        				}
 	        		  });
 	        			}
 	        			else
 	        			{
 	        				swal("", "Debe seleccionar la confirmación para autorizar!", "error");
 	        			}
 	        			
 	        			},
 	        		class: "btn btn-defaulf"
 	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	if(w<800)
    	{
    		$("#dialog").load("formAutorizaSinFactMovil.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	else
    	{
    		$("#dialog").load("formAutorizaSinFact.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	
        $("#dialog").dialog("open");
    }
    
    function realizaDETALLE(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Detalle de Orden: "+ordenserv;
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
//  	        	{ id:"aceptarform","data-test":"data test", 
//  	        		text: "Aceptar", 
//  	        		click:    function() {
//  	        			$( this ).dialog( "close" ); 
 	        			
//  	        			},
//  	        		class: "btn btn-defaulf"
//  	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	
    	if(w<800)
    	{
    		$("#dialog").load("detalleMovil.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	else
    	{
    		$("#dialog").load("detalle.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	
    	
        $("#dialog").dialog("open");
        $("#reporte").click();
    }
    
    function eliminarfactura(idfactura, foliofactura, proveedor)
    {
    	swal({
	    		title: "",  
	    		text: "¿Desea eliminar la factura \""+foliofactura+"\" del proveedor \""+proveedor+"\"?",     
  			type: "info",   
  			showCancelButton: true,   
  			cancelButtonText: "Cancelar",
  			confirmButtonColor: "#3a5a74",   
  			confirmButtonText: "Aceptar",   
  			closeOnConfirm: false }, 
  			function(){
  				param="accion=ELIMINARFACT&idfactura="+idfactura;
  		    	
  		    	$.ajax({
  						url: '../GestionaTarea?'+param,
  						type: "GET",
  						cache: false,
  						
  						success: function( resp ) {
  							datosjson = $.parseJSON(resp);
  							 
  							if(datosjson.length>0)
  							{
  							
  							    $.each(datosjson, function(i, item)
  							    {
  							    		swal("Factura Eliminada!", "", "success");
  										if(item.resp=="OK")
  										{
  											consultaFacturas("C");
  										}
 											
  											
  										
  										else
  										{
  											swal("Error al eliminar la factura!", "", "error");
  										}
  							    		
  						 	    });
//  							modaldialog.dialog( "close" ); 
  						}
  						}
  				  });
          	
  			});
    	
    }
    
    function realizaCAPTURA(idorden,ordenserv,sigestatus,actualestatus,idaccion)
    {
    	$("#container").mLoading("show");
    	var w = window.innerWidth;
    	var h = window.innerHeight;
    	var tituloform = "";
    	var alto = 0;

    		tituloform = "Detalle de Orden: "+ordenserv;
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
//  	        	{ id:"aceptarform","data-test":"data test", 
//  	        		text: "Aceptar", 
//  	        		click:    function() {
//  	        			$( this ).dialog( "close" ); 
 	        			
//  	        			},
//  	        		class: "btn btn-defaulf"
//  	        	},
 	        	{ id:"cancelarform","data-test":"data test", 
 	        		text: "Cancelar", 
 	        		click:    function() {
//  	        			alert($('#cancelarform').data('test')); 
 	        			$( this ).dialog( "close" ); 
 	        			},
 	        		class: "btn btn-defaulf"
 	        	}
 	        ]
 	        
 	    });
    	
    	if(w<800)
    	{
    		$("#dialog").load("detalleMovil.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	else
    	{
    		$("#dialog").load("detalle.jsp?orden="+escape(ordenserv)+"&idorden="+escape(idorden));
    	}
    	
    	
        $("#dialog").dialog("open");
        $("#reporte").click();
    }
    
    $(window).resize(function () {
//         if (jQuery(window).width() < 900) {
//             jQuery(".top-menu").css("display", "none");
            $("#dialog").dialog('option','width',jQuery(window).width());
            $("#dialog").dialog('option','height',jQuery(window).height());
//         }
	});
    
 </script>             