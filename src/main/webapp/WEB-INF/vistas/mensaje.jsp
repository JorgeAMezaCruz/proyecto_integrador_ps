<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>

<title>Intranet Colegio - Jorge Jacinto Gutarra</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
       
<div class="container" style="width: 60%; margin-top: 4%">
<h4>Tranferencia BCP</h4>
              

	<form action="Mensaje" id="id_form" method="post"> 
		
		    
			<div class="form-group">
				<label class="control-label" for="id_texto">Mensaje</label>
				<input class="form-control" type="text" id="id_texto" name="texto" placeholder="Ingrese el mensaje">
			</div>
			
		
		    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Enviar</button>
			</div>
	

	</form>




</div>
  


<div class="container" >
 <div class="col-md-12" align="center"> 

 </div>
</div>    		
</body>
</html>