<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentEmployer }">
	<c:redirect url="/employer/login.jsp" />
</c:if>

<c:set var="emp" value="${sessionScope.currentEmployer }" scope="session" />

<div class="container my-4">
    <div class="row justify-content-center">
    	<h3 class="mb-3"><span class="h2 fw-bold border-bottom border-4 border-primary">Update Employer</span></h3>
        <div class="col-12 border rounded-3 shadow-lg">
            <form action="${pageContext.request.contextPath }/EmployerController" method="post">
            	<input type="hidden" name="method" value="PUT">
                <label class="form-label fw-medium">Company Name : </label>
                <input type="text" name="company_name"  class="form-control mb-3" value="${emp.company_name }" >
                <label class="form-label fw-medium">Email : </label>
                <input type="email" name="email"  class="form-control mb-3" value="${emp.email }" readonly>
                <label class="form-label fw-medium">Industry Type : </label>
                <input type="text" name="industry_type"  class="form-control mb-3" value="${emp.industry_type }" >
                <label class="form-label fw-medium">Location : </label>
                <input type="text" name="location"  class="form-control mb-3" value="${emp.location }" >
                <label class="form-label fw-medium">Website : </label>
                <input type="text" name="website"  class="form-control mb-3" value="${emp.website }" >
                <label class="form-label fw-medium">Hr Name : </label>
                <input type="text" name="hr_name"  class="form-control mb-3" value="${emp.hr_name }" >
                <label class="form-label fw-medium">Hr Email : </label>
                <input type="text" name="hr_email"  class="form-control mb-3" value="${emp.hr_email }" >
                <label class="form-label fw-medium">Hr phone : </label>
                <input type="text" name="hr_phone"  class="form-control mb-3" value="${emp.hr_phone }" >
                <label class="form-label fw-medium">About Company : </label>
                <textarea name="about" class="form-control" rows="4">${emp.about }</textarea>
                <div class="text-center my-4">
                    <button type="submit" class="btn btn-primary w-50">Update Profile</button>
                </div>
            </form>
        </div>
    </div>
</div>