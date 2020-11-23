<%@page import="util.UserAccount"%>
<%@ page import="entity.Outfit"%>
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
			<%=((UserAccount) session.getAttribute("user")).getRole().toString().toLowerCase()%>
		</h1>
	</div>
	<div id="wrapper">
		<div id="menu">
			<c:if test="${role != null}">
				<form method="get"
					action="${pageContext.request.contextPath}/AuthenticationServlet">
					<input type="submit" value="log out" />
				</form>
			</c:if>

			<br>
			<p>Insert the name of the city to get the outfit advice</p>
			<form method="get"
				action="${pageContext.request.contextPath}/WeatherServlet">
				<input type="text" name="city" /><br> <input type="submit"
					value="search" />
			</form>
		</div>
		<div id="main">
			<h2>Outfits:</h2>
			<br>
			<table border="1" cellpadding="8" cellspacing="0">
				<tr>
					<th>Name of outfit</th>
					<th>Min temperature to dress</th>
					<th>Max temperature to dress</th>
					<c:if test="${role == 'administrator'}">
						<th>Edit</th>
					</c:if>
				</tr>
				<jsp:useBean id="outfits" scope="request" type="java.util.ArrayList" />
				<c:forEach items="${outfits}" var="outfit">
					<jsp:useBean id="outfit" type="entity.Outfit" />
					<tr>
						<td>${outfit.clothing}</td>
						<td>${outfit.minTemperature}</td>
						<td>${outfit.maxTemperature}</td>
						<c:if test="${role == 'administrator'}">
							<td><a
								href="${pageContext.request.contextPath}/EditOutfitsServlet?
								id=${outfit.id}&action=delete">Delete</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${role == 'administrator'}">
				<hr>
				<p>
					<a
						href="${pageContext.request.contextPath}/pages/admin/add_outfit.jsp">Add
						new outfit</a>
				</p>
			</c:if>
			<hr>
			<p>
				<a
					href="${pageContext.request.contextPath}/pages/moderator/logged_index.jsp">Go
					back to the start page</a>
			</p>
		</div>

		<div id="footer">
			<p>Copyright © Margarita Skokova, 2020</p>
		</div>
</body>
</html>

