<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	text-align: center;
}

.container {
	background-color: #fff;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
	color: #333;
}

p {
	font-size: 18px;
	color: #555;
}

a {
	text-decoration: none;
	color: #4CAF50;
	font-weight: bold;
	border: 2px solid #4CAF50;
	padding: 10px 20px;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

a:hover {
	background-color: #4CAF50;
	color: white;
}

.manage {
	margin-top: 20px;
	font-size: 16px;
}

.welcome-text {
	font-size: 20px;
	color: #333;
	margin-bottom: 30px;
}
</style>
</head>
<body>

	<div class="container">
		<h1>Welcome to Your Todo App</h1>
		<p class="welcome-text">
			Welcome aboard, <span id="name">${name}</span>!
		</p>
		<div class="manage">
			<a href="list-todo">Manage Your Todos</a>
		</div>
	</div>

</body>
<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</html>

