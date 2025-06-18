<%@page import="bean.GestionTareas"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
   Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="initial-scale=1.0, target-densitydpi=device-dpi" />
<meta name="viewport" content="width=device-width">
<meta name="viewport" content="initial-scale=1.0, width=device-height"><!--  mobile Safari, FireFox, Opera Mobile  -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<link href="../assets/css/sweetalert.css" rel="stylesheet">
 <link href="../assets/css/jquery.mloading.css" rel="stylesheet">
<script src="../libs/modernizr.js"></script>
<%
	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
	String orden = request.getParameter("orden") != null ? request.getParameter("orden"): "";
	GestionTareas llamado = new GestionTareas();
	String valida = llamado.validaFirma(orden);
%>
<!--[if lt IE 9]>
<script type="text/javascript" src="../libs/flashcanvas.js"></script>
<![endif]-->
<style type="text/css">

	div {
		margin-top:1px;
		margin-bottom:1em;
	}
/* 	input { */
/* 		padding: .5em; */
/* 		margin: .5em; */
/* 	} */
	select {
		padding: .5em;
		margin: .5em;
	}
	
	#signatureparent {
		color:black;
		background-color:white;
		/*max-width:600px;*/
		padding:20px;
	}
	
	/*This is the div within which the signature canvas is fitted*/
	#signature {
		border: 2px dotted black;
		background-color:white;
	}

	/* Drawing the 'gripper' for touch-enabled devices */ 
	html.touch #content {
		float:left;
		width:auto;
	}
	html.touch #scrollgrabber {
		float:right;
		width:4%;
		margin-right:2%;
		background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAFCAAAAACh79lDAAAAAXNSR0IArs4c6QAAABJJREFUCB1jmMmQxjCT4T/DfwAPLgOXlrt3IwAAAABJRU5ErkJggg==)
	}
	html.borderradius #scrollgrabber {
		border-radius: 1em;
	}
	 
</style>
</head>
<body>
<%if(valida.equals("")){ %>
<!-- <div><textarea id="cadena" style="width:100%;height:7em;display:inline-block;"></textarea></div> -->
<div id="firmadigital">
<div>
<div id="content" style="width: 100%;">
	<div id="signatureparent">
		<div id="signature"></div></div>
	<div id="tools"></div>
</div>
<!-- <div id="scrollgrabber"></div> -->
</div>
<div id="testdiv"></div>
<button style="margin-left: 25px;" class="btn btn-default" id="btnguardar"> Guardar</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button style="display:inline-block; margin-left: 5px;" id="reset" class="btn btn-default" type="button" >Reset</button>
<script src="../libs/jquery.js"></script>
<script src="../assets/js/sweetalert.min.js"></script>
<script src="../assets/css/jquery.mloading.js"></script>
<script type="text/javascript">
jQuery.noConflict()
</script>
<script>
(function($) {
	var topics = {};
	$.publish = function(topic, args) {
	    if (topics[topic]) {
	        var currentTopic = topics[topic],
	        args = args || {};
	
	        for (var i = 0, j = currentTopic.length; i < j; i++) {
	            currentTopic[i].call($, args);
	        }
	    }
	};
	$.subscribe = function(topic, callback) {
	    if (!topics[topic]) {
	        topics[topic] = [];
	    }
	    topics[topic].push(callback);
	    return {
	        "topic": topic,
	        "callback": callback
	    };
	};
	$.unsubscribe = function(handle) {
	    var topic = handle.topic;
	    if (topics[topic]) {
	        var currentTopic = topics[topic];
	
	        for (var i = 0, j = currentTopic.length; i < j; i++) {
	            if (currentTopic[i] === handle.callback) {
	                currentTopic.splice(i, 1);
	            }
	        }
	    }
	};
})(jQuery);

</script>
<script src="../libs/jSignature.min.noconflict.js"></script>
<script>
(function($){

$(document).ready(function() {
	
	// This is the part where jSignature is initialized.
	var $sigdiv = $("#signature").jSignature({'UndoButton':false})
	
	// All the code below is just code driving the demo. 
	, $tools = $('#tools')
	, $extraarea = $('#displayarea')
	, pubsubprefix = 'jSignature.demo.'

		$('#btnguardar').bind('click', function(e){
// 		if (e.target.value !== ''){
			$("#firmadigital").mLoading("show");
			var data = $sigdiv.jSignature('getData', 'image');
// 			var data = $sigdiv.jSignature('getData', 'image/png;base64')
			$.publish(pubsubprefix + 'formatchanged');

			$.publish(pubsubprefix +data);
			
// 			alert(data.join(','));
		
// 			$("#cadena").val(data);
// 			$("#testdiv").html(data);
			var parametros = {
 	        					"accion" : "FIRMAR",
 	        	                "orden" : escape('<%=orden%>'),
 	        	                "usuario" : '<%=usuario%>',
 	        	                "firma" : data[0]+","+data[1]
 	        	        }
			$.ajax({
 				url: '../GestionaTarea',
 				type: "POST",
 				data: parametros,
 				cache: false,
 				
 				success: function( resp ) {
 					
 					datosjson = $.parseJSON(resp);
 					 
 					if(datosjson.length>0)
 					{
 					
 					    $.each(datosjson, function(i, item)
 					    {
 					    	
									if(item.resp=="OK")
									{
										$("#firmadigital").mLoading("hide");
										swal({
				            	    		title: "",  
				            	    		text: "Firma Guardada!.",   
				                			type: "success",   
				                			showCancelButton: false,   
				                			confirmButtonColor: "#3a5a74",   
				                			confirmButtonText: "Aceptar",   
				                			closeOnConfirm: true }, 
				                			function(){
				                				window.opener.cargaTareas();
				                				window.close();
				                				
				                        		}); 
									}
//										swal("Incidencia Capturada!", "", "success");
										
									
									else
									{
										$("#firmadigital").mLoading("hide");
										swal("Error al guardar firma!", "", "error");
									}
 					    		
 				 	    });
//  					modaldialog.dialog( "close" ); 
 				}
 				}
 		  });
			$("#firmadigital").mLoading("hide");
// 		}
	}).appendTo($tools)
	
	$('#reset').bind('click', function(e){
		$sigdiv.jSignature('reset')
	}).appendTo($tools)

// 	if (Modernizr.touch){
// 		$('#scrollgrabber').height($('#content').height())		
// 	}
	
})

})(jQuery)

</script>
</div>
<%}else{ %>
<div style="width: 100%;" align="center"><h2>Acci&oacute;n no autorizada!</h2></div>
<%} %>
</body>
</html>
