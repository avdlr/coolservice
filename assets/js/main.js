var estadoDB;
var foliosEstadoDiferente=[];
localStorage.setItem("estadoDB","");
var existeCambio="";
localStorage.setItem("existeCambio","NO");
$(function(){   
if(localStorage.getItem("tareas") != null){
	
	var data = localStorage.getItem("tareas");
		data = JSON.parse(data); 
	 
	$.each(data,function(key,value){//active
		$("#tasck").append('<div id="'+value["folioPisa"]+''+value["tipoTarea"]+'" class="resumenTarea '+value["tipoTarea"]+'  list-group-item">  <div onclick="detalleTarea(\''+value["folioPisa"]+'\',\''+value["tipoTarea"]+'\')" > <label class="list-group-item-heading">   Folio Plex:  <strong class="label label-default lbl'+value["tipoTarea"]+' "> '+value["folioPLEX"]+'</strong> <i style="padding-left:10px" class="glyphicon glyphicon-remove-sign  elem-derecha" onclick="borrarTarea(\''+value["folioPisa"]+'\',\''+value["tipoTarea"]+'\',\''+value["estado"]+'\')"></i><i id="icon_'+value["folioPisa"]+''+value["tipoTarea"]+'" class="glyphicon glyphicon-refresh  elem-derecha" style="display:none" onclick="actualizarTarea(\''+value["folioPisa"]+'\',\''+value["tipoTarea"]+'\')"></i> <hr> Folio Pisa: '+value["folioPisa"]+' Tel.: '+value["telefono"]+' </label></div> </div>');
	});      
	if(localStorage.getItem("focusExistente") === null){
		var ultimaTarea = data[data.length-1];
		detalleTarea(ultimaTarea["folioPisa"],ultimaTarea["tipoTarea"]); 
	}else{
	var data	= localStorage.getItem("focusExistente");
	data = JSON.parse(data);
		detalleTarea(data["folioPISA"],data["tipoTAREA"]); 
		localStorage.removeItem("focusExistente");
	}
}                    
	  
});

function detalleTarea(folioPisa,tipoTarea){
	var data = localStorage.getItem("folios");
	data = JSON.parse(data);    
	data = data.filter(function(item) { 
		 return item["folio"] === folioPisa && item["tipoTarea"] === tipoTarea;  
		});      

	//folio y url  
	 $("title").html("Tareas PIC | folio Pisa: "+folioPisa+"");
	 $("#pantalla").attr("data",data[0]["url"]);
		/******  
		 * Agregar bandera resumen seleccionado
		 * *********/
		//remove class old selected add new selected
			if($("#tasck .active").attr("id")){ $("#"+$("#tasck .active").attr("id")).removeClass("active");}
			var idResumenDetalle= "#"+folioPisa+tipoTarea;
			$(idResumenDetalle).addClass("active"); //.css("background-color","#6f4040")    
	        
			if(foliosEstadoDiferente.length > 0 )
			{
				actualizarTarea(folioPisa, tipoTarea);							
			}			
}             

