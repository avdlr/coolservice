<%@page import="bean.ConsultaCatalogo"%>
<%@page import="bean.obtieneUsuario"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>COOL SERVICE</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" type="image/png" href="../assets/img/favicon.png" />
    <!-- Bootstrap core CSS -->
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
     <link href="../assets/css/bootstrap-multiselect.css" rel="stylesheet">
     <link href="../assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
     <link href="../assets/css/bootstrap-multiselect.css" rel="stylesheet">
     <link href="../assets/css/jquery.mloading.css" rel="stylesheet">
     <link href="../assets/dist/css/bootstrap-select.css" rel="stylesheet">
     <style type="text/css">
     	.ui-dialog { z-index: 1003 !important ;}
     </style>
<!--     <link href="../assets/combofilter/infragistics.theme.css" rel="stylesheet"> -->
<!--     <link href="../assets/combofilter/infragistics.css" rel="stylesheet"> -->
<!--     <link href="../assets/bootstrap-select-1.12.2/dist/css/bootstrap-select.css" rel="stylesheet"> -->
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
  <%
 	 if (request.getParameter("logoff") != null) {
	    session.invalidate();
	    response.sendRedirect("../jsp/index.jsp");
	    return;
	  }
//   	String usuario = request.getParameter("usuario") != null ? request.getParameter("usuario"): "";
  	String usuario = request.getRemoteUser() != null ? request.getRemoteUser(): "";
  	String nombre = new obtieneUsuario().obtieneDatosUsuario(usuario,"");
  	
  	
  	if(nombre.length()>20)
  	{
  		nombre = nombre.substring(0,19);
  	}
  	ConsultaCatalogo catalogos = new ConsultaCatalogo();
  	String idusuario = catalogos.consultaTiposUsuarioId(usuario);
  	String empresa = catalogos.consultaUsuarioEmpresa(usuario);
  	JSONArray listamenu = new JSONArray();
  	String registro = "";
  	listamenu= catalogos.consultaMenu(idusuario);
  	boolean tareasband=false;
  	boolean catalogosband=false;
  	boolean impresionesband=false;
  	boolean dashboardband=false;
  	boolean reporteband = false;
  	boolean finanzasband = false;
  	boolean visorcliente = false;
  	boolean tareaciente = false;
  	for(int i=0; i<listamenu.length(); i++)
  	{
  		registro=listamenu.getString(i);
  		if(registro.equals("TAR000"))
  		{
  			tareasband = true;
  		}
  		if(registro.equals("CAT000"))
  		{
  			catalogosband = true;
  		}
//   		if(registro.equals("IMP000"))
//   		{
//   			impresionesband = true;
//   		}
  		if(registro.equals("EST000"))
  		{
  			dashboardband = true;
  		}
  		if(registro.equals("REP000"))
  		{
  			reporteband = true;
  		}
  		if(registro.equals("FIN000"))
  		{
  			finanzasband = true;
  		}
  		if(registro.equals("VIS001"))
  		{
  			visorcliente = true;
  		}
  		if(registro.equals("TAR001"))
  		{
  			tareaciente = true;
  		}
  	}
  %>
  <body>

  <section id="container">
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box" style="color:#FFFFFF;">
                  <div id="menudesplegable" class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <img src="../assets/img/coolservicelogo_trans.png" width="45"class="pull-left" style="padding-top:15px;" />
            <!--logo end-->
             <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li >
                    <span style="color: #FFFFFF; font-weight: bold; font-size: .58em;"><%=usuario %> - <%=nombre %> &nbsp;&nbsp;</span>
                    <button class="logout" style="display: inline-block;" onclick="logout()"><span class="fa fa-sign-out">&nbsp;</span>Logout</button>
                    </li>
                      
            	</ul>
            </div>
        </header>
      <!--header end-->
      <div id="dialog-form-GenerarToken" title="Generar Token" style="display: none;">
  <form>
    <fieldset>
      <div id="dialog-form-GenerarToken" class="row mt" style="margin:5px;">
      <div class="col-xs-12" style="margin-top: 5px">
      <label for="usuario">Usuario:</label>
    </div>
    <div class="col-xs-12">
      <input class="form-control input-sm" id="usuario" type="text" value="" disabled><br>
    </div>
      <div class="col-xs-12">
      <label for="password">Contrase&ntilde;a:</label><br>
	</div>
	<div class="col-xs-12">
       <input class="form-control input-sm" id="password" type="text" value="" disabled><br>
     </div>
     <div class="col-xs-12" style="padding-top: 20px">
      <label for="tokenGenerado">Token:</label><br>
	</div>
	<div class="col-xs-12">
      <input class="form-control input-sm" id="tokenGenerado" type="text" value="" disabled><br>
     </div>     
 </div>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
