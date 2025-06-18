<%@ page import="bean.ConsultaTareasObjetadas"%>
<%@ page import="clases.TareasObjetadas"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html> 
<html>
  <head>
<!--     <meta charset="utf-8"> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
<!--     <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina"> -->
<%
	String folioplex = request.getParameter("folioplex") != null ? request.getParameter("folioplex"): "";
// 	String foliopisa = request.getParameter("foliopisa") != null ? request.getParameter("foliopisa"): "";
// 	String telefono = request.getParameter("telefono") != null ? request.getParameter("telefono"): ""; 
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
<!--     <link href="../assets/select2/select2.min.css" rel="stylesheet"> -->
    
    <script src="../assets/js/jquery-1.12.4.js"></script>
    <script src="../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
<!--     <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script> -->
<!--     <script src="../assets/js/jquery.scrollTo.min.js"></script> -->
<!--     <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script> -->
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert.min.js"></script>
<!--     <script src="../assets/js/loading-mask.js"></script> -->
<!--     <script src="../assets/select2/select2.min.js"></script> -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
<script>
$.ajaxSetup({cache: false});

$.extend( true, $.fn.dataTable.defaults, {
    //"autoWidth":true,
    "searching": false,
    "lengthChange": false, 
    "ordering": false
} );

$(document).ready(function() {
    $('#tablaTareas2').DataTable();
});

 		 $('#tablaTareas2').on('click', '.clickable-row', function(event) {
    	  $(this).addClass('active').siblings().removeClass('active');
    	});
</script>
<div class="form-group" style="padding-top: 20px;">
  <label for="tablaTareas2" style="font-size: 17px; font-weight: bold;">Historial de observaciones:</label>
  <table id="tablaTareas2" class="table table-striped table-bordered" style="font-size:11px;width: 100% ">
        <thead>
            <tr>
		  		<th width="50px">Fecha</th>
                <th width="50px">Usuario</th>
                <th width="700px">Observaci&oacute;n</th>
            </tr>
        </thead>
        <tbody>
       <% 
        	int c;
 			TareasObjetadas objDetalle;
				for ( c = 0; c < lista.size(); c++) {
					objDetalle = (TareasObjetadas)lista.get(c);
					
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
</body>
</html>
    