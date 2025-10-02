<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope.currentUser }">
	<c:redirect url="/profile/profile.jsp" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Success!</title>
</head>
<body>
	<jsp:include page="/components/header.jsp" />
		
	<br><br><br><br><br><br><br>
      <main>
        <div class="text-center bg-light p-5">
            <h1 class="fw-bold text-success my-4">Thank you for register!</h1>
            <p>Please check your e-mail for further instructions on how to complete the sign-up process or login.</p>
            <p class="my-4">Any questions? <a href="contact.jsp" class="text-decoration-none">Contact Us.</a></p>
            <a href="login.jsp" class="btn btn-primary">Login</a>
        </div>  
      </main>
		
	<jsp:include page="/components/footer.jsp" />
</body>
</html>