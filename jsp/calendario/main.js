/*****************************************************************************/
/***cuando carga doc. htm detona ejecuta todo lo adentro de la funcion $(function(){...*/
/*****************************************************************************/
$(function(){
	//extrae parametros enviados por url ?
	  var urlParam = function(name, w){
		    w = w || window;
		    var rx = new RegExp('[\&|\?]'+name+'=([^\&\#]+)'),
		        val = w.location.search.match(rx);
		    return !val ? '':val[1];
		}
	  
	  var year = urlParam("year");
	  var mes = urlParam("mes");  
	  var empresa = urlParam("empresa");
	//despliega los años en select del año actual hasta el 2020
	  for (i = new Date().getFullYear(); i <= 2020; i++){ 
	      $('#yearpicker').append($('<option />').val(i).html(i));
	  }  
	  if(year=="" || year== null || mes=="" || mes== null || empresa=="" || empresa == null){//NOOO! trae datos de la url parametros ?
		
		  var dt = new Date();	  
		   year = dt.getFullYear();
		  $("#yearpicker").val(year);
		   mes = dt.getMonth()+1;
		  if(mes<10){mes='0'+mes} // combierte la fecha en 2  digitos
		  $("#mes").val(mes);	  	  		 
		  empresa = "06"; // empresa amarrada
		  $("#empresa").val(empresa);
		  calendarioCitas(empresa,year,mes);
	  }
	  
	  else{//trae datos de la url parametros ?
		//obtiene parametro empresa de url calendario.html?empresa=06
		  var empresa = urlParam("empresa");
		  $("#empresa").val(empresa);
		  //obtiene parametro año de url calendario.html?year=2017
		  var year = urlParam("year");
		//obtiene parametro mes de url calendario.html?year=2017&mes=08
		  var mes = urlParam("mes");   
		 // manda llamar  funcion calendario citas 
		  calendarioCitas(empresa,year,mes); 
		  //agrega mes a select
		$("#mes").val(mes);  
		  //agrega año a select
		  $("#yearpicker").val(year);  
		  }
});

/*****************************************************************************/
/*** boton consultar nuevos filtros calendario boton consultar nuevos filt...*/
/*****************************************************************************/
$("#BtnConsultar").click(function(){

	//etiqueta para mostrar que empresa esta seleccionada, en tags
	$("#copeSeleccionado").html("Cope: "+$("#copeCalendar option:selected").text())
	//importante cambiar la ip de localhost:9080 a la de rcdt 10.254.8.156  cuando se va a subir a la rcdt
	var url ="calendario.html?year="+$("#yearpicker").val()+"&mes="+$("#mes").val()+"&empresa="+$("#empresa").val()+""; 
	window.location.href = url;  
});   


