<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="wrapper">
<!-- <form method="post" action="validatecaptcha.jsp"> -->
	<div id="contenedorFacilidades" class="row mt" style="margin:5px;">
		<div class="row">
		<div class="col-xs-12"><h4> Inicio <i class="fa fa-angle-right"></i> Cambaceos <i class="fa fa-angle-right"></i> Consulta Facilidades  </h4></div>
		</div>
		
	
		<div id="facTelefono" class="row" style="margin-top:10px;">
			<div class="col-xs-4 col-md-2" >Tel&eacute;fono: </div>
			<div class="col-xs-8 col-md-4"><input id="telefonoFac" type="text" class="form-control"/></div>
		</div>
		<div id="facImgSeg" class="row" style="margin-top:10px;">
			<div class="col-xs-4 col-md-2" >Imagen de Seguridad: </div>
			<div class="col-xs-8 col-md-4" ><img  src="<c:url value="../simpleCaptcha.png" />"></div>
		</div>
		<div id="facTextImg" class="row" style="margin-top:10px;">
			<div class="col-xs-4 col-md-2" >Capture el Texto de la Imagen:</div>
			<div class="col-xs-8 col-md-4" > <input id="captchacontrol" name="answer" class="form-control" placeholder="" /></div>	
				
		</div>
		<div id="facTerminal" class="row" style="margin-top:10px;">
			<div class="col-xs-4 col-md-2">Terminal: </div>
			<div class="col-xs-8 col-md-4"><input id="terminalFac" type="text" class="form-control"/></div>
		</div>
		<div class="row" style="margin-top:10px;" id="facTecnico">
			<div class="col-xs-4 col-md-2">T&eacute;cnico: </div>
			<div class="col-xs-8 col-md-4">
				<select class="form-control" id="tecnicoFac">
					<option value="">Seleccionar...</option>
					<option value="458269">ABEL DE LEON</option>
					<option value="458270">ABEL ENRIQUE PEREZ PAYAN</option>
					<option value="458271">ABEL RAMIREZ SOLANO</option>
					<option value="458272">ABELINO CRUZ GOMEZ</option>
					<option value="458273">ABIGAIL RICARDO PEREZ UGARTE</option>
					<option value="458274">ABRAHAM GARCIA TOSTADO</option>
					<option value="458275">ABRAHAM GOMEZ PEREZ</option>
					<option value="458276">ABRAHAM JUAREZ QUIRINO</option>
					<option value="458277">ABRAM PLASCENCIA VELAZQUEZ</option>
					<option value="458278">ADALBERTO RANGEL CRUZ</option>
					<option value="458279">ADRIAN JASSO NAVA</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			
			<div class="col-xs-12"><button id="validarFacilidades" onclick="cargafacilidades('Consulta')" class="btn btn-primary"><span class="fa fa-check"></span> Validar</button> 
									<button style="display:none;" id="reintentarFacilidades" onclick="cargafacilidades('Reintento')" class="btn btn-primary"><span class="fa fa-reply"></span> Reintentar</button>
			</div>
			
		</div>
		<br>
		<div id="cablesPAR" class="row" style="display:none;">
		    <div class="col-xs-12">
		      <div class="row">
					<div class="col-xs-12" style="background-color: #77a2ce; color:#FFFFFF; font-weight: bold; font-size: 1.5em;">Cable PAR</div>
				</div>
		      <br>
		      <div id="cablesPARseccion" class="btn-group btn-group-vertical" data-toggle="buttons">
		
		      </div>
		
		    </div>
		     <div class="col-xs-12">
		     	<button id="btnRegistrar" onclick="insertarCambaceo()" class="btn btn-primary"><span class="fa fa-check"></span> Registrar</button> 
											<button  id="btnReiniciar" onclick="" class="btn btn-primary"><span class="fa fa-reply-all"></span> Reiniciar</button>
		     </div>
		  </div>
	</div>
<!-- 	</form> -->
</section>

  

