<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Todo Page</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
<style>
body {
	font-family: 'Roboto', sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #fff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
	max-width: 480px;
	width: 100%;
}

h3 {
	font-size: 28px;
	margin-bottom: 24px;
	color: #333;
	font-weight: 600;
	text-align: center;
}

.form-label {
	font-size: 16px;
	color: #555;
	font-weight: 500;
}

.form-control {
	border-radius: 8px;
	padding: 12px;
	margin-bottom: 18px;
	border: 1px solid #ced4da;
	font-size: 16px;
	transition: border-color 0.3s ease;
}

.form-control:focus {
	border-color: #28a745;
	box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
}

.btn-submit {
	width: 100%;
	padding: 14px;
	font-size: 18px;
	border-radius: 8px;
	background-color: #28a745;
	border: none;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-submit:hover {
	background-color: #218838;
	transform: scale(1.05);
}

.text-center {
	font-size: 16px;
}

.back-link {
	text-decoration: none;
	color: #007bff;
	font-weight: bold;
	border: 2px solid #007bff;
	padding: 12px 24px;
	border-radius: 8px;
	transition: background-color 0.3s, color 0.3s;
	display: inline-block;
	margin-top: 20px;
}

.back-link:hover {
	background-color: #007bff;
	color: white;
}

.form-error {
	color: #e74c3c;
	font-size: 14px;
	margin-top: -12px;
}

.fieldset {
	border: none;
}
</style>
</head>
<body>

	<div class="container">
		<h3>Enter Todo Details</h3>

		<!-- Form for adding todo -->
		<form:form action="" method="post" modelAttribute="todo">
			<div class="mb-3">

				<fieldset class="fieldset">
					<form:label for="description" path="description" class="form-label">Description</form:label>
					<form:input type="text" path="description" id="description" class="form-control" required="required" placeholder="Enter your task description" />
					<form:errors path="description" cssClass="form-error" />
				</fieldset>
				
				<fieldset class="fieldset">
					<form:label for="targetDate" path="targetDate" class="form-label">Target Date</form:label>
					<form:input type="text" path="targetDate" id="targetDate" class="form-control" required="required" placeholder="MM/DD/YYYY" />
					<form:errors path="targetDate" cssClass="form-error" />
				</fieldset>

				<form:input type="hidden" path="id" class="form-control" />
				<form:input type="hidden" path="done" class="form-control" />
			</div>

			<button type="submit" class="btn-submit">Add Todo</button>
		</form:form>

		<!-- Link to manage todos -->
		<div class="text-center">
			<a href="list-todo" class="back-link">Go to Todo List</a>
		</div>
	</div>

	<!-- Bootstrap and jQuery Scripts -->
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
	
	<!-- Bootstrap Datepicker Scripts -->
	<script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

	<script>
		$(document).ready(function() {
			// Initialize the date picker on targetDate input
			$('#targetDate').datepicker({
				format: 'mm/dd/yyyy',
				autoclose: true,
				todayHighlight: true
			});
		});
	</script>

</body>
</html>