<!--       <button class="btn btn-primary"><span class="fa fa-check"></span> Aceptar</button><button class="btn btn-danger"><span class="fa fa-times"></span>Cancelar</button> -->
    </fieldset>
  </form>
</div>
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              <%if(tareasband){ %>
                  <li class="sub-menu">
                      <a class="sub-menu" href="javascript:;" >
                          <i class="fa fa-tasks"></i>
                          <span>Tareas</span>
                      </a>
                      <ul class="sub">
                          <li ><a id="menuCobre" style="background-color: #696565 !important;" class="fa fa-list-alt"  href="javascript:;" onclick="consultaTareas()"> <label style=" font-family: sans-serif; cursor: pointer;">Lista de Tareas</label></a></li>
                          <li ><a id="menuTareasLiquidadas" style="background-color: #696565 !important;" class="fa fa-thumbs-o-up"  href="javascript:;"onclick="consultaTareasLiquidadas()"> <label style=" font-family: sans-serif; cursor: pointer;">&nbsp;Tareas Liquidadas</label></a></li>
                      </ul>
                  </li>
                  <%} %>
                   <!-- CRR04092017  -->
                   <%if(catalogosband){ %>
                   <li class="sub-menu">
                      <a href="javascript:;" onclick="" >
                          <i class="fa fa-briefcase"></i>
                          <span>Catalogos</span>
                      </a>
                      <ul class="sub">
                          <li ><a id="menuCobre" style="background-color: #696565 !important;" class="fa fa-list-alt"  href="javascript:;" onclick="consultaUsuarios()"> <label style=" font-family: sans-serif; cursor: pointer;">Usuarios</label></a></li>
                          <li ><a id="menuTareasLiquidadas" style="background-color: #696565 !important;" class="fa fa-briefcase"  href="javascript:;"onclick="consultaEmpresas()"> <label style=" font-family: sans-serif; cursor: pointer;">Empresas</label></a></li>
                           <li ><a id="catalogosucursal" style="background-color: #696565 !important;" class="fa fa-building"  href="javascript:;"onclick="consultaSucursal()"> <label style=" font-family: sans-serif; cursor: pointer;">Sucursal</label></a></li>
                          <li ><a id="catalogozonas" style="background-color: #696565 !important;" class="fa fa-compress"  href="javascript:;"onclick="consultaZonas()"> <label style=" font-family: sans-serif; cursor: pointer;">Zonas</label></a></li>
                          <li ><a id="catalogodetallezonas" style="background-color: #696565 !important;" class="fa fa-building"  href="javascript:;"onclick="consultaDetZonas()"> <label style=" font-family: sans-serif; cursor: pointer;">Detalle Zonas</label></a></li>
                          <li ><a id="catalogoproveedores" style="background-color: #696565 !important;" class="fa fa-bus"  href="javascript:;"onclick="consultaProveedores()"> <label style=" font-family: sans-serif; cursor: pointer;">Proveedores</label></a></li>
                          <li ><a id="catalogorazonservicio" style="background-color: #696565 !important;" class="fa fa-edit"  href="javascript:;"onclick="consultaRazonServicio()"> <label style=" font-family: sans-serif; cursor: pointer;">Raz&oacute;n Servicio</label></a></li>
                          <li ><a id="catalogoserviciorealizado" style="background-color: #696565 !important;" class="fa fa-check-circle"  href="javascript:;"onclick="consultaServicioRealizado()"> <label style=" font-family: sans-serif; cursor: pointer;">Servicio Realizado</label></a></li>
                          <li ><a id="catalogoequipossucursal" style="background-color: #696565 !important;" class="fa fa-check-circle"  href="javascript:;"onclick="consultaEquiposSucursal()"> <label style=" font-family: sans-serif; cursor: pointer;">Equipos por Sucursal</label></a></li>
                      </ul>
                   </li>
					<%} %>	
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class="fa fa-address-card-o"></i> -->
<!--                           <span>Asignadas</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                           <li><a  href="../zntjsp/general.html">General</a></li> -->
<!--                           <li><a  href="../zntjsp/buttons.html">Buttons</a></li> -->
<!--                           <li><a  href="../zntjsp/panels.html">Panels</a></li> -->
<!--                       </ul> -->
<!--                   </li> -->
                  
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class="fa fa-map-marker"></i> -->
<!--                           <span>Cambaceos</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                          <li ><a id="menuCobre" style="background-color: #696565 !important;" class="fa fa-map-pin"  href="javascript:;" onclick="consultaFacilidades()"> <label style=" font-family: sans-serif; cursor: pointer;">Consultar Facilidades</label></a></li> -->
<!--                          <li ><a id="menuFibra" style="background-color: #696565 !important;" class="fa fa-list-alt"  href="javascript:;"onclick="consultaTareasCambaceo('')"> <label style=" font-family: sans-serif; cursor: pointer;">&nbsp;Tareas Cambaceo</label></a></li> -->
<!--                       </ul> -->
<!--                   </li> -->

                  <!-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-print"></i>
                          <span>Impresión</span>
                      </a>
					  <ul class="sub">
                          <li ><a id="menuCobreImp" style="background-color: #696565 !important;" class="fa fa-share-alt"  href="javascript:;" onclick="consultaImpresiones('COBRE')"> <label style=" font-family: sans-serif; cursor: pointer;">Tareas Cobre</label></a></li>
                          <li ><a id="menuFibraImp" style="background-color: #696565 !important;" class="fa fa-code-fork"  href="javascript:;" onclick="consultaImpresiones('FIBRA')"> <label style=" font-family: sans-serif; cursor: pointer;">&nbsp;Tareas Fibra</label></a></li>
                      </ul>
                  </li>-->
                  
                   <!-- CRR07092017  -->
                    <%if(impresionesband){ %>
                   <li class="sub-menu">
                      <a href="javascript:;" onclick="consultaImpresionesGeneral('TODO')" >
                          <i class="fa fa-print"></i>
                          <span>Impresiones</span>
                      </a>
                   </li>
                   <%} %>
                  <!------------------>
                   <%if(dashboardband){ %>
                  <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-bar-chart"></i>
                          <span>Dashboards</span>
                      </a>
                      <ul class="sub">

                          <li ><a id="menuGrafica2" style="background-color: #696565 !important;" class="fa fa-bar-chart"  href="javascript:;" onclick="consultaDashboardRango()"> <label style=" font-family: sans-serif; cursor: pointer;"> Zona/Empresa</label></a></li>
						  <li ><a id="menuGrafica1" style="background-color: #696565 !important;" class="fa fa-bar-chart"  href="javascript:;" onclick="consultaDashboard()"> <label style=" font-family: sans-serif; cursor: pointer;"> T&eacute;cnico</label></a></li>
                      </ul>
                  </li>
                  <%} %>
