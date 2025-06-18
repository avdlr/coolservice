$(function(){   
if(localStorage.getItem("tareas") != null){
	
	var data = localStorage.getItem("tareas");
		data = JSON.parse(data); 
	 
	$.each(data,function(key,value){//active
		$("#tasck").append('<div id="'+value["folioPisa"]+''+value["tipoTarea"]+'" class="resumenTarea '+value["tipoTarea"]+'  list-group-item">  <div onclick="detalleTarea(\''+value["folioPisa"]+'\',\''+value["tipoTarea"]+'\')" > <label class="list-group-item-heading">   Folio Plex:  <strong class="label label-default lbl'+value["tipoTarea"]+' "> '+value["folioPLEX"]+'</strong>  <i class="glyphicon glyphicon-remove-sign  elem-derecha" onclick="borrarTarea(\''+value["folioPisa"]+'\',\''+value["tipoTarea"]+'\')"></i> <hr> Folio Pisa: '+value["folioPisa"]+' Tel.: '+value["telefono"]+' </label></div> </div>');
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
	           
}             

function borrarTarea(folioPisa,tipoTarea){
	     
	folios(folioPisa,"borrar","",tipoTarea);    
	panelDeTareasADM(tipoTarea,"borrar","",folioPisa,"","");
}    
/*******************************************************************************************************************/
/***************adminstra resumenes de tarea tanto como borrado de los mismo ******* *******************************/
/*******************************************************************************************************************/
function panelDeTareasADM(tipoTarea,evento,folioPlex,folioPisa,telefono,url){
	var bandera=0;
	if(evento==="actualizar"){
		// Valida si existe la orden en el panel de tareas
		var folioExiste= folios(folioPisa,"validacion",url,tipoTarea);
		if(folioExiste){
			bandera++;
			var data = {folioPISA:folioPisa,tipoTAREA:tipoTarea};
			localStorage.setItem("focusExistente",JSON.stringify(data));
		}
	}else
	{
		if(evento === "agregar"){
				//verifica si existe la tarea en la lista
				var folioExiste= folios(folioPisa,"validacion",url,tipoTarea);
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
							data.push(tareas);
							localStorage.setItem("tareas",JSON.stringify(data));
							}else{//primera tarea
									var listaTareas=[];
									var tareas={};  
									tareas.folioPLEX=folioPlex;  
									tareas.folioPisa=folioPisa;
									tareas.telefono=telefono;
									tareas.tipoTarea=tipoTarea;  
									listaTareas.push(tareas);   
									localStorage.setItem("tareas",JSON.stringify(listaTareas));  
							}     
							
				}else{
					var data = {folioPISA:folioPisa,tipoTAREA:tipoTarea};
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
	
	if(bandera > 0){
		window.open("panelTareas.html",'detalle','scrollbars=yes,resizable=yes,height='+screen.height +',width='+screen.width+',toolbar=yes,menubar=yes,location=yes');
	}else{
		if(evento != "actualizar"){
			window.open("panelTareas.html",'detalle','scrollbars=yes,resizable=yes,height='+screen.height +',width='+screen.width+',toolbar=yes,menubar=yes,location=yes').focus();
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
//} 
	
}  
/*******************************************************************************************************************/
/*************** ELIMINAR TAREAS DEL LOCAL STORAGE ELIMINAR TAREAS DEL LOCAL STORAGE *******************************/
/*******************************************************************************************************************/
$("#eliminarTareas").click(function(){
	localStorage.removeItem("tareas");
	localStorage.removeItem("folios");
	localStorage.removeItem("focusExistente");
	panelDeTareasADM("","f5","","","","");  
});     
/*******************************************************************************************************************/
/***************folios y url de las tareas a mostrar ******************************* *******************************/
/*******************************************************************************************************************/
function folios(folioPisa,evento,url,tipoTarea){   
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
		folios.push(folioUrls);  
		localStorage.setItem("folios",JSON.stringify(folios));  //folio nuevo
	
		return false;
	}
	
}
