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
	ArrayList<Tarea> lista = consulta.obtieneTareas(empresa,division,area,cope,tecnologia,estatus,fechaini,fechafin,foliopisaplex,foliopisa,tecnico, tipoOrden,"CAMBACEO",lbr);
%>

<div id="pruebasDialog">
	<form style="width:99%;">
	    <fieldset>
	    	<div class="row">
	    		<div class="col-xs-12" style="font-: bold;">¿Desea objetar la solicitud Cambaceo Preliquidaci&oacute;n? Preliquidaci&oacute;n</div>
	    		<div class="col-xs-12">SI <input type="radio" name="radioObjetar" value="SI"/> NO <input type="radio" name="radioObjetar" value="NO"/></div>
	    		<div class="col-xs-12">&nbsp;</div>
	    		<div class="col-xs-4" align="right">Tipo de Objeci&oacute;n: </div>
	    		<div class="col-xs-8"><select class="form-control input-sm" id="tipoObjPruebas"><option value="">Seleccionar...</option></select></div>
	    		<div class="col-xs-12">&nbsp;</div>
	    		<div class="col-xs-4" align="right"><label style="padding-top:40px;">Observaciones: </label></div>
	    		<div class="col-xs-8"><textarea class="form-control" rows="5" id="observacionesLiq"></textarea></div>
	    	</div>
	    </fieldset>
	</form>
</div>



<div id="dialog-form" title="Asignar Técnico">
  <form>
    <fieldset>
      <label for="name">Folio Pisa:</label>
      <input class="form-control input-sm" id="foliopisaasigna" type="text" value="" disabled><br>
      <label for="name">T&eacute;cnico:</label>
      <select id="selectTecnico" class="form-control input-sm">
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
     
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
<!--       <button class="btn btn-primary"><span class="fa fa-check"></span> Aceptar</button><button class="btn btn-danger"><span class="fa fa-times"></span>Cancelar</button> -->
    </fieldset>
  </form>
</div>
<div id="provisionarAccion"></div>
<div id="detalleTareasMovil">
<ul class="nav nav-tabs">
    <li class="active"><a id="tabDetalle" href="#detalleMovil">Datos Tarea</a></li>
    <li><a href="#aprovMovil">Aprovisionamiento</a></li>
