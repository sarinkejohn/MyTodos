<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="common/footer.jspf" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body>

	<div class="container ">
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
