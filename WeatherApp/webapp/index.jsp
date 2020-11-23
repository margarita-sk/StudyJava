<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1>Dress for weather</h1>

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
			<c:if test="${error != null}">${error}<br>
			</c:if>

			<form method="post"
				action="${pageContext.request.contextPath}/AuthenticationServlet">
				<p>Login</p>
				<input required type="text" name="login" /><br>
				<p>Password</p>
				<input required="required" type="password" name="pass" /><br>
				<br> <input type="submit" value="Log in" />
			</form>

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
				<c:if test="${error_weather} != null">${error_weather}</c:if>
				<br> <br>
				<h2>Why is it important to dress appropriately for the weather?</h2>
				<br>
				<p>If you dress for the weather you will feel warm in winter and
					not hot in summer. This will reduce the likelihood of getting sick
					and you will enjoy your walk more. However, there are days when you
					don't know how to dress. Changeable weather happens regardless of
					the season. But, especially often it happens in autumn and spring.
					People outside the window can dress completely differently. Some
					wear T-shirts, while others wear jackets. If you want to receive
					dress advice - just insert the name of your city.</p>
			</div>

		</div>
	</div>
	<div id="footer">
		<p>Copyright © Margarita Skokova, 2020</p>
	</div>
</body>
</html>