<!--     <li><a href="#menu2">Menu 2</a></li> -->
<!--     <li><a href="#menu3">Menu 3</a></li> -->
  </ul>
  <div class="tab-content">
  <div id="detalleMovil" class="tab-pane fade in active">
  <form>
    <fieldset>


        <table class="table table-bordered table-striped table-condensed">
          <tbody>
          <tr><td colspan="2" style="font-weight: bold; background-color: #428bca; color:#FFFFFF;">Datos Tarea</td></tr>
          <tr>
              <td style="font-weight: bold;">Divisi&oacute;n</td>
              <td><div id="detalleDivisionM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">&Aacute;rea</td>
              <td><div id="detalleAreaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Cope</td>
              <td><div id="detalleCopeM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Empresa</td>
              <td><div id="detalleEmpresaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Folio Plex</td>
              <td><div id="detalleFolioPlexM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Folio Pisa</td>
              <td><div id="detalleFolioPisaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Tel&eacute;fono</td>
              <td><div id="detalleTelefonoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Tecnolog&iacute;a</td>
              <td><div id="detalleTecnologiaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Expediente Plex</td>
              <td><div id="detalleExpedientePlexM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Distrito</td>
              <td><div id="detalleDistritoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Tipo Tarea</td>
              <td><div id="detalleTipoTareaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Estado</td>
              <td><div id="detalleEstadoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Dilaci&oacute;n</td>
              <td><div id="detalleDilacionM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold; background-color: #428bca; color:#FFFFFF;" colspan="2">Datos Cliente</td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Tel&eacute;fono Contacto</td>
              <td><div id="detalleTelefonoContactoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Tel&eacute;fono Celular</td>
              <td><div id="detalleTelefonoCelularM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold; background-color: #428bca; color:#FFFFFF;" colspan="2">Datos Cita</td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha de Contrataci&oacute;n R&aacute;pida</td>
              <td><div id="detalleFechaContRpdaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha Cita</td>
              <td><div id="detalleFechaCitaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold; background-color: #428bca; color:#FFFFFF;" colspan="2">Datos Gesti&oacute;n</td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha de Pendiente</td>
              <td><div id="detalleFechaPendienteM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Expediente</td>
              <td><div id="detalleExpedienteM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">T&eacute;cnico</td>
              <td><div id="detalleTecnicoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Aprovisionado</td>
              <td><div id="detalleAprovisionamientoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha Aprovisionamiento</td>
              <td><div id="detalleFechaAprovisionamientoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha Asignada</td>
              <td><div id="detalleFechaAsignadaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha Despachada</td>
              <td><div id="detalleFechaDespachadaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Fecha Liquidada</td>
              <td><div id="detalleFechaLiquidadaM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Facilidades</td>
              <td><div id="detalleFacilidadesM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold; background-color: #428bca; color:#FFFFFF;" colspan="2"></td>

           </tr>
           <tr>
              <td style="font-weight: bold;">Tipo</td>
              <td><div id="detalleTipoM"></div></td>
           </tr>
           <tr>
              <td style="font-weight: bold;">Valor Asignado</td>
              <td><div id="detalleValorAsignadoM"></div></td>
           </tr>
		 </tbody>
		 </table>
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
<!--       <button class="btn btn-primary"><span class="fa fa-check"></span> Aceptar</button><button class="btn btn-danger"><span class="fa fa-times"></span>Cancelar</button> -->
    </fieldset>
  </form>
  </div>
  <div id="aprovMovil" class="tab-pane fade">
  información de aprovisionamiento
  </div>
  </div>
