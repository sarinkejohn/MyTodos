<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Todo List</title>
<!-- Bootstrap CSS -->
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

.container {
	margin-top: 30px;
}

.completed {
	color: green;
	font-weight: bold;
}

.not-completed {
	color: orange;
	font-weight: bold;
}

.status-label {
	font-weight: bold;
}

/* Optional styling for table in mobile view */
.table-responsive {
	margin-top: 20px;
}

/* Center the action buttons */
.action-buttons {
	margin-top: 30px;
	text-align: center;
}

/* Styling for the page heading */
h1 {
	font-size: 24px;
	color: #333;
}

.btn-custom {
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-warning {
	background-color: #ffc107;
	border-color: #ffc107;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-light bg-light mb-3 p-1">
		<a class="navbar-brand m-1" href="https://courses.in28minutes.com">in28Minutes</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="/list-todos">Todos</a></li>
			</ul>
		</div>
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
		</ul>	
	</nav>
	<div class="container">
		<h1 class="text-center mb-4 font-weight-bold">
			Todo List for <span>${name}</span>
		</h1>

		<!-- Responsive Table for Todo List -->
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>

						<th>Description</th>
						<th>Due Date</th>
						<th>Status</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${todos}" var="todo">
						<tr>

							<td>${todo.description}</td>
							<td>${todo.targetDate}</td>
							<td><span
								class="status-label ${todo.done ? 'completed' : 'not-completed'}">
									<c:choose>
										<c:when test="${todo.done}">
                                            Completed
                                        </c:when>
										<c:otherwise>
                                            Not Completed
                                        </c:otherwise>
									</c:choose>
							</span></td>
							<td><a href="update-todo?id=${todo.id}"
								class="btn btn-warning btn-custom">Update Todo</a></td>
							<td><a href="delete-todo?id=${todo.id}"
								class="btn btn-danger btn-custom">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- Action Buttons -->
		<div class="action-buttons">
			<a href="add-todo" class="btn btn-primary btn-custom me-2">Add
				New Todo</a>

		</div>
	</div>

	<!-- Bootstrap and jQuery Scripts -->
	<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