<%--                   <%if(visorcliente){ %> --%>
					<%if(visorcliente){ %>
                  <li class="sub-menu" onclick="consultaDashboardCliente()">
                      <a href="javascript:;">
                          <i class="fa fa-bar-chart"></i>
                          <span>Dashboard Cliente</span>
                      </a>
                      
                  </li>
                  <%} %>
                  <%if(visorcliente){ %>
                  <li class="sub-menu" onclick="consultTareasCliente()">
                      <a href="javascript:;">
                          <i class="fa fa-tasks"></i>
                          <span>Tareas Cliente</span>
                      </a>
                      
                  </li>
                  <%} 
                  if(reporteband){
                  %>
                   <li class="sub-menu">
                      <a href="javascript:;">
                          <i class="fa fa-folder"></i>
                          <span>Reportes</span>
                      </a>
                      <ul class="sub">

                          <li ><a id="reportecostos" style="background-color: #696565 !important;" class="fa fa-paste"  href="javascript:;" onclick="consultaCostosMenu()"> <label style=" font-family: sans-serif; cursor: pointer;"> Costos</label></a></li>
						  <li ><a id="reportefacturas" style="background-color: #696565 !important;" class="fa fa-paste"  href="javascript:;" onclick="consultaFacturasMenu()"> <label style=" font-family: sans-serif; cursor: pointer;"> Facturas</label></a></li>
                      </ul>
                  </li>
                  <%} %>
<%--                   <%} %> --%>
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class="fa fa-paperclip"></i> -->
<!--                           <span>Reportes</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                           <li><a  href="../zntjsp/blank.html">Estatus de Tareas por Empresa</a></li> -->
<!--                           <li><a  href="../zntjsp/login.html">Reporte Liquidadas</a></li> -->
<!--                           <li><a  href="../zntjsp/lock_screen.html">Cargar Archivos</a></li> -->
<!--                       </ul> -->
<!--                   </li> -->
                  <!--   menu reporte abvm04092017 -->
