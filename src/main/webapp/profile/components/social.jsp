<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty sessionScope.currentUser }">
	<c:redirect url="/view/login.jsp"/>
</c:if>
<div class="row p-3 border mx-5 shadow-lg align-items-center">
      <div class="col-12 mt-3">
            <h3 class="fw-normal"><span class="h2 fw-bold border-bottom border-4 border-primary pe-2 pb-1">Social Links</span><span class="fs-3 float-end"><a data-bs-toggle="modal" data-bs-target="#addSocial"><i class="fa-solid fa-plus"></i></a></span></h3>
            <div class="row col-auto mt-4 fs-4 mx-auto">
              <div class="col"><i class="fa-brands fa-facebook" style="color:#1877F2;"></i></div>
              <div class="col"><i class="fa-brands fa-x-twitter" style="color:#000000;"></i></div>
              <div class="col"><i class="fa-brands fa-linkedin" style="color:#0A66C2;"></i></div>
              <div class="col"><i class="fa-brands fa-instagram" style="color:#E4405F;"></i></div>
              <div class="col"><i class="fa-brands fa-github" style="color:#181717;"></i></div>
              <div class="col"><i class="fa-brands fa-youtube" style="color:#FF0000;"></i></div>
              <div class="col"><i class="fa-brands fa-whatsapp" style="color:#25D366;"></i></div>
              <div class="col"><i class="fa-brands fa-telegram" style="color:#0088cc;"></i></div>
              <div class="col"><i class="fa-brands fa-discord" style="color:#5865F2;"></i></div>
              <div class="col"><i class="fa-brands fa-stack-overflow" style="color:#F48024;"></i></div>
              <div class="col"><i class="fa-brands fa-medium" style="color:#12100E;"></i></div>
              <div class="col"><i class="fa-brands fa-reddit" style="color:#FF4500;"></i></div>
              <div class="col"><i class="fa-brands fa-pinterest" style="color:#E60023;"></i></div>
            </div>
      </div>
</div>