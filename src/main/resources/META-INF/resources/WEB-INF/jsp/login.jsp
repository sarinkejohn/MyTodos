<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="common/footer.jspf" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body class="body-login">

    <div class="login-container">
        <h2>Login to Your Account</h2>
        <div class="error">
            <pre>${errorMessage}</pre>
        </div>
        <form method="post">
            <input type="text" name="name" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>
