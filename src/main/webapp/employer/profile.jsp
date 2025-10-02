<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employer Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="./style.css">
  </head>
  <body>
    <c:import url="/employer/components/header.jsp"/>
    <br><br><br>
    <div class="d-flex mt-5 mt-md-0">
        <div class="sidebar bg-primary" >
            <nav class="d-flex flex-column justify-content-between">
            	<div class="nav flex-column">
            		<div class="border-bottom border-3">
	                    <a href="#" class="nav-link" onclick="showSection('Profile')">
	                        <i class="bi bi-person-circle"></i>
	                        <span>Profile</span>
	                    </a>
	                </div>
	                <div class="border-bottom border-3">
	                    <a href="#" class="nav-link" onclick="showSection('Jobs')">
	                        <i class="bi bi-suitcase-lg-fill"></i>
	                        <span>Jobs</span> 
	                    </a>
	                </div>
	                <div class="border-bottom border-3">
	                    <a href="#" class="nav-link" onclick="showSection('Applications')">
	                        <i class="bi bi-window-stack"></i>
	                        <span>Applications</span>
	                    </a>
	                </div>
	                <div class="border-bottom border-3">
	                    <a href="#" class="nav-link" onclick="showSection('Settings')">
	                        <i class="bi bi-gear-fill"></i>
	                        <span>Settings</span>
	                    </a>
	                </div>
            	</div>
                <div class="border-bottom border-3">
                    <a href="${pageContext.request.contextPath}/EmployerLogin" class="nav-link ps-3">
                        <i class="bi bi-box-arrow-left"></i>
                        <span>LogOut</span>
                    </a>
                </div>
            </nav>
        </div>
        <div class="col-8 col-lg-10">
            <main class="main-section">
                <div id="Profile" class=" section">
                    <c:import url="./components/employer.jsp"/>
                </div>
                <div id="Jobs" class="d-none section">
                    <c:import url="./components/jobs.jsp"/>
                </div>
                <div id="Applications" class="d-none section">
                    <c:import url="./components/application.jsp"/>
                </div>
                <div id="Settings" class="d-none section">
                    <c:import url="./components/settings.jsp"/>
                </div>
            </main>
        </div>
    </div>
	<c:import url="/components/footer.jsp"/>
    <script>
        function showSection(sectionId)
        {
            document.querySelectorAll(".section").forEach( (item)=> item.classList.add('d-none'));
            document.getElementById(sectionId).classList.remove('d-none');
        }
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" ></script>
  </body>
</html>