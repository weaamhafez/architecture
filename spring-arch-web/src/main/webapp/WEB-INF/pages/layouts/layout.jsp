<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
</head>
<body>
  <div id="wrapper">
	<tiles:insertAttribute name="menu"></tiles:insertAttribute>
    <div id="page-wrapper">
      <div class="container-fluid">
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
        <!-- Page Heading -->
      </div>
    </div>
   </div>
</body>
</html>
