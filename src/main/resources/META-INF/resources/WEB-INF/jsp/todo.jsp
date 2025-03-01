<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="common/header.jspf" %>
<body>
   
<%@ include file="common/navigation.jspf" %>

    <div class="container mt-4">
        <div class="container-box">
            <h3>Enter Todo Details</h3>

            <!-- Form for adding a todo -->
            <form:form action="" method="post" modelAttribute="todo">
                <div class="mb-3">
                    <form:label path="description" class="form-label">Description</form:label>
                    <form:input type="text" path="description" id="description" class="form-control" required="required" placeholder="Enter task description" />
                    <form:errors path="description" cssClass="form-error" />
                </div>

                <div class="mb-3">
                    <form:label path="targetDate" class="form-label">Target Date</form:label>
                    <form:input type="text" path="targetDate" id="targetDate" class="form-control" required="required" placeholder="MM/DD/YYYY" />
                    <form:errors path="targetDate" cssClass="form-error" />
                </div>

                <form:input type="hidden" path="id" />
                <form:input type="hidden" path="done" />

                <button type="submit" class="btn-submit">Add Todo</button>
            </form:form>

            <!-- Link to manage todos -->
            <div class="text-center">
                <a href="list-todo" class="back-link">Go to Todo List</a>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

    <script>
        $(document).ready(function () {
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
