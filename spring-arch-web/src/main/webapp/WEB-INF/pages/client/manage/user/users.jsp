<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



<script type="text/javascript"
	src="<c:url value="/js/modules/user/users.js"/>"></script>
<div class="row">
	<div class="col-md-8 col-md-offset-1">
		<h1>
			Users
			<div class="btn-group">
				<button type="button" class="btn btn-default dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false">
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="javascript:void(0)" id="createUser"
						data-toggle="modal" data-target="#userModal">
							<h4>
								<span class="label label-success"><span
									class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								<s:message code="users.create.user" /></span>
							</h4>
					</a></li>
				</ul>
			</div>
		</h1>
	</div>
</div>



<div style="margin-top: 30px">
	<div class="col-md-10 col-md-offset-1">
		<table id="usersTable" class="table table-striped table-hover"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th><s:message code="user.name" /></th>
					<th><s:message code="user.username" /></th>
					<th><s:message code="user.status" /></th>
					<th><s:message code="user.address" /></th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
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
					<s:message code="users.create.user" />
				</h4>
			</div>
			<div class="modal-body">
				<form id="user-form" class="form-horizontal">
					<input type="hidden" name="id" id="stiffness-id" />
					<div class="form-group">
						<label for="user-name" class="col-md-3 control-label"><s:message
								code="users.full.name" /></label>
						<div class="col-md-8">
							<input type="text" class="form-control" id="user-name"
								name="name" required>
						</div>
					</div>
					<div class="form-group">
						<label for="user-username" class="col-md-3 control-label"><s:message
								code="user.username" /></label>
						<div class="col-md-8">
							<input type="text" class="createUserCntrls form-control"
								id="user-username" name="username" required>
						</div>
					</div>
					<div class="form-group">

						<label for="user-email" class="col-md-3 control-label"><s:message
								code="user.email" /></label>
						<div class="col-md-8">
							<input type="emailFull" placeholder="user@company.com"
								class="createUserCntrls form-control" id="user-email"
								name="email" required>
						</div>

					</div>
					<div class="form-group">

						<label for="user-mobile" class="col-md-3 control-label"><s:message
								code="user.mobile" /></label>
						<div class="col-md-8">
							<input type="mobileNumber"
								placeholder="+1-213-5096995 | 213-5096995 | 5096995"
								class="createUserCntrls form-control" id="user-mobile"
								name="mobile" required>
						</div>

					</div>

					<div class="form-group">

						<label for="user-password" class="col-md-3 control-label"><s:message
								code="users.password" /></label>
						<div class="col-md-8">
							<input type="password" class="createUserCntrls form-control"
								id="user-password" name="password" required>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<s:message code="dialog.cancel" />
				</button>
				<button data-loading-text="Creating..." id="saveUpdateBtn"
					type="button" class="btn btn-primary">
					<s:message code="users.create.user" />
				</button>
			</div>
		</div>
	</div>
</div>
