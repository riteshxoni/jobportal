<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${empty sessionScope.currentUser }">
		<c:redirect url="/view/login.jsp"/>
	</c:if>
	
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <div class="container-fluid p-0">
      
      <!-- Header Section -->
      <%@ include file="./components/header.jsp" %>
      <%@ include file="./components/modals.jsp" %>

		 <br><br><br><br><br>
		 
      <main>
      	
      	<%@ include file="./components/about.jsp" %>
      	
      	<%@ include file="./components/address.jsp" %>
      	
      	<%@ include file="./components/skills.jsp" %>
      	
		<%@ include file="./components/education.jsp" %>
		
		<%@ include file="./components/experience.jsp" %>
		
		<%@ include file="./components/project.jsp" %>
		
		<%@ include file="./components/social.jsp" %>
		
		<%@ include file="./components/applied.jsp" %>
		
		<%@ include file="./components/resume.jsp" %>
		
        <div class="px-5 py-2">
          <button type="button" class="btn btn-primary">Hire Me</button>
          <button type="button" class="btn btn-secondary">Follow Me</button>
        </div>
        
      </main>
      
      <!-- Footer Section -->
  	<%@ include file="/components/footer.jsp" %>
  	
  	
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>