<!--                       <li class="sub-menu">  -->
<!--                  <a href="#" data-toggle='modal' data-target='#Seguimiento' data-backdrop='static' data-keyboard='false' > -->
<!--                  <a href="http://localhost:9082/PortalPIC10Web/zntjsp/calendario/calendario.html?year=2017&mes=08&empresa=06"target="_blank"> abre ellink en nueva pestalla  -->
<!--                       <a href="calendario/calendario.html?year=&mes=&empresa="target="_blank">  -->
<!--                           <i class="fa fa-calendar"></i> -->
<!--                           <span>Seguimiento</span> -->
<!--                       </a>                      -->
<!--                   </li> -->
                  
                  <!--   menu reporte abvm07092017 -->
<!--                    <li class="sub-menu"> -->
<!--                       <a href="javascript:;" onclick="consultaNotificaciones()" > -->
<!--                           <i class="fa fa-envelope-open-o"></i> -->
<!--                           <span>Notificación</span> -->
<!--                        </a> -->
<!--                   </li> -->
                  
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" onclick="generarToken()" > -->
<!--                           <i class="fa fa-key"></i> -->
<!--                           <span>Generar Token</span> -->
<!--                        </a> -->
<!--                   </li> -->
                  
<!--                   <li class="sub-menu"> -->
<!--                       <a href="login.html" onclick=""> -->
<!--                           <i class="fa fa-sign-out"></i> -->
<!--                           <span>Logout</span> -->
<!--                       </a> -->

<!--                   </li> -->
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class="fa fa-tasks"></i> -->
<!--                           <span>Forms</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                           <li><a  href="../zntjsp/form_component.html">Form Components</a></li> -->
<!--                       </ul> -->
<!--                   </li> -->
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class="fa fa-th"></i> -->
<!--                           <span>Data Tables</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                           <li><a  href="../zntjsp/basic_table.html">Basic Table</a></li> -->
<!--                           <li><a  href="../zntjsp/responsive_table.html">Responsive Table</a></li> -->
<!--                       </ul> -->
<!--                   </li> -->
<!--                   <li class="sub-menu"> -->
<!--                       <a href="javascript:;" > -->
<!--                           <i class=" fa fa-bar-chart-o"></i> -->
<!--                           <span>Charts</span> -->
<!--                       </a> -->
<!--                       <ul class="sub"> -->
<!--                           <li><a  href="../zntjsp/morris.html">Morris</a></li> -->
<!--                           <li><a  href="../zntjsp/chartjs.html">Chartjs</a></li> -->
<!--                       </ul> -->
<!--                   </li> -->

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3 id="cargaInicial"><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></h3>
          		<div class="row" style="margin:5px;">
          		</div>

		</section>
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              COOL SERVICE
              <a href="#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery-1.12.4.js"></script>
<!-- <script src="../libs/jquery.js"></script> -->
    <script src="../assets/js/jquery-ui.js"></script>
<!--     <script src="../assets/js/jquery.js"></script> -->
    <script src="../assets/js/bootstrap.min.js"></script>
    
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap.min.js"></script>
    <script src="../assets/js/sweetalert.min.js"></script>
    <script src="../assets/js/loading-mask.js"></script>
    <script src="../assets/select2/select2.min.js"></script>
    <script src="../assets/js/bootstrap-multiselect.js"></script>
    <script src="../assets/js/moment-with-locales.js"></script>
    <script src="../assets/js/bootstrap-datetimepicker.js"></script>
    <script src="../assets/js/main.js"></script>
    <script src="../assets/css/jquery.mloading.js"></script>
    <script src="../assets/dist/js/bootstrap-select.js"></script>
    <script src="../assets//js/jquery.mask.js"></script>
