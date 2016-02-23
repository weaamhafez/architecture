<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript"
	src="<c:url value="/js/modules/user/user.js"/>"></script>
<style type="text/css">
.form-group input[type="checkbox"] {
	display: none;
}

.form-group input[type="checkbox"]+.btn-group>label span {
	width: 20px;
}

.form-group input[type="checkbox"]+.btn-group>label span:first-child {
	display: none;
}

.form-group input[type="checkbox"]+.btn-group>label span:last-child {
	display: inline-block;
}

.form-group input[type="checkbox"]:checked+.btn-group>label span:first-child
	{
	display: inline-block;
}

.form-group input[type="checkbox"]:checked+.btn-group>label span:last-child
	{
	display: none;
}
</style>
</head>
<body>




	<div class="row">
		<div class="col-md-7 col-md-offset-1">
			<h1>${user.name}
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="javascript:void(0)" id="createUser"
							data-toggle="modal" data-target="#userModal">
								<h4>
									<span class="label label-info"><span
										class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
									<s:message code="user.edit.user" /></span>
								</h4>
						</a></li>
						<c:choose>
							<c:when test="${user.active}">
								<li class="divider"></li>
								<li><a href="javascript:void(0)" id="changePassword"
									data-toggle="modal" data-target="#changePasswordModal">
										<h4>
											<span class="label label-info"><span
												class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
											<s:message code="user.change.password" /></span>
										</h4>
								</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" id="deactivateUser">
										<h4>
											<span class="label label-danger"><span
												class="glyphicon glyphicon-user" aria-hidden="true"></span>
											<s:message code="user.deactivate.user" /></span>
										</h4>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" id="reactivateUser">
										<h4>
											<span class="label label-success"><span
												class="glyphicon glyphicon-user" aria-hidden="true"></span>
											<s:message code="user.reactivate.user" /></span>
										</h4>
								</a></li>
							</c:otherwise>
						</c:choose>
						<li class="divider"></li>
						<li><a href="javascript:void(0)" id="deleteUser">
								<h4>
									<span class="label label-danger"><span
										class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									<s:message code="user.delete.user" /></span>
								</h4>
						</a></li>
					</ul>
				</div>
			</h1>
		</div>

	</div>

	<div class="row" style="margin-top: 20px">
		<div class="col-md-5 col-md-offset-1">
			<form class="form-horizontal">
				<fieldset disabled>
					<div class="form-group">
						<label class="col-md-4 control-label"><s:message
								code="user.address" /></label>

						<div class="col-md-8">
							<input type="text" class="form-control" disabled
								value="${user.email}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label"><s:message
								code="user.username" /></label>

						<div class="col-md-8">
							<input type="text" class="form-control" disabled
								value="${user.username}">
						</div>
					</div>
					<c:choose>
						<c:when test="${user.active}">
							<div class="form-group disabled">
								<label class="col-md-4 control-label"><s:message
										code="user.status" /></label> <input type="checkbox"
									autocomplete="off" disabled checked="checked" />

								<div class="btn-group col-md-8">
									<label for="fancy-checkbox-success" class="btn btn-success">
										<span class="glyphicon glyphicon-ok"></span> <span> </span>
									</label> <label for="fancy-checkbox-success"
										class="btn btn-default active"> <s:message
											code="user.active" />
									</label>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group disabled">
								<label class="col-md-4 control-label"><s:message
										code="user.status" /></label> <input type="checkbox"
									autocomplete="off" disabled checked="checked" />

								<div class="btn-group col-md-8">
									<label for="fancy-checkbox-danger" class="btn btn-danger">
										<span class="glyphicon glyphicon-remove"></span> <span> </span>
									</label> <label for="fancy-checkbox-danger" class="btn btn-default">
										<s:message code="user.inactive" />
									</label>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</fieldset>
			</form>
		</div>
	</div>

	<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
		aria-labelledby="userModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="userModalLabel">
						<s:message code="user.edit.user" />
					</h4>
				</div>
				<div class="modal-body">
					<form id="user-form" class="form-horizontal">
						<input type="hidden" class="form-control" id="user-id" name="user"
							value="${user.id}">

						<div class="form-group">
							<label for="user-name" class="col-md-3 control-label"><s:message
									code="user.name" /></label>

							<div class="col-md-8">
								<input type="text" class="form-control" id="user-name"
									name="name" value="${user.name}" required>
							</div>
						</div>
						<div class="form-group">
							<label for="user-username" class="col-md-3 control-label"><s:message
									code="user.username" /></label>

							<div class="col-md-8">
								<input type="text" class="editUserCntrls form-control"
									id="user-username" name="username" value="${user.username}"
									required>
							</div>
						</div>
						<div class="form-group">

							<label for="user-email" class="col-md-3 control-label"><s:message
									code="user.email" /></label>

							<div class="col-md-8">
								<input type="emailFull" class="editUserCntrls form-control"
									id="user-email" name="email" value="${user.email}" required>
							</div>
						</div>
						<div class="form-group">

							<label for="user-mobile" class="col-md-3 control-label"><s:message
									code="user.mobile" /></label>

							<div class="col-md-8">
								<input type="mobileNumber" class="createUserCntrls form-control"
									id="user-mobile" name="mobile" value="${user.mobile}" required>
							</div>

						</div>
						<input type="hidden" name="active" value="${user.active}">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<s:message code="dialog.cancel" />
					</button>
					<button type="button" class="btn btn-warning" id="resetBtn">
						<s:message code="dialog.reset" />
					</button>
					<button data-loading-text="Saving..." id="saveUpdateBtn"
						type="button" class="btn btn-primary">
						<s:message code="dialog.save" />
					</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		role="dialog" aria-labelledby="changePasswordModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="changePasswordModalLabel">
						<s:message code="user.change.password" />
					</h4>
				</div>
				<div class="modal-body">
					<form id="change-password-form" class="form-horizontal">
						<input type="hidden" class="form-control"
							id="userForChangingPassword" name="user" value="${user.id}"
							required>

						<div class="form-group">
							<label for="user-password" class="col-md-3 control-label"><s:message
									code="user.new.password" /></label>

							<div class="col-md-6">
								<input type="text" class="form-control" id="user-password"
									name="password" required>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<s:message code="dialog.cancel" />
					</button>
					<button data-loading-text="Changing..." id="changePasswordBtn"
						type="button" class="btn btn-primary">
						<s:message code="dialog.change" />
					</button>
				</div>
			</div>
		</div>
	</div>