function borrarTarea(folioPisa,tipoTarea,estado){
	//alert("borrarTarea-------> antes de folios");
	folios(folioPisa,"borrar","",tipoTarea,estado);
	//alert("borrarTarea-------> panelDeTareasADM");
	panelDeTareasADM(tipoTarea,"borrar","",folioPisa,"","","");
	//alert("Fin de borrar Tarea");
}    
/*******************************************************************************************************************/
/***************adminstra resumenes de tarea tanto como borrado de los mismo ******* *******************************/
/*******************************************************************************************************************/
function panelDeTareasADM(tipoTarea,evento,folioPlex,folioPisa,telefono,estado,url){
	var bandera=0;
	if(evento==="actualizar"){
		// Valida si existe la orden en el panel de tareas
		var folioExiste= folios(folioPisa,"validacion",url,tipoTarea,estado);
		if(folioExiste){
			bandera++;
			var data = {folioPISA:folioPisa,tipoTAREA:tipoTarea,estado:estado};
			localStorage.setItem("focusExistente",JSON.stringify(data));
		}
	}else
	{
		if(evento === "agregar"){
				//verifica si existe la tarea en la lista
				var folioExiste= folios(folioPisa,"validacion",url,tipoTarea,estado);
				//agregar
				if(!folioExiste){// false si no existe entra
							//add task
							if(localStorage.getItem("tareas") != null){
							var data	=  localStorage.getItem("tareas");
							data = JSON.parse(data);
							var tareas={};
							tareas.folioPLEX=folioPlex;
							tareas.folioPisa=folioPisa;
							tareas.telefono=telefono;
							tareas.tipoTarea=tipoTarea;
							tareas.estado=estado;
							data.push(tareas);
							localStorage.setItem("tareas",JSON.stringify(data));
							}else{//primera tarea
									var listaTareas=[];
									var tareas={};  
									tareas.folioPLEX=folioPlex;  
									tareas.folioPisa=folioPisa;
									tareas.telefono=telefono;
									tareas.tipoTarea=tipoTarea;
									tareas.estado=estado;
									listaTareas.push(tareas);   
									localStorage.setItem("tareas",JSON.stringify(listaTareas));  
							}     
							
				}else{
					var data = {folioPISA:folioPisa,tipoTAREA:tipoTarea,estado:estado};
				localStorage.setItem("focusExistente",JSON.stringify(data));	
				}
		}else if(evento === "borrar"){
			if(localStorage.getItem("tareas") != null){
				//remueve resumen tarea -folio
				var data = localStorage.getItem("tareas");
				
				 data = JSON.parse(data);
				 data = data.filter(function(item) {   
					
					 if(item["folioPisa"] === folioPisa){
						return item["tipoTarea"] !== tipoTarea;  
					 }else{
						 return item;
					 }   
					
					});              

				 localStorage.setItem("tareas",JSON.stringify(data));
				 
				 
					 //no hay datos es decir tareas se eliminaron todas 
				// JSON.stringify(data+"---tamaño:"+data.length)
				 if(data.length === 0){$("#eliminarTareas").click();  window.close();}
			   
			}                 
		}
	}
	//alert("--------> Bandera: " + bandera + " evento: " + evento);
	
	if(bandera > 0){
		window.open("panelTareas.html",'detalle','scrollbars=yes,resizable=yes,height='+screen.height +',width='+screen.width+',toolbar=yes,menubar=yes,location=yes');
	}else{
		if(evento != "actualizar"){
			/*if(evento=="borrar"){
				panelDeTareasADM("","f5","","","","","");
			}else{*/
				window.open("panelTareas.html",'detalle','scrollbars=yes,resizable=yes,height='+screen.height +',width='+screen.width+',toolbar=yes,menubar=yes,location=yes').focus();
			//}
		}
	}

      
//var isOpen = "false";
//var newwindow=null;      
//function call() {  
//    var link =document.getElementById('link').getAttribute('href');
//    if (isOpen == "false") {
//    	alert("nuevo")
//        isOpen = "true"; 
//        window.open(link,'detalle','scrollbars=yes,resizable=yes');
//    } else {
//    	alert("existe")
//        newwindow.location.href = url;
//     // resize the window by passed w,h parameter
//        newwindow.focus();
//    }
//
//} 633  621
//	8446 8288
	
}  
/*******************************************************************************************************************/
/*************** ELIMINAR TAREAS DEL LOCAL STORAGE ELIMINAR TAREAS DEL LOCAL STORAGE *******************************/
/*******************************************************************************************************************/
$("#eliminarTareas").click(function(){
	localStorage.removeItem("tareas");
	localStorage.removeItem("folios");
	localStorage.removeItem("focusExistente");
	panelDeTareasADM("","f5","","","","","");  
});     
/*******************************************************************************************************************/
/*************** VALIDAR ESTATUS DE TAREAS DEL LOCAL STORAGE VS LA BASE DE DATOS  **********************************/
$("#validarEstatusTareas").click(function(){
	
	callAPI_validation("");
});

/***************folios y url de las tareas a mostrar ******************************* *******************************/
/*******************************************************************************************************************/
function folios(folioPisa,evento,url,tipoTarea,estado){   
 //console.log("folioPisa: "+folioPisa+" evento: "+evento+" Tipo tarea: "+tipoTarea)
	if(localStorage.getItem("folios") != null){
		var data = localStorage.getItem("folios");      
  
		data = JSON.parse(data);
		existe = data.filter(function(item) { 
			 return item["folio"] === folioPisa && item["tipoTarea"] === tipoTarea;  
			});            
		
		  if(existe.length > 0){// existe    
			  if(evento === "validacion"){  
				  	return true;  
				}else if(evento === "borrar"){
					
					  data = data.filter(function(item){ 
						    //if(item["folio"] !== folioPisa && item["tipoTarea"] !== tipoTarea){alert( item["folio"] +folioPisa +"----"+item["tipoTarea"] + tipoTarea );}
						 
						  if(item["folio"] === folioPisa){//folios iiguales pero tipo tarea diferente
							  //validar tipo tarea si son iguales se elimina
							 return  item["tipoTarea"] != tipoTarea
						  }else{//folios diferentes 
							  
							  return item;
						  }

						});               
					
					//folios restantes    
					localStorage.setItem("folios",JSON.stringify(data)); 
				} 
			  }
			  else{//no existe
				  /**AGREGAR FOLIO A LISTA DE VALIDACIONES FOLIOS ACTUALES EN PANTALLA DETALLES TAREAS**/
				  //no existe el folio agrega 
				//  data.push(folioPisa);
				  var folioUrls={};
				  folioUrls.folio=folioPisa;
				  folioUrls.url=url;
				  folioUrls.tipoTarea=tipoTarea;
				  folioUrls.estado=estado;
				  data.push(folioUrls);
				  localStorage.setItem("folios",JSON.stringify(data)); //nuevo folios
				  
				
				  return false;  
			  }
	}else{//entra por primera vez  
		var folios=[];
		var folioUrls={};
		folioUrls.folio=folioPisa;
		folioUrls.url=url;      
		folioUrls.tipoTarea=tipoTarea;
		folioUrls.estado=estado;
		folios.push(folioUrls);  
		localStorage.setItem("folios",JSON.stringify(folios));  //folio nuevo
	
		return false;
	}
	
}

