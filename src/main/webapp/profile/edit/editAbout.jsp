<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<c:set var="user" value="${sessionScope.currentUser }" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Personal Details</title>
	<script type="text/javascript">
	
		function changeGender(gender) {
			document.getElementById("gender").value = gender;
		}
		
		function changerCity() {
			document.getElementById("city").value = document.getElementById("selectedCity").value;
		}
	
		
		function add() {
		    const input = document.getElementById("fields");
		    const checkboxes = document.querySelectorAll('input[type="checkbox"][name="fields"]');
	
		    let selectedFields = [];
	
		    checkboxes.forEach(cb => {
		      if (cb.checked) {
		        selectedFields.push(cb.value);
		      }
		    });
	
		    input.value = selectedFields.join(", ");
		  }
		
	</script>
</head>
<body>

		<%@ include file="../components/header.jsp" %>
	 <br><br><br><br><br><br>
	
	<div class="container">
	
			<h1 class="my-2 display-4 text-center">Edit Personal Details</h1>
	
       

          <form action="${pageContext.request.contextPath }/UserController" method="post">
          	<input type="hidden" name="method" value="PUT">
            <table class="table table-borderless">
              <tr>
                <td><label class="form-label">Name :</label></td>
                <td><input type="text" name="name" class="form-control mb-3" value="${user.name }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Father`s Name :</label></td>
                <td><input type="text" name="father_name" class="form-control mb-3" value="${user.fatherName }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Mother` Name :</label></td>
                <td><input type="text" name="mother_name" class="form-control mb-3" value="${user.motherName }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Gender :</label></td>
                <td>
                <input id="gender" type="text" class="form-control mb-3" name="gender" value="${user.gender }" >
                <label class="form-label fw-bold text-secondary">Select Gender :</label>
                 Men   <input  type="radio" value="men" name="gender" class="form-check-input" onclick="changeGender('men')">
                 Women <input  type="radio" value="women" name="gender" class="form-check-input mb-3" onclick="changeGender('women')">
                </td>
              </tr>
              <tr>
                <td><label class="form-label">DOB :</label></td>
                <td><input type="date" name="dob" class="form-control mb-3" value="${user.dob }"></td>
              </tr>
               <tr>
                <td><label class="form-label">Email :</label></td>
                <td><input type="email" name="email" class="form-control mb-3" value="${user.email }" disabled="disabled"></td>
              </tr>
               <tr>
                <td><label class="form-label">Phone :</label></td>
                <td><input type="text" name="phone" class="form-control mb-3" value="${user.phone }"></td>
              </tr>
               <tr>
                <td><label class="form-label">Nationality :</label></td>
                <td><input type="text" name="nationality" class="form-control mb-3" value="${user.nationality }"></td>
              </tr>
             
              <tr>
                <td><label class="form-label">City :</label></td>
                <td>
                <input id="city" type="text" class="form-control mb-3" name="city" value="${user.city }">
                <select id="selectedCity" name="city" class="form-select mb-3" onchange="changerCity()">
                     <option value="">Select City</option>
                     <option value="Bengaluru">  Ranchi</option>
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
                </td>
              </tr>

              <tr>
                <td><label class="form-label">Marital Status :</label></td>
                <td><input type="text" name="marital_Status" class="form-control mb-3" value="${user.maritalStatus }"></td>
              </tr>

              <tr>
                <td><label class="form-label">Language :</label></td>
                <td><input type="text" name="language" class="form-control mb-3" value="${user.language }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Objective :</label></td>
                <td><input type="text" name="heading" class="form-control mb-3" value="${user.heading }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Fields :</label></td>
                <td>
                <input id="fields" type="text" class="form-control mb-3" name="fields" value="${user.fields }">
                <label class="form-label fw-bold text-secondary">Select Fields:</label><br>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Software Development" onclick="add()">
                          <label class="form-check-label">Software Development</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Network Administration" onclick="add()">
                          <label class="form-check-label">Network Administration</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="System Administrator" onclick="add()">
                          <label class="form-check-label">System Administrator</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Cybersecurity" onclick="add()">
                          <label class="form-check-label">Cybersecurity</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Data Analysis" onclick="add()">
                          <label class="form-check-label">Data Analysis</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="IT Support" onclick="add()">
                          <label class="form-check-label">IT Support</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="Other IT Roles" onclick="add()">
                          <label class="form-check-label">Other IT Roles</label>
                        </div>

                        <div class="form-check">
                          <input type="checkbox" name="fields" class="form-check-input" value="IT Auditor" onclick="add()">
                          <label class="form-check-label">IT Auditor</label>
                        </div>
                
                </td>
              </tr>
             
             <tr>
                <td><label class="form-label">Title :</label></td>
                <td><input type="text" name="title" class="form-control mb-3" placeholder="Title" value="${user.title }"></td>
              </tr>
              
              <tr>
                <td></td>
                <td><Button type="submit" class="btn btn-danger mb-3">Update</Button></td>
              </tr>
            </table>
          </form>
   </div>


	<%@ include file="/components/footer.jsp" %>

</body>
</html>