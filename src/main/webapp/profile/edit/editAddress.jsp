<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address Details</title>
</head>
<body>

	<%@ include file="../components/header.jsp" %>
	 <br><br><br><br><br><br>
	
	<div class="container">
	
		<h1 class="my-2 display-4 text-center">Edit Address Details</h1>
		<c:if test="${not empty sessionScope.address }">
		<c:set var="add" value="${sessionScope.address[param.id]}" scope="session"/>
          <form action="${pageContext.request.contextPath}/AddressController" method="post" >
          	<input type="hidden" name="method" value="PUT">
          	<input type="hidden" name="index" value="${param.id }">
            <table class="table table-borderless">
              <tr>
                <td><label class="form-label">Address type : </label></td>
                <td><input type="text" name="address_type" class="form-control mb-3" value="${add.addressType }"></td>
              </tr>
              <tr>
                <td><label class="form-label">Street :</label></td>
                <td><input type="text" name="street" class="form-control mb-3" value="${add.street }"></td>
              </tr>
              <tr>
                <td><label class="form-label">City :</label></td>
                <td><input type="text" name="city" class="form-control mb-3" value="${add.city }"></td>
              </tr>
              <tr>
                <td><label class="form-label">State :</label></td>
                <td><input type="text" name="state" class="form-control mb-3" value="${add.state }"></td>
              </tr>
               <tr>
                <td><label class="form-label">Pin Code :</label></td>
                <td><input type="text" name="pin_code" class="form-control mb-3" value="${add.pinCode }"></td>
              </tr>
               <tr>
                <td><label class="form-label">Country :</label></td>
                <td><input type="text" name="country" class="form-control mb-3" value="${add.country }"></td>
              </tr>
               <tr>
                <td><label class="form-label">Landmark :</label></td>
                <td><input type="text" name="landmark" class="form-control mb-3" value="${add.landmark }"></td>
              </tr>
              <tr>
              	<td></td>
                <td>
	                <Button type="submit" class="btn btn-warning text-white fw-bold mb-3">Update Address</Button>
	                <a href="${pageContext.request.contextPath }/AddressController?index=${param.id}&method=DELETE" class="btn btn-danger fw-bold mb-3">Delete Address</a>
                </td>
              </tr>
            </table>
          </form>
        </c:if>
   </div>


	<%@ include file="/components/footer.jsp" %>

</body>
</html>