function callAPI_validation(evento){
	var datosjson = null;
	if(localStorage.getItem("tareas") != null){ 
	var data_tareas = localStorage.getItem("tareas");      
	val_tareas = JSON.parse(data_tareas);
	// Recorre la lista de tareas para buscar posible cambio de estado en la bd con respecto al localStorage
	$.each(val_tareas, function(i, item) {
		var folioAvalidar = item["folioPisa"];
		var telefonoAvalidar = item["telefono"];
		var estadoAvalidar = item["estado"];
		var tipoTareaAvalidar = item["tipoTarea"];
		
		//llamado al servlet para validar estado de la tarea actual
		$.ajax({
			async : false,
			url: '/PortalPIC10Web/RestAPI_Operations?accion=validaEstatus',
			type: "POST",
			data:{
				accion: "validaEstatus",
				foliopisa:folioAvalidar,
				telefono:telefonoAvalidar,
				estado: estadoAvalidar
			},
			success: function( resp ) {
				datosjson = JSON.parse(resp);
				if(datosjson.mensaje == "OK"){	
					if(datosjson.estado == estadoAvalidar){
						// Si son iguales los estados se sigue ocultando el icono
						//$('#icon_'+folioAvalidar+'detalle').attr('style','display: none');
						$('#icon_'+folioAvalidar+tipoTareaAvalidar).attr('style','display: none');
						//$('#'+folioAvalidar+tipoTareaAvalidar).attr('style','background-color: #fff');
						
					}else{
						// Se agrega icono refresh y el background-color a tareas con diferente estado
						$('#icon_'+folioAvalidar+tipoTareaAvalidar).attr('style','display: block');
						$('#'+folioAvalidar+tipoTareaAvalidar).attr('style','background-color: #da7003');
						// Bandera de cambio de estado
						localStorage.setItem("existeCambio", "SI");
						// Se agregan las tareas con diferente estado a un array 
						if(foliosEstadoDiferente.length > 0 )
						{
							$.each(foliosEstadoDiferente,function(key,value){
								if(value["folioPISA"]==folioAvalidar && value["tipoTAREA"]==tipoTareaAvalidar){
									
								}else{
									var foliosrep={};
									foliosrep.folioPISA=folioAvalidar;
									foliosrep.tipoTAREA=tipoTareaAvalidar;
									foliosrep.estado=datosjson.estado;
									foliosEstadoDiferente.push(foliosrep);
								}
							});							
						}else{
							var foliosrep={};
							foliosrep.folioPISA=folioAvalidar;
							foliosrep.tipoTAREA=tipoTareaAvalidar;
							foliosrep.estado=datosjson.estado;
							foliosEstadoDiferente.push(foliosrep);  
						} 
						
					}
				}
				 
			}
		});
		
		
	  });
	}
	
	// De acuerdo a la bandera existeCambio se envia un mensaje de alerta al usuario
	if(evento != "borrar"){
		if(localStorage.getItem("tareas") != null){
			var respEstado= localStorage.getItem("existeCambio");
			if(respEstado=="NO"){
				swal("", "No se detectaron cambios de estado", "info");
			}else{
				swal("", "Hay tareas que cambiaron de estado", "info");
				localStorage.setItem("existeCambio", "NO");
			}
		}else{
			swal("", "No hay tareas para validar", "info");
		}
	}
}

function actualizarTarea(folioPisa, tipoTarea){
	//alert("Antes de actualizar tarea");
	var banAct="";
	if(localStorage.getItem("tareas") != null){
		$.each(foliosEstadoDiferente,function(key,value){
				if(value["folioPISA"] == folioPisa && value["tipoTAREA"] == tipoTarea){
					if (key > -1) {
						// Oculta icono refresh
						$('#icon_'+folioPisa+tipoTarea).attr('style','display: none');
						$('#'+folioPisa+tipoTarea).attr('style','');
						// Actualiza el item estado a localStorage
						var data = localStorage.getItem("tareas");
						 data = JSON.parse(data);
						 data = data.filter(function(item) {   
							 if(item["folioPisa"] == value["folioPISA"] && item["tipoTarea"] == value["tipoTAREA"]){
								 $.each(foliosEstadoDiferente,function(key,value){
									 if(value["folioPISA"] == item["folioPisa"] && value["tipoTAREA"] == item["tipoTarea"]){
										 item["estado"]=value["estado"];
										 banAct="OK";
									 } 
								 });
								 return item;
								
							 }else{
								  return item;
							  } 
							});              
						 localStorage.setItem("tareas",JSON.stringify(data));
						
						 // Elimina item seleccionado del array foliosEstadoDiferente
						foliosEstadoDiferente.splice(key, 1);
						
					}
				}
				if(banAct!="OK")
					return ;
		});
	}
}
