<%@page import="util.UserAccount"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Weather forecast and clothing tips</title>
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
			The weather is wonderful in
			<%=request.getAttribute("city")%>
			today!
		</h1>
	</div>
	<div id="wrapper">

		<div id="menu">
			<form method="get"
				action="${pageContext.request.contextPath}/OutfitsServlet">
				<p>
					Outfit list <input type="submit" value="enter">
				</p>

			</form>
			<hr>
			<p>
				<c:if test="${role == 'moderator'}">
					<p>Hello, ${role}!</p>
					<form method="get"
						action="${pageContext.request.contextPath}/AuthenticationServlet">
						<input type="submit" value="log out" />
					</form>
				</c:if>
				<c:if test="${role == 'administrator'}">
					<p>Hello, ${role}!</p>
					<form method="get"
						action="${pageContext.request.contextPath}/AuthenticationServlet">
						<input type="submit" value="log out" />
					</form>
				</c:if>
				<c:if test="${role == null}">
					<br>
					<form method="post"
						action="${pageContext.request.contextPath}/AuthenticationServlet">
						<p>Login</p>
						<input required type="text" name="login" /><br>
						<p>Password</p>
						<input required="required" type="password" name="pass" /><br>
						<br> <input type="submit" value="Log in" />
					</form>
				</c:if>



				<br>
		</div>

		<div id="main">

			<div>

				<h3>Insert the name of the city to get the outfit advice</h3>
				<form method="get"
					action="${pageContext.request.contextPath}/WeatherServlet">
					<input type="text" name="city" id="field" /> <input type="submit"
						value="search" />
				</form>

				<br>
			</div>

			<div>


				<img
					src="https://yastatic.net/weather/i/icons/blueye/color/svg/<%=request.getAttribute("img")%>.svg"
					alt="погода" width="100">

				<p>Air temperature is ${temperature}&#176 Celsius. It's
					${condition} today.</p>
				<br>
				<p>Recommended clothing: ${outfit}.</p>
				<p>You may need ${accessories}.</p>
				<p>Have a nice walk!</p>


			</div>

		</div>
	</div>
	<div id="footer">
		<p>Copyright © Margarita Skokova, 2020</p>
	</div>
</body>
</html>