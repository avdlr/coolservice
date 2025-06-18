<%@ page import="bean.ConsultaTareasObjetadas"%>
<%@ page import="clases.TareasObjetadas"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<%
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): ""; 
	String lbr = request.getParameter("lbr") != null ? request.getParameter("lbr"): "QAS";
	
	ConsultaTareasObjetadas ConsultaTareasObjetadas= new ConsultaTareasObjetadas();
 	ArrayList<TareasObjetadas> lista = ConsultaTareasObjetadas.obtieneTareasObjetadas(folioplex,lbr);
%>
    <title>Portal PIC 10</title>
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link href="../assets/css/jquery-ui.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
    <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../assets/css/sweetalert.css" rel="stylesheet">
    <link href="../assets/select2/select2.min.css" rel="stylesheet">
    
    <script src="../assets/js/jquery-1.12.4.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert.min.js"></script>
    <script src="../assets/js/loading-mask.js"></script>
    <script src="../assets/select2/select2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>

<section class="wrapper" style="margin-top: 0px;">
<div class="row mt" style="margin:5px;">
<div class="row" style="padding-left:10px;background-color:#0b5c8c; color:white">
<div class="col-xs-12 col-sm-12 col-lg-12"><h5> <b>Folio Plex:</b> <%=folioplex%> | <b>Folio Pisa:</b> <%=foliopisa%> | <b>Tel&eacute;fono:</b> <%=telefono%> </h5></div>
</div>

		
</div>
<!-- <div class="row" style="margin:5px;"> -->
<!-- <div class="col.xs-12"><button style="display: none;" id="btnAsigMasiva" onclick="abrirAsignarMasivo()" title="ASIGNAR SELECCIONADOS" class="btn btn-warning btn-xs"><i class="fa fa-user-plus"></i>&nbsp;Asignaci&oacute;n Masiva</button></div> -->
<!-- </div> -->

<div class="row" style="margin: 5px; padding-top: 50px">
<div class="col-md-12">
<div class="form-group">
  <label for="observaciones" style="font-size: 17px; font-weight: bold;">Observaciones:</label>
  <textarea class="form-control" rows="5" maxlength="290" id="observaciones"></textarea>
</div>
<div class="row" style="text-align:right; padding-right: 35px">
		<button class="btn btn-warning" onclick="limpiar()" style="margin 2px;"><span class="fa fa-eraser"></span> Limpiar</button>
		<button class="btn btn-objetar" onclick="agregarObservacion()" style="margin 2px;"><span class="fa fa-gavel"></span> Agregar observaci&oacute;n</button>
</div>
<div class="form-group" style="padding-top: 20px;">
  <label for="tablaTareas" style="font-size: 17px; font-weight: bold;">Historial de observaciones:</label>
  <table id="tablaTareas" class="table table-striped table-bordered" style="font-size:11px; min-width: 300px">
        <thead>
            <tr>
		  		<th style="width: 15%">Fecha</th>
                <th style="width: 15%">Usuario</th>
                <th style="width: 70%">Observaci&oacute;n</th>
            </tr>
        </thead>
        <tbody>
       <% 
        	int i;
 			TareasObjetadas objDetalle;
				for ( i = 0; i < lista.size(); i++) {
					objDetalle = (TareasObjetadas)lista.get(i);
					
		%>
            <tr class="clickable-row">
                <td  align="center" ><%=objDetalle.getFecha() %></td>
                <td><%=objDetalle.getUsuario() %></td>
                <td><%=objDetalle.getObservaciones() %></td>                
            </tr>
		  <%} %>
           
        </tbody>
    </table>
</div>
</div>
</div>
</section>
</body>

    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
    