</div>
<div id="detalleTareas">
<ul class="nav nav-tabs">
    <li class="active"><a id="tabDetalle" href="#home">Datos Tarea</a></li>
    <li><a href="#menu1">Aprovisionamiento</a></li>
  </ul>
  <div class="tab-content">
  <div id="home" class="tab-pane fade in active">
  	<form>
    <fieldset>
    	<div class="row" style="width: 100%; padding-left: 15px;">
    		<div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Tarea</div>
    	</div>
    	<div class="row" style="padding-top: 5px; padding-left:15px; width:100%;">
    		
    		<div class="col-xs-1" style="font-weight: bold;">Divisi&oacute;n: </div>
    		<div class="col-xs-2">
					<label id="detalleDivision"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">&Aacute;rea: </div>
    		<div class="col-xs-2">
    			<label id="detalleArea"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Cope: </div>
    		<div class="col-xs-2">
					<label id="detalleCope"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Empresa: </div>
    		<div class="col-xs-2">
					<label id="detalleEmpresa"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Folio Plex: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPlex"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Folio Pisa: </div>
    		<div class="col-xs-2">
					<label id="detalleFolioPisa"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel&eacute;fono: </div>
    		<div class="col-xs-2">
					<label id="detalleTelefono"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tecnolog&iacute;a: </div>
    		<div class="col-xs-2">
					<label id="detalleTecnologia"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Exp Plex: </div>
    		<div class="col-xs-2">
    			<label id="detalleExpedientePlex"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Distrito: </div>
    		<div class="col-xs-2">
    			<label id="detalleDistrito"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T. Tarea: </div>
    		<div class="col-xs-2">
    			<label id="detalleTipoTarea"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Estado: </div>
    		<div class="col-xs-2">
    			<label id="detalleEstado"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Dilaci&oacute;n: </div>
    		<div class="col-xs-2">
    			<label id="detalleDilacion"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Gesti&oacute;n</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">F.Pendiente:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaPendiente"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Expediente:</div>
    		<div class="col-xs-2">
    			<label id="detalleExpediente"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">T&eacute;cnico:</div>
    		<div class="col-xs-2">
    			<label id="detalleTecnico"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Aprovisionado:</div>
    		<div class="col-xs-2">
    			<label id="detalleAprovisionamiento"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		<div class="col-xs-1" style="font-weight: bold;">F. Aprov:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAprovisionamiento"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Asig:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaAsignada"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Despa</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaDespachada"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Liqui:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaLiquidada"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left:15px;">	
    		
    		<div class="col-xs-1" style="font-weight: bold;">Facilidades:</div>
    		<div class="col-xs-2">
    			<label id="detalleFacilidades"></label>
    		</div>
    	</div>
    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 15px;">Datos Cliente<div style="background-color: #FFFFFF; padding-right: 1px;"></div></div><div class="col-xs-6" style="font-weight: bold; background-color: #335485; color:#FFFFFF; padding-left: 2px;">Datos Cita</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cont:</div>
    		<div class="col-xs-2">
    			<label id="detalleTelefonoContacto"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Tel. Cel:</div>	
    		<div class="col-xs-2">
    			<label id="detalleTelefonoCelular"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F.Cont Rpda:</div>
    		<div class="col-xs-2">
    			<label id="detalleFechaContRpda"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">F. Cita:</div>	
    		<div class="col-xs-2">
    			<label id="detalleFechaCita"></label>
    		</div>
    	</div>

    	<div class="row" style="width: 100%; padding-left: 15px;"><div class="col-xs-12" style="font-weight: bold; background-color: #335485; color:#FFFFFF;padding-left: 15px;">&nbsp;</div></div>
    	<div class="row" style="width: 100%; padding-top: 5px; padding-left:15px;">
    		<div class="col-xs-1" style="font-weight: bold;">Tipo:</div>
    		<div class="col-xs-2">
				<label id="detalleTipo"></label>
    		</div>
    		<div class="col-xs-1" style="font-weight: bold;">Valor Asignado:</div>
    		<div class="col-xs-2">
				<label id="detalleValorAsignado"></label>
    		</div>
    		
    	</div>
    	
    </fieldset>
    </form>
  </div>
   	<div id="menu1" class="tab-pane fade"> -->
 	 	información de aprovisionamiento
  	</div>
  </div>
  </div>

<section class="wrapper">
<div class="row mt" style="margin:5px;">
<div class="col-md-12"><h4> Inicio <i class="fa fa-angle-right"></i> Cambaceos <i class="fa fa-angle-right"></i> Tareas  Cambaceos</h4></div>

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
				<option value="COMPLETE">COMPLETE</option>
				<option value="DESPACHADA">DESPACHADA</option>
				<option value="OBJETADA">OBJETADA</option>
				<option value="PENDIENTE">PENDIENTE</option>
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
                <th>Aprov</th>
                <th>Pruebas</th>
                <th>Acciones&nbsp;&nbsp;&nbsp;</th>
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
                <td  align="center" > <div class="btn-group" data-toggle="buttons" >
                <label <%if(!objDetalle.getEstado().trim().equals("PENDIENTE")) {%>disabled<%} %> class="btn btn-default" style="font-size: 4px; color:#000;" >
                	<input  type="checkbox" id="<%=objDetalle.getFolioPisa() %>" autocomplete="off"  onchange="activaSeleccion(this.id)"/>
                	<span class="glyphicon glyphicon-ok"></span>
                </label></div> </td>
                <td><%=objDetalle.getFolioPisaPlex() %></td>
                <td><%=objDetalle.getFolioPisa() %></td>
                <td><%=objDetalle.getTipoTarea() %></td>
                <td><%=objDetalle.getTipo() %></td>
