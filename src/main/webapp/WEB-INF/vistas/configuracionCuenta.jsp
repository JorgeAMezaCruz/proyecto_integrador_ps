<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/noti.css" />
<title>Configuracion De Cuentas - BCP</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />

	<div class="container" style="width: 80%; margin-top: 4%">
		<div class="container">
			<h1><strong>Configuracion De Cuentas</strong></h1>
		</div>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaCrudModalidad">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8" action="consultaConfiguracionCuentas"
				class="simple_form" id="defaultForm2" method="post">

				<div class="row" style="height: 70px">


					<div class="col-md-12">
						<c:if test="${sessionScope.MENSAJE != null }">
							<div class="alert alert-success" id="success-alert">
								<button type="button" class="close" data-dismiss="alert">x</button>
								${sessionScope.MENSAJE}
							</div>
						</c:if>
						<c:remove var="MENSAJE" />

</div>
</div>

				<div class="row">
					<div class="col-md-12">
						<div class="content">

							<table id="tablePaginacion" class="table table-striped">
								<thead>
									<tr class="bg-primary">
										<th>Número de Cuenta</th>
										<th>Saldo actual</th>
										<th>Limite de transferencia</th>
										<th></th>

									</tr>
								</thead>
								<tbody>

									<c:forEach items="${sessionScope.configuracionCuentas}" var="x">
										<tr>
											<td>${x.numero}</td>
											<td>S/${x.saldo}</td>
											<td>S/${x.limite_transferencia}</td>

											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idCuenta}','${x.numero}','${x.saldo}','${x.limite_transferencia}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0); border: none'>
													<img src='images/config.svg' id='id_update' width='auto'
														height='auto' />
												</button>
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
	</div>
			</form>
		</div>


		<div class="modal fade" id="idModalActualiza">
<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Establezca un
							monto limite de transferencia
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaCuenta" class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Información de la cuenta seleccionada</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">ID
													Cuenta</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_cuenta"
														readonly="readonly" name="idCuenta" type="text" />
												</div>
											</div>



											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">Número
													de Cuenta</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_numero" name="numero"
														readonly="readonly" type="text" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">Saldo
													disponible (S/)</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_saldo" name="saldo"
														readonly="readonly" type="text" />
												</div>
											</div>

											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">Límite
													transferencia (S/)</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_limite"
														name="limite_transferencia" type="number" step="any"
														autocomplete="off" />
												</div>
											</div>


											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="submit" class="btn btn-primary">ACEPTAR</button>
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
</div>

	<script type="text/javascript">
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});
	</script>


	<script type="text/javascript">
		function registrar() {
			$('#idModalRegistra').modal("show");
		}
		function editar(idcuenta, numero, saldo, limite) {
			$('input[id=id_cuenta]').val(idcuenta);
			$('input[id=id_numero]').val(numero);
			$('input[id=id_saldo]').val(saldo);
			$('input[id=id_limite]').val(limite);
			$('#idModalActualiza').modal("show");
		}
		/* $(document).ready(function() {
		 $('#tablePaginacion').DataTable();
		 } ); */
	</script>

	<script type="text/javascript">
		$('#id_form_actualiza')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								"limite_transferencia" : {
									selector : '#id_limite',
									validators : {
										notEmpty : {
											message : 'Debe establecer un monto límite de transferencia'
										},
									}
								}
							}
						});
	</script>

</body>
</html> 