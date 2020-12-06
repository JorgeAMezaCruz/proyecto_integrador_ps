<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="css/login.css" type="text/css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

 
<title>Login Sistema Bcp</title>
</head>   
<body>    


 <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
					<!-- 
                    	Aplicando lenguaje de expresiones 
                    	requestScope : memoria request
                        sessionScope : memoria session
                    -->
									
                	<c:if test="${requestScope.mensaje != null}">
               		<div class="alert alert-danger fade in" id="success-alert">
				        <a href="#" class="close" data-dismiss="alert">&times;</a>
				        <strong>${requestScope.mensaje}</strong>
				    </div>
				    </c:if>
				    
				    <div class="body"></div>
						<div class="grad"></div>
						<div class="header">
							<div>Mi <span> Banco </span></div>
						</div>
						<br>
						<div class="login">
						<form id="id_form"  action="login" method="post" class="login-form">
									<div class="form-group">
			                    		<label class="sr-only" for="form-username">Usuario</label>
			                        	<input type="text" name="login" placeholder="Usuario..." class="form-username form-control" id="form-username">
			                        </div>
											                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Contraseña</label>
			                        	<input type="password" name="password" placeholder="Contraseña..." class="form-password form-control" id="form-password">
			                        </div>
								<button type="submit" class="btn">Ingresar</button>
						</form>		
					</div>
				    
				    
				    
				    

                </div>
            </div>
            
        </div>


     
<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


</body>
</html>