<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
        <div class="border-top my-3 mx-5 border p-3">
            <h3 class="fw-normal">Resume Details </h3>
            <div>
            	<button class="btn btn-primary me-3" data-bs-toggle="modal" data-bs-target="#uploadResume">
		            <i class="fa-solid fa-plus"></i> 
		            <c:choose>
		            	<c:when test="${not empty user.resume }">
		            		Update Resume
		            	</c:when>
		            	<c:otherwise>
		            		Upload Resume
		            	</c:otherwise>	
		            </c:choose>
		            	
	            </button>
	            <c:if test="${not empty user.resume }">
	            	 <a href="${pageContext.request.contextPath}/ResumeController" class="btn btn-success" >
			            <i class="fa-solid fa-download"></i>
			            Download Resume
		            </a>
	            </c:if>
           		
	            
            </div>
            <div class="mt-3">
	            <a href="components/createResume.jsp" class="btn btn-secondary" >
		            <i class="fa-solid fa-file"></i>
			        Build YourResume 
	            </a>
	        </div>
            
           
        </div>
	
</body>
</html>