<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>



<script type="text/javascript"
	src="<c:url value="/js/modules/user/users.js"/>"></script>
<div class="row">
	<div class="col-md-8 col-md-offset-1">
		<h1>Users</h1>
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