<%--                 <td><%=objDetalle.getTecnologia() %></td> --%>
<%--                 <td><span class="label label-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>default<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>warning<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>primary<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>danger<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>success<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>info<%}%> label-mini"><%=objDetalle.getEstado() %></span></td> --%>
                <td style="text-align:center;">
                	<div class="btn-group" style="width: 100%;">
                		<span style="width:100%; font-size:10px; cursor:pointer; font-weight: bold;" class="label btn-<%if(objDetalle.getEstado().trim().equals("PENDIENTE")) {%>pendiente<%}else%><%if(objDetalle.getEstado().trim().equals("ASIGNADA")) {%>asignada<%} else%><%if(objDetalle.getEstado().trim().equals("DESPACHADA")) {%>despachada<%} else%><%if(objDetalle.getEstado().trim().equals("OBJETADA")) {%>objetada<%} else%><%if(objDetalle.getEstado().trim().equals("COMPLETE")) {%>liquidada<%}%><%if(objDetalle.getEstado().trim().equals("PELIGRO")) {%>peligro<%}%> dropdown-toggle" data-toggle="dropdown" style="font-size: smaller;"><%=objDetalle.getEstado() %></span>
                		<ul class="dropdown-menu" role="menu" style="margin-left: 100px; margin-top: -30px;">
                		<% 
						for ( j = 0; j < conEstatus.size(); j++) {
							obj = (String[])conEstatus.get(j);
						%>
                		<%if( objDetalle.getEstado().trim().equals(obj[0]) && !obj[1].equals("DETALLE")) {
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
        					{
                		%>
                		
                		
                			<li id="qaAsig<%=objDetalle.getFolioPisa()%>"><span class="btn <%=obj[2] %> fa <%=obj[3] %>" style="width: 100%;" onclick="abrir<%=obj[1] %>('<%=objDetalle.getFolioPisa() %>')" title="<%=obj[1]%>"> <label style="font-family: monospace; cursor: pointer;"><%=obj[1] %></label></span></li>
                			
                		
                		<%}
                		}
						}%>
						<li ><span class="btn btn-primary fa fa-search-plus" style="width: 100%;" onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE"> <label style="font-family: monospace; cursor: pointer;">DETALLE</label></span></li>
						</ul>
                	</div>
                </td>
                <td><input type="hidden" id="tel<%=objDetalle.getFolioPisa()%>" value = "<%=objDetalle.getTelefono() %>"/><%=objDetalle.getTelefono() %></td>
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
                <td>
                <% 
				for ( j = 0; j < conEstatus.size(); j++) {
					obj = (String[])conEstatus.get(j);
				%>
				<%
// 				if(objDetalle.getEstado().trim().equals("PENDIENTE")) {
				if(obj[0].equals(objDetalle.getEstado().trim()) && !obj[1].equals("DETALLE")){
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
					{
				%>
				<button id="<%=obj[1].substring(0,3)+objDetalle.getFolioPisa() %>" onclick="abrir<%=obj[1]%>('<%=objDetalle.getFolioPisa() %>')" title="<%=obj[1]%>" class="btn <%=obj[2] %> btn-xs"><i class="fa <%=obj[3] %>"></i></button><%
				
// 				}
					}
				
				}

				}%>
				<button onclick="abrirDetalle('<%=objDetalle.getDivision() %>','<%=objDetalle.getArea() %>','<%=objDetalle.getCope() %>','<%=objDetalle.getEmpresa() %>','<%=objDetalle.getFolioPisaPlex() %>','<%=objDetalle.getFolioPisa() %>','<%=objDetalle.getTelefono() %>','<%=objDetalle.getTecnologia() %>','<%=objDetalle.getExpedienteplex() %>','<%=objDetalle.getDistrito() %>','<%=objDetalle.getTipoTarea() %>','<%=objDetalle.getEstado() %>','<%=objDetalle.getDilacion() %>','<%=objDetalle.getTelefonoContacto() %>','<%=objDetalle.getTelefonoCelular() %>','<%=objDetalle.getFechaCont() %>','<%=objDetalle.getFechaCita() %>','<%=objDetalle.getFechaPendiente() %>','<%=objDetalle.getExpediente() %>','<%=objDetalle.getTecnico() %>','<%=objDetalle.getAprovisionamiento() %>','<%=objDetalle.getFechaAprovisionamiento() %>','<%=objDetalle.getFechaAsignada() %>','<%=objDetalle.getFechaDespachada() %>','<%=objDetalle.getFechaLiquidacion() %>','<%=objDetalle.getFacilidades() %>','<%=objDetalle.getTipo() %>','<%=objDetalle.getValorAsignado() %>')" title="DETALLE" class="btn btn-primary btn-xs"><i class="fa fa-search-plus"></i></button>
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
 
 
 	function seleccionaConTD(idcheck, condicion)
 	{
 		if(condicion){
 		$("#"+idcheck).click();
 		activaSeleccion(idcheck);
 		}
 	}
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
			url: 'resumenTareasCambaceo.jsp?'+parametros,
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
    function abrirASIGNAR(folioplex)
    {
//     	$("#selectTecnico option[value='']").prop('selected',true);
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
//     	dialog.dialog( "open" );
		var popupAsignacion = window.open("asignacionTarea.jsp?lbr=" + '<%=lbr%>' + 
		"&folioplex=" + folioplex, folioplex, "width = 500, height = 500");
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
    	      			 		var partecnologia = '<%=tecnologia%>';
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
    	
//     	if(confirm("Desea despachar la order: "+foliopisa+"?"))
//     	{
<%-- 	    	var parametros="estado=DESPACHADA&tipo=DESPACHADA&foliopisa="+foliopisa+"&lbr=<%=lbr%>"; --%>
// 	    	$.ajax({
// 	  			url: 'actualizaEstado.jsp?'+parametros,
// 	  			type: "GET",
// 	  			cache: false,
	  			
// 	  			success: function( resp ) {
// 	  				if(resp.trim()=="OK")
// 	  				{
// 	  					var pardivision = $("#division option:selected").val();
//       			 		var pararea = $("#area option:selected").val();
//       			 		var parcope = $("#cope option:selected").val();
//       			 		var partecnologia = $("#tecnologia option:selected").val();
//       			 		var parestatus = $("#estatus option:selected").val();
//       			 		var parfechaini = $("#rango1").val();
//       			 		var parfechafin = $("#rango2").val();
//       			 		var parfoliopisaplex = $("#foliopisaplex").val();
//       			 		var parfoliopisa = $("#foliopisa").val();
//       			 		var partecnico = $("#tecnico").val();
      			 		
//       			 		if(pardivision!=""){parametros+="&division="+pardivision;}
//       			 		if(pararea!=""){parametros+="&area="+pararea;}
//       			 		if(parcope!=""){parametros+="&cope="+parcope;}
//       			 		if(partecnologia!=""){parametros+="&tecnologia="+partecnologia;}
//       			 		if(parestatus!=""){parametros+="&estatus="+parestatus;}
//       			 		if(parfechaini!=""){parametros+="&fechaini="+parfechaini;}
//       			 		if(parfechafin!=""){parametros+="&fechafin="+parfechafin;}
//       			 		if(parfoliopisaplex!=""){parametros+="&foliopisaplex="+parfoliopisaplex;}
//       			 		if(parfoliopisa!=""){parametros+="&foliopisa="+parfoliopisa;}
//       			 		if(partecnico!=""){parametros+="&tecnico="+partecnico;}
//       			 		$("#divisionTareas").html("<div class='wrapper' align='center'><img src='../assets/img/loading.gif' width='100px' style='padding-top:5%;'></div>");
//       			 		$.ajax({
//       						url: 'resumenTareas.jsp?'+parametros,
//       						type: "GET",
//       						cache: false,
      						
//       						success: function( resp ) {
//       							 $("#divisionTareas").html(resp);
// //       							
//       							dialog.dialog( "close" );
//       						}
//       				  });
	  					
	  					
// 	  				}
// 	  				else
// 	  				{
// 	  	
// 	  				}
// 	  			}
// 	    	});
//     	}
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
    	      			 		var partecnologia = '<%=tecnologia%>';
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