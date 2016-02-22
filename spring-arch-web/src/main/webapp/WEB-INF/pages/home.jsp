<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">
			<s:message code="dashboard.title" />
			<img src="<c:url value="/images/enhance.png"/>">
		</h1>


	</div>
</div>
<div class="col-md-6">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<a href="<c:url value="/client/manage/user/"/>"><s:message
					code="navbar.users" /></a>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-hover ">
				<thead>
					<tr>
						<th>#</th>
						<th>User Name</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>User1</td>
						<td>31/01/2016</td>
					</tr>
					<tr>
						<td>2</td>
						<td>User2</td>
						<td>31/01/2016</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>