<!--     <script src="../assets/combofilter/infragistics.core.js"></script> -->
<!--     <script src="../assets/combofilter/infragistics.lob.js"></script> -->
<!--     <script src="../assets/bootstrap-select-1.12.2/dist/js/bootstrap-select.js"></script> -->


    
    
  <script>
  var intervalid="";
      //custom select box

            $(document).ready(function() {
            
            $("#html").niceScroll().show();
            
    $('#example').DataTable();
    $("#cargaInicial").html('<i class="fa fa-angle-right"></i> Bienvenido');
    $('#__ig_wm__').css("display","none");
    if(<%=dashboardband%>)
    {
    	consultaDashboard();
    }
    else
    {
//     	$("#main-content").html("");
    }
    var h = window.innerHeight;
	$("#main-content").css("min-height",h-50);
   
    
} );
      
      

      function displayRow(id)
      {
    	  if( $("#"+id).css("display")!="none")
    	  {
    		  $("#"+id).css("display","none");  
    	  }
    	  else
    	  {
    		  $("#"+id).css("display","");    
    	  }
    	  
      }
      
      function consultaFacilidades()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'consultaFacilidades.jsp',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  }); 
      }
      
      function consultaTareas()
      {
    	  
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'tareas.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      function consultaDashboard()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'dashboard.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      function consultaDashboardCliente()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'dashboardCliente.jsp?usuario=<%=usuario%>&empresa=<%=empresa%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      
      function consultTareasCliente()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'tareasCliente.jsp?usuario=<%=usuario%>&empresa=<%=empresa%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      function consultaDashboardRango()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'dashboardRangos.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      function consultaFacturasMenu()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'reporteFacturas.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      function consultaCostosMenu()
      {
    	  ocultarmenu();
    	  
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'reporteCostos.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      function consultaUsuarios()
      {
    	  
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'usuarios_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
      function consultaEmpresas()
      {
    	  
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'empresas_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      
        dialog = $( "#dialog-form-GenerarToken" ).dialog({
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
      
      
      function consultaImpresiones(tecnologia)
      {
    	 
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'impresiones.jsp?tecnologia='+tecnologia,
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      ///////////CRR07092017///////////////
        function consultaImpresionesGeneral(tecnologia)
      {
          
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'impresionesGeneral.jsp?tecnologia='+tecnologia,
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      /////////////////////////////////////
      
      //////CRR04092017///////////////////////
      function consultaReportesTareas(tecnologia)
      {
    	  
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'estatusReportes.jsp',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      ////////////////////////////////////////
      function consultaTareasCambaceo(tecnologia)
      {
    	  
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'tareasCambaceo.jsp?tecnologia='+tecnologia,
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      
      function ocultarmenu()
      {
    	
      	if($(window).width()<769)
      	{
    	  $("#menudesplegable").click();
      	}
      	clearInterval(intervalid);
      }
      
      $("#menuCobre").mouseout(function(){
    	  $("#menuCobre").removeClass("active");
    	  $("#menuCobre").removeClass("focus");
    	  
      });
      $("#menuTareasLiquidadas").mouseout(function(){
    	  $("#menuTareasLiquidadas").removeClass("active");
    	  $("#menuTareasLiquidadas").removeClass("focus");
    	  
      });
      
      $("#menuFibra").mouseout(function(){
    	  $("#menuFibra").removeClass("active");
    	  $("#menuFibra").removeClass("focus");
    	  
      });
      
      function generarToken(){
      
    	
    	$("#dialog-form-GenerarToken").css({'display':'block'});
    	$("#usuario").val("36000036");
    	$("#password").val("55bb452ea84e3cfa39b74c4f30d4b821fa81ac5a");
    	
    	dialog = $( "#dialog-form-GenerarToken" ).dialog({
            autoOpen: false,
            height: 400,
            width: 500,
            modal: true,
            title: "Generar Token",
            buttons: [{
              text : "Generar Token",
              "class": "btn btn-primary",
              click: function() {
              	 var username=$("#usuario").val();
				 var password=$("#password").val();
				 var grant_type="password";
				 var company="TERCEROS";
				 var employeeNumber="18000046";
				 
				 var accion = 'loginPortals';
				 parametros="username="+username +"&password="+password+"&grant_type="+grant_type+"&company="+company+"&employeeNumber="+employeeNumber+"&accion="+accion;
  	  			if(username!="" && password!="")
  	  			{
				$.ajax({
					url: '../RestAPI_Operations?'+parametros,
					type: "GET",
					cache: false,
					success: function( resp ) {
						datosjson = $.parseJSON(resp);
						 if(datosjson.code.trim()=="SUCCESS"){
							swal("", "Token generado correctamente", "success");
							$("#tokenGenerado").val(datosjson.access_Token.trim());
							//dialog.dialog( "close" );
							//limpiarFiltros('GA');
						 }
						 else{
							swal("", "Error al generar el token", "error");
						 }
					}
				});
       				
       				/*$.ajax({
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
     											panelDeTareasADM(tipoTarea,"actualizar",folioplex,foliopisa,telefono,jsp);
     											cargaTareas();
				                        		}); 
                        		}
                        		else
                        		{
                        			swal("Error al ASIGNAR tarea", "", "error");
                        		}
                        	}});*/

  	  }
  	  else
  		  {
  		  swal("Usuario y contrase&ntilde;a son obligatorios", "", "warning");
  		  }
            	  
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
      
      function consultaEstadistica()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'estadistica.jsp',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      
      function consultaEstadistica2()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'estadistica2.jsp',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      //consulta de tabla en estadistica
      function consultaTabla()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'tabla.jsp',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
				}
    	  });
      }
      
      // Ronel Consulta de Tareas Liquidadas
      function consultaTareasLiquidadas()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'tareasLiquidadas.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
      	  // Consulta notificaciones abvm07092017
      function consultaNotificaciones()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' style='text-align: center;'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'notificacion.jsp',
				type: "GET",
				cache: false,
				success: function( resp ) {
					 $("#main-content").html(resp); 
				}
    	  });
      }
      	  
      function consultaZonas()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'zonas_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
	  function consultaDetZonas()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'detZonas_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
	  function consultaProveedores()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'proveedores_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
	  function consultaRazonServicio()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'razonServ_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
	  function consultaServicioRealizado()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'servicioRealizado_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
	  function consultaEquiposSucursal()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'equipo_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
	  
  	  function consultaSucursal()
      {
    	  ocultarmenu();
    	  $("#main-content").html("<section class='wrapper'><div class='row mt' style='margin:5px;'><div class='col-md-12' align='center'><img src='../assets/img/gear_load.gif' width='100px' style='padding-top:5%;'></div></section>");
    	  $.ajax({
				url: 'sucursal_mtto.jsp?usuario=<%=usuario%>',
// 				data: ,
				type: "GET",
				cache: false,
				
				success: function( resp ) {
					 $("#main-content").html(resp);
					 
				}
    	  });
      }
  	  
  	function logout()
  	{
	  	$.ajax({
	  			url: "../validaLogin",
	  			type: "POST",
	  			cache: false,
	  			data: {
	   				usuario: "<%=usuario%>",
	   				accion: "logout"
	   			},
	  			
	  			success: function( resp ) {
	  				window.location.replace("../jsp/index.jsp?logoff=true");
	  			}
	  	});
      }
  </script>
    <!-- potpot de pantalla seguimiento abvm04092017-->
<!-- <div class="modal fade" id="Seguimiento" tabindex="-1" role="dialog" aria-labelledby="consultasLinks"> -->
<!--   <div class="modal-dialog" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--         <h2 class="text-primary text-center" id="modalTitleLinks"> </h2> -->
<!--       </div>  -->
<!--       <div class="modal-body" id="modalBodyLinks">  -->
<!-- 			<object  data="http://localhost:9082/PortalPIC10Web/zntjsp/calendario/calendario.html?year=2017&mes=08&empresa=06" type="text/html"  width=100% height=600px ></object>   -->
<!-- 			    </div>     -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button> -->
<!--       </div>   -->
<!--     </div> -->
<!--   </div> -->
<!-- </div>  -->
<!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>


  </body>
</html>
