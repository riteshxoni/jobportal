<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<div class="row py-3 border mx-5 shadow-lg align-items-center">
 <div class="col-12 mt-3">
      <h3><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Address</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addAddress"><i class="fa-solid fa-plus"></i></a></span></h3>
      <c:if test="${not empty sessionScope.address }">
	      <div class="row mt-2">
		      <c:forEach var="add" items="${sessionScope.address}" varStatus="loop">
		      	<div class="col-12 col-md-6">
		      		<table class="table table-bordered">
				        <tr><td class="text-secondary fw-bold">Address type    </td><td class="fw-bold">${add.addressType } <a href="./edit/editAddress.jsp?id=${loop.index }" class="float-end fs-4"><i class="fa-solid fa-pencil"></i></a></td></tr>
				        <tr><td class="text-secondary fw-bold">Street    </td><td class="fw-bold">${add.street }</td></tr>
				        <tr><td class="text-secondary fw-bold">City           </td><td class="fw-bold">${add.city }</td></tr>
				        <tr><td class="text-secondary fw-bold">State            </td><td class="fw-bold">${add.state }</td></tr>
				        <tr><td class="text-secondary fw-bold">Pin Code            </td><td class="fw-bold">${add.pinCode }</td></tr>
				        <tr><td class="text-secondary fw-bold">Country      </td><td class="fw-bold">${add.country }</td></tr>
				        <tr><td class="text-secondary fw-bold">Landmark             </td><td class="fw-bold">${add.landmark }</td></tr>
			      	</table>
			      </div>
		      </c:forEach>
		     </div>
	   </c:if>
    </div>
 </div>