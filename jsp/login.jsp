<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CS-Admin</title>
    <link rel="shortcut icon" type="image/png" href="../assets/img/favicon.png" />

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<form method="POST" action='<%= response.encodeURL("../jsp/j_security_check") %>' >
	  <div id="login-page">
	  	<div class="container">
	  	
		      <div class="form-login">
		        <h2 class="form-login-heading">Autenticacion</h2>
		        <div class="login-wrap">
		            <input name="j_username" id="j_username" type="text" class="form-control" placeholder="Usuario" autofocus>
		            <br>
		            <input name="j_password" id="j_password" type="password" class="form-control" placeholder="Contraseña">
					<input class="btn btn-theme btn-block" type="submit" value="ENTRAR">
		            <hr>
		            

		
		        </div>
		      </div>	  	
	  	
	  	</div>
	  </div>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="../assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("../assets/img/cool_service_logo_login.png", {speed: 500});
    </script>
    
   
</form>

  </body>
</html>
