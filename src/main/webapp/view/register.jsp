<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope.currentUser }">
	<c:redirect url="/profile/profile.jsp" />
</c:if>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Portal | Create New Account</title>
  </head>
  <body>
    <div class="container-fluid p-0">
      
      <!-- Header Section -->
      <%@ include file="../components/header.jsp" %>

          <main class="p-2">
        <br><br><br><br><br><br><br>
        <div class="row justify-content-center">
            <div class="col-11 col-sm-8 col-md-6">
                 <h2 class="display-5 text-center fw-bold">Create New Account</h2>

                 <div class="alert alert-danger d-none">
                    <span id="error"></span>
                 </div>
               	
                <form action="${pageContext.request.contextPath}/UserController"  method="post" class="border p-3 my-4 job rounded" id="myreg" onsubmit="return validation()">
						<c:if test="${not empty sessionScope.existingUser}">
		               		<div class="alert alert-danger my-3">
		               			${sessionScope.existingUser} already exists! Please login!
		               		</div>
		               		<c:remove var="existingUser" scope="session"/>
						</c:if>
                        <label class="form-label fw-bold text-secondary">Name :    </label>
                        <input type="text"     name="name"     class="form-control mb-3" placeholder="Enter Name" onkeyup="val()">
                        
                        <label class="form-label fw-bold text-secondary">Email :   </label>
                        <input type="email"    name="email"    class="form-control mb-3" placeholder="Enter Email" onkeyup="val()">
                        
                        <label class="form-label fw-bold text-secondary">Password  </label>
                        <input type="password" name="password" class="form-control mb-3" placeholder="Enter Password" onkeyup="val()">
                        
                        <label class="form-label fw-bold text-secondary">Select Gender :</label>
                        Men   <input type="radio" value="men" name="gender" class="form-check-input" onclick="val()">
                        Women <input type="radio" value="women" name="gender" class="form-check-input mb-3" onclick="val()">
                        <br>
                        <label class="form-label fw-bold text-secondary">Select City : </label>
                        <select name="city" class="form-select mb-3" onchange="val()">
                            <option value="">Select City</option>
                            <option value="Bengaluru">  Bengaluru</option>
                            <option value="Hyderabad">  Hyderabad</option>
                            <option value="Chennai">    Chennai</option>
                            <option value="Pune">       Pune</option>
                            <option value="Mumbai">     Mumbai</option>
                            <option value="Kolkata">    Kolkata</option>
                            <option value="Kochi">      Kochi</option>
                            <option value="Ahmedabad">  Ahmedabad</option>
                            <option value="Chandigarh"> Chandigarh</option>
                        </select>

                        <label class="form-label fw-bold text-secondary">Select Fields:</label><br>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Software Development" onclick="val()">
                          <label class="form-check-label">Software Development</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Network Administration" onclick="val()">
                          <label class="form-check-label">Network Administration</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="System Administrator" onclick="val()">
                          <label class="form-check-label">System Administrator</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Cybersecurity" onclick="val()">
                          <label class="form-check-label">Cybersecurity</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Data Analysis" onclick="val()">
                          <label class="form-check-label">Data Analysis</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="IT Support" onclick="val()">
                          <label class="form-check-label">IT Support</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Other IT Roles" onclick="val()">
                          <label class="form-check-label">Other IT Roles</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="IT Auditor" onclick="val()">
                          <label class="form-check-label">IT Auditor</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm w-100 mb-3 animate">Create Account</button>
                        <p class="alert alert-info">
                            By clicking above you agree to our <b>Terms & Conditions</b> and our <b>Privacy Policy</b>.
                        </p>
                        <p class="text-center fw-bold">or ...</p>
                        <div class="text-center">
                            <a href="./login.jsp" class="btn btn-success btn-sm w-25 animate">Login</a>
                        </div>
                </form>
            </div>
        </div>
      </main>
    
    
      <!-- Footer Section -->
  	<%@ include file="../components/footer.jsp" %>
    </div>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>