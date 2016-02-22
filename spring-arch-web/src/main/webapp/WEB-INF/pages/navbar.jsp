<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<style>
.navbar {
	border-radius: 0px;
}
</style>


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only"><s:message code="navbar.toggle.navigation" /></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href='<c:url value="/home"></c:url>'><table>
				<td><s:message code="dashboard.title" /></td>
			</table></a>
	</div>
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only"><s:message code="navbar.toggle.navigation" /></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-nav navbar-right">
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
			role="button" aria-expanded="false"> Language <span class="glyphicon glyphicon-flag"
				aria-hidden="true"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" onclick="changeLocale('<c:url value="/locale/change"/>?lang=en')">
						<s:message code="navbar.english" />
				</a></li>
				<li><a href="#" onclick="changeLocale('<c:url value="/locale/change"/>?lang=ar')">
						<s:message code="navbar.arabic" />
				</a></li>
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
			role="button" aria-expanded="false"> <sec:authentication
					property="principal.name" /> <span class="glyphicon glyphicon-user"
				aria-hidden="true"></span>
		</a>
			<ul class="dropdown-menu" role="menu">
				<!--  <li><a href="#">User profile</a></li>
                 <li><a href="#">Change password</a></li>
                 <li class="divider"></li> -->
				<li><a href="<c:url value='/j_spring_security_logout' />"> <span
						class="sub_icon glyphicon glyphicon-off"></span> <s:message code="navbar.logout" />
				</a></li>
			</ul></li>
	</ul>

	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
				<li class="active"><a href="<c:url value="/home/"/>"><i
						class="fa fa-fw fa-dashboard"></i> <s:message code="navbar.dashboard" /></a></li>
				<li><a href="<c:url value="/client/manage/user/"/>"><i
						class="fa fa-fw fa-file-text-o"></i> <s:message code="navbar.users" /></a></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>



<div class="alert alert-success alert-dismissible fade in" role="alert" id="success-alert"
	style="display: none;">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong><s:message code="alert.success" />!</strong>
	<div id="message"></div>
</div>
<div class="alert alert-warning alert-dismissible fade in" role="alert" id="warning-alert"
	style="display: none;">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong><s:message code="alert.warning" />!</strong>
	<div id="message"></div>
</div>
<div class="alert alert-danger alert-dismissible fade in" role="alert" id="error-alert"
	style="display: none;">
	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong><s:message code="alert.error" />!</strong>
	<div id="message"></div>
</div>


