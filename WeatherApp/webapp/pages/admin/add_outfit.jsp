<%@page import="util.UserAccount"%>
<%@ page import="entity.Outfit"%>
<%@ page import="dao.DatabaseConnection"%>
<%@ page import="dao.SQLRepositorium"%>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Прогноз погоды и советы по одежде</title>
<style>
body, h1, h2, p {
	margin: 0;
	padding: 0;
}

h1 {
	text-indent: 20px;
	color: #F6F6F4;
}

p {
	color: #332723;
}

body {
	font-size: 18px;
}

#header {
	background-color: #93A494;
	border-bottom: 1px solid #ccc;
	height: 50px;
}

#wrapper {
	background-color: #E1F5C4;
}

#menu {
	text-align: center;
	float: left;
	width: 300px;
	padding: 10px;
}

#box {
	border-bottom: 1px solid;
}

#main {
	background-color: #F6F6F4;
	border-left: 1px solid #ccc;
	margin-left: 350px;
	padding: 10px;
	height: 580px;
}

#footer {
	width: 100%;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background-color: #dedede;
	position: fixed;
	right: 0;
	bottom: 0;
	text-align: right;
}

#field {
	width: 400px;
}
</style>
</head>
<body>
	<div id="header">
		<h1>
			Hello,
			<%=((UserAccount) session.getAttribute("user")).getRole()%>
		</h1>
	</div>
	<div id="wrapper">
		<div id="menu">
			<br>
			<p>Insert the name of the city to get the outfit advice</p>
			<br>
			<form method="get"
				action="${pageContext.request.contextPath}/WeatherServlet">
				<input type="textbox" name="city" /><br> <input type="submit"
					value="search" />
			</form>
		</div>
		<div id="main">
			<c:if test="${error != null}">${error}<br>
			</c:if>
			<br>
			<form method="post"
				action="${pageContext.request.contextPath}/EditOutfitsServlet">
				<p>Outfit</p>
				<input id="field" required="required" type="textbox" name="name" /><br>
				<br>
				<p>Min temperature to dress the outfit</p>
				<input id="field" required="required" type="textbox" name="minTemp" />
				<br> <br>
				<p>Max temperature to dress the outfit</p>
				<input id="field" required="required" type="textbox" name="maxTemp" /><br>
				<input type="submit" value="insert" />
			</form>

			<br>
			<p>
				<a href="${pageContext.request.contextPath}/OutfitsServlet">Go
					back to the outfits page</a>
			</p>
		</div>

		<div id="footer">
			<p>Copyright © Margarita Skokova, 2020</p>
		</div>
</body>
</html>

