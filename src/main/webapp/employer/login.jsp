<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${not empty sessionScope.currentEmployer }">
	<c:redirect url="/employer/profile.jsp" />
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employer SignIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" >
  </head>
  <body>
	<c:import url="/employer/components/header.jsp"/>
	<br><br><br><br>
    <div class="container mb-5">
        <div class="row justify-content-center">
            <h1 class="text-center display-3 fw-bold my-4 text-primary">Employer Login</h1>
            <div class="col-11 col-md-6 border p-4 rounded-3 shadow-lg">
                <form action="${pageContext.request.contextPath}/EmployerLogin" method="post">
                	<c:if test="${not empty sessionScope.result }">
                		<div class="alert alert-danger py-3">${sessionScope.result }</div>
                		<c:remove var="result" scope="session"/>
                	</c:if>
                    <label class="form-label fw-medium">Email : </label>
                    <input type="email" name="email"  class="form-control mb-3" placeholder="eg: Amazon@gmail.com" required>
                    <label class="form-label fw-medium">Password : </label>
                    <input type="password" name="password"  class="form-control mb-3" required>
                    <div class="text-center my-4">
                        <button type="submit" class="btn btn-primary w-50">SignIn</button>
                    </div>
                </form>
                <div class="text-center">
                	<p>Dont't have an account?</p>
					<a href="./signup.jsp" class="btn btn-success btn-sm">SignUp</a>
                </div>
				
            </div>
        </div>
    </div>
    <c:import url="/components/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>