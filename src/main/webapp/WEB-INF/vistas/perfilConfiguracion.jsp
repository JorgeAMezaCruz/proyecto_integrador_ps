<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- 
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
-->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />

<!-- <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
 -->
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/noti.css" />

<script src="js/notificaciones.js"></script>
<!-- plugin notificaciones  -->
<script src="SimpleNotification/simpleNotification.min.js">
	
</script>


<!-- plugin notificaciones  -->
<link rel="stylesheet"
	href="SimpleNotification/simpleNotification.min.css">


<title>BCP</title>
</head>
<body>

	<jsp:include page="intranetCabecera.jsp" />
	<div class="container" style="width: 80%; margin-top: 4%">
		<div class="container">
			<h1><strong>Datos del Cliente</strong></h1>
		</div>
		<div class="col-md-23">
			<form accept-charset="UTF-8" action="consultaCliente"
				class="simple_form" id="defaultForm2" method="post">

				<div class="row">
					<div class="col-md-12">
						<c:if test="${sessionScope.MENSAJE != null }">
							<div class="alert alert-success" id="success-alert">
								<button type="button" id="btnSuccess" class="close"
									data-dismiss="alert">x</button>
								${sessionScope.MENSAJE}
							</div>
						</c:if>
						<c:remove var="MENSAJE" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12" style="top: 30px">
						<div class="content">
							<table id="tableCliente"
								class="table table-striped table-bordered">
								<thead class="thead-light">
									<tr>
										<th>Nombres</th>
										<th>Apellido Paterno</th>
										<th>Apellido Materno</th>
										<th>DNI</th>
										<th>Fecha de nacimiento</th>
										<th>Email</th>
										<th>Teléfono</th>
										<th>Direccion</th>
										<th>Usuario</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${sessionScope.objCliente.nombre}</td>
										<td>${sessionScope.objCliente.apellido}</td>
										<td>${sessionScope.objCliente.apellidoM}</td>
										<td>${sessionScope.objCliente.dni}</td>
										<td><fmt:formatDate
												value="${sessionScope.objCliente.fechaNacimiento}"
												pattern="yyyy-MM-dd" /></td>
										<td>${sessionScope.objCliente.email}</td>
										<td>${sessionScope.objCliente.celular}</td>
										<td>${sessionScope.objCliente.direccion}</td>
										<td>${sessionScope.objCliente.login}</td>

										<td>
											<button type='button' data-toggle='modal'
												onclick="editar('${sessionScope.objCliente.idCliente}',
												'${sessionScope.objCliente.nombre}',
												'${sessionScope.objCliente.apellido}',
												'${sessionScope.objCliente.apellidoM}',
												'${sessionScope.objCliente.dni}',
												'<fmt:formatDate value="${sessionScope.objCliente.fechaNacimiento}" pattern="yyyy-MM-dd"/>',
												'${sessionScope.objCliente.email}',
												'${sessionScope.objCliente.celular}',
												'${sessionScope.objCliente.direccion}',
												'${sessionScope.objCliente.login}',
												'${sessionScope.objCliente.password}');"
												class='btn btn-success'
												style='background-color: hsla(233, 100%, 100%, 0);'>
												<img src='images/edit.gif' width='auto' height='auto' />
											</button>
										</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</form>
		</div>

	</div>
	<div class="modal fade" id="idModalActualiza">
		<div class="modal-dialog" style="width: 60%">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-ok-sign"></span> Actualiza
						Cliente
					</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
					<form id="id_form_actualiza" accept-charset="UTF-8"
						action="actualizarCliente" class="form-horizontal" method="post">
						<div class="panel-group" id="steps">
							<!-- Step 1 -->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos
											del Usuario</a>
									</h4>
								</div>
								<div id="stepOne" class="panel-collapse collapse in">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_ID">ID</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_ID" readonly="readonly"
													name="idCliente" type="text" maxlength="8" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_nombre">Nombres</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_nombre"
													readonly="readonly" name="nombre"
													placeholder="Ingrese el Nombre" type="text" maxlength="20" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_apellido">Apellido
												Paterno </label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_apellido"
													name="apellido" readonly="readonly"
													placeholder="Ingrese el apellido paterno" type="text"
													maxlength="20" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_apellidoM">Apellido
												Materno</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_apellidoM"
													name="apellidoM" placeholder="Ingrese el apellido materno"
													type="text" maxlength="20" readonly="readonly" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_dni" name="dni"
													readonly="readonly" placeholder="Ingrese dni" type="number" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_fecha">Fecha
												Nacimiento</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_fecha"
													name="fechaNacimiento"
													placeholder="Ingrese la fecha de nacimiento" type="date"
													maxlength="10" readonly="readonly" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_email">Email</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_email" name="email"
													placeholder="Ingrese email" type="email"
													readonly="readonly" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_celular"
													name="celular" placeholder="Ingrese celular" type="number"
													required />
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_direccion">Direccion</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_direccion"
													name="direccion" placeholder="Ingrese direccion" required
													type="text" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_login">Usuario</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_login" name="login"
													readonly="readonly" placeholder="Ingrese login" type="text" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label" for="id_act_password">Contraseña</label>
											<div class="col-lg-5">
												<input class="form-control" id="id_act_password"
													name="password" placeholder="Ingrese password"
													type="password" required />
											</div>
										</div>


										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												<button type="submit" class="btn btn-success">ACTUALIZA</button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form>

				</div>
			</div>

		</div>
	</div>


	<script type="text/javascript">
		function editar(idCliente, nombre, apellido, apellidoM, dni,
				fechaNacimiento, email, celular, direccion, login, password) {
			$('input[id=id_ID]').val(idCliente);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_apellido]').val(apellido);
			$('input[id=id_act_apellidoM]').val(apellidoM);
			$('input[id=id_act_fecha]').val(fechaNacimiento);
			$('input[id=id_act_email]').val(email);
			$('input[id=id_act_celular]').val(celular);
			$('input[id=id_act_direccion]').val(direccion);
			$('input[id=id_act_dni]').val(dni);
			$('input[id=id_act_login]').val(login);
			$('input[id=id_act_password]').val(password);
			$('#idModalActualiza').modal("show");
		}
		$(document).ready(function() {
			$('#tableCliente').DataTable();
		});
	</script>


</body>
</html>