<script>
var msgId="";
var jsonrespfac=[];
function cargafacilidades(accion){
	var telefonoFac = $("#telefonoFac").val();
	var terminalFac = $("#terminalFac").val();
	
	
	var variablecaptcha = $("#captchacontrol").val();
// 	$("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div></section>");
	  $.ajax({
			url: 'validatecaptcha.jsp?answer='+variablecaptcha,

			type: "GET",
			cache: false,
			
			success: function( resp ) {
				
				if(resp.trim()=="OK")
				{
					waitingDialog.show('Buscando Facilidades...');
					var parconfac = "";
					parconfac += "telefono="+telefonoFac+"&terminal="+terminalFac+"&accion="+accion+"&idMsg="+msgId;
					$.ajax({
						url: '../ConsultaFacilidades?'+parconfac,

						type: "GET",
						cache: false,
						
						success: function( respfac ) {
							jsonrespfac=JSON.parse(respfac);
							if(jsonrespfac.codigo=="000")	
							{
								$("#telefonoFac").prop("disabled",true);
//		 						$("#facImgSeg").prop("disabled",true);
								$("#captchacontrol").prop("disabled",true);
								$("#terminalFac").prop("disabled",true);
								$("#tecnicoFac").prop("disabled",true);
								
								$("#validarFacilidades").prop("disabled",true);
								$("#reintentarFacilidades").prop("disabled",true);
								
								for(var i=0; i<jsonrespfac.pares.length; i++)
								{
// 									alert(jsonrespfac.pares[i].par);
									$("#cablesPARseccion").append('<label class="btn "><input type="radio" name="cables" value="'+jsonrespfac.pares[i].par+'"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i> <span>  '+jsonrespfac.pares[i].par+'</span></label>');
								}
								
								$("#cablesPAR").css("display","block");
								waitingDialog.hide();
							}
							else
							{
								swal("", "No se encontraron facilidades", "error");
								
								if(jsonrespfac.msgId!="" && jsonrespfac.msgId!=null)
								{
									msgId=jsonrespfac.msgId;
								}
								
		 						$("#telefonoFac").prop("disabled",true);
		// 						$("#facImgSeg").prop("disabled",true);
		 						$("#captchacontrol").prop("disabled",true);
		 						$("#terminalFac").prop("disabled",true);
		 						$("#tecnicoFac").prop("disabled",true);
								
		 						$("#validarFacilidades").css("display","none");
		 						$("#reintentarFacilidades").css("display","block");
								waitingDialog.hide();
							}
								
						}
					});

					
					
					
				}
				else
				{
					
						swal("Error en Captcha", "", "error");

					
				}
				 
			}
	  }); 
}


function insertarCambaceo()
{
	var telefonoFac = $("#telefonoFac").val();
	var expediente = $("#tecnicoFac").val();
	var nombre = $("#tecnicoFac :selected").text();
	
	var date = new Date();
	var minuto = date.getMinutes();
	var hora = date.getHours();
	var segundos = date.getSeconds();
// 	alert("000"+minuto+hora+segundos);
	var folio = "000"+minuto+hora+segundos;
	var parmcambaceo ="lbr=QAS";
	if(folio!=""){parmcambaceo+="&folio="+folio;}
	if(telefonoFac!=""){parmcambaceo+="&telefono="+telefonoFac;}
	if(expediente!=""){parmcambaceo+="&expediente="+expediente;}
	if(nombre!=""){parmcambaceo+="&nombre="+nombre;}
	 $.ajax({
			url: '../RegistrarTareaCambaceo?'+parmcambaceo,

			type: "GET",
			cache: false,
			
			success: function( resp ) {
				if(resp.trim()=="OK")
				{
					swal("Operación Exitosa!", "Se ha registrado la orden: "+folio, "info");
					consultaFacilidades();
				}
				else
				{
					swal("Error en la Operación!", "No se ha podido generar la orden: "+folio, "error");
				}
			}
	 });
	
}

$(function(){
	$('#telefonoFac').bind('keyup paste', function(){
	    this.value = this.value.replace(/[^0-9]/g, '');
	    if(this.value.length>10)
	    {
	    	this.value = this.value.substring(0,10);
	    }
	});

	
});


</script>