/*****************************************************************************/
/*****Despliega el calendario Despliega el calendario Despliega el calendario*/
/*****************************************************************************/
function calendario(array){
	var fecha = $("#yearpicker").val()+"-"+$("#mes").val(); // obtener año y mes para inicializar calendario con la fecha
	
	$(".fc-time").css("display","none");  //esconde hora
	$('#calendar').fullCalendar({
	    defaultDate: moment(fecha),    // inicializa calendario
	      header: {  
	        left: '',  
	        center: 'title',
	        right: ''
	      },  
	      events:array, // Se envia la lista de ordenesCitadas en formato JSON lista        
	      editable: false,  
	      droppable: false
	    });
	$(".fc-time").css("display","none"); // esconde hora
}
/*****************************************************************************/
/*****Obtener lista de etapas de ordenes citadas de la BASE DE DATOS ****** */
/*****************************************************************************/
function calendarioCitas(empresa,anio,Mes){
	$.ajax({
		url:"/PortalPIC10Web/PicController",// Llamado al controlador JAVA
		type:"POST",
		data:{calendarioCitas:"si",clvEmpresa:empresa,year:anio,mes:Mes},
		success:function(data){
			var array=[];
					data = JSON.parse(data); //convercion (CAST) de estring a JSON
					$.each(data["OrdenesCitadas"],function(key,value){ //Recorre ordenes de cita de la BD
						var OrdenesCitadas = {}; //Inicializa objeto JSON OrdenesCitadas
		//				var array= [{  		
		//			        title: 'Pendiente: '+totalPendiente,
		//			        start: new Date("2017","07","05"),  
		//			        backgroundColor: "#f56954", //red
		//			        borderColor: "#f56954" //red
		//			      }]; 
						// Diferenciar color por estatus
						var color="#f56954";			
						if(value["estatus"]== "DESPACHADA"){
							color = "#337ab7";
						}else if(value["estatus"]== "ASIGNADA"){
							color = "#25a521";
						} 						
						// Crea Parametros que ocupa Calendario por día
						OrdenesCitadas.title= value["estatus"]+": "+ value["total"]; // estatus , pendiente, despachada, asignada
						var fecha = value["fecha"].split("/"); // separa fecha por  / para tomarel valor
				        var mes=parseInt(fecha[1]) - 1; // al parametro mes le resta uno, para cuadrar  mes po que  javas. inicia en 0 = Enero, 1= febrero etc y en BD inicia en 1=enero, 2 = febrero etc
				        var dia=fecha[0];  // valor del día
						OrdenesCitadas.start = new Date (anio,mes,dia); // start dia en que pintara los valores de la BD
						OrdenesCitadas.backgroundColor = color; 
						OrdenesCitadas.borderColor = color; 
						
						array.push(OrdenesCitadas); //agrega ordenesCitas (JSON) al array
					});	
			calendario(array); //llama funcion calendario y toma los valores del array para pintar calendario
		},
		error : function (Error){
			//alert("data"+Error);
			console.error(Error);
		} 
	});	
}
/*****************************************************************************/
/*****Obtener empresas de la BASE DE DATOS ****** */
/*****************************************************************************/
//function obtenerempresa(usuario){
//	$.ajax({
//		url:"/PortalPIC10Web/PicController",// Llamado al controlador JAVA
//		type:"POST",
//		data:{obtenerempresa:"si",clvEmpresa:empresa,year:anio,mes:Mes},
//		success:function(data){
//			var array=[];
//					data = JSON.parse(data); //convercion (CAST) de estring a JSON
//					$.each(data["Usuarof"],function(key,value){ //Recorre ordenes de cita de la BD
//						var Usuarof = {}; //Inicializa objeto JSON Usuarof
//		//				var array= [{  		
//		//			        title: 'Pendiente: '+totalPendiente,
//		//			        start: new Date("2017","07","05"),  
//		//			        backgroundColor: "#f56954", //red
//		//			        borderColor: "#f56954" //red
//		//			      }]; 
//						// Diferenciar color por estatus
//						var color="#f56954";			
//						if(value["estatus"]== "DESPACHADA"){
//							color = "#337ab7";
//						}else if(value["estatus"]== "ASIGNADA"){
//							color = "#25a521";
//						} 						
//						// Crea Parametros que ocupa Calendario por día
//						Usuarof.title= value["estatus"]+": "+ value["total"]; // estatus , pendiente, despachada, asignada
//						var fecha = value["fecha"].split("/"); // separa fecha por  / para tomarel valor
//				        var mes=parseInt(fecha[1]) - 1; // al parametro mes le resta uno, para cuadrar  mes po que  javas. inicia en 0 = Enero, 1= febrero etc y en BD inicia en 1=enero, 2 = febrero etc
//				        var dia=fecha[0];  // valor del día
//						Usuarof.start = new Date (anio,mes,dia); // start dia en que pintara los valores de la BD
//						Usuarof.backgroundColor = color; 
//						Usuarof.borderColor = color; 
//						
//						array.push(Usuarof); //agrega ordenesCitas (JSON) al array
//					});	
//			calendario(array); //llama funcion calendario y toma los valores del array para pintar calendario
//		},
//		error : function (Error){
//			//alert("data"+Error);
//			console.error(Error);
//		} 
//	});
//}

