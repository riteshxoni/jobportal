<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Job Portal Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body>
  
  
<div class="modal fade w-100" id="addSkills">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="mb-0">Add Your Skill</h5>
      </div>
      <div class="modal-body">
        <form action="${pageContext.request.contextPath}/SkillsController" method="POST">

          <!-- Skill Input -->
          <div class="mb-3">
            <label  class="form-label">Skill</label>
            <input type="text" class="form-control" name="skill" placeholder="e.g. Java, React, SQL" required>
          </div>

          <!-- Proficiency Dropdown -->
          <div class="mb-3">
            <label class="form-label">Proficiency</label>
            <select class="form-select" name="proficiency">
              <option value="Beginner">Beginner</option>
              <option value="Intermediate" selected>Intermediate</option>
              <option value="Advanced">Advanced</option>
              <option value="Expert">Expert</option>
            </select>
          </div>

          <div class="mt-3 d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">Save Skill</button>
            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

  
      <div class="modal fade w-100" id="addSocial">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header bg-primary text-white">
		        <h5 class="mb-0">Add Social Link</h5>
		      </div>
		      <div class="modal-body">
		        <form action="submit-social" method="POST">
		
		          <!-- Social Link Input -->
		          <div class="row g-3 align-items-center mb-3">
		            <div class="col-md-12">
		              <label for="link" class="form-label">Social Link</label>
		              <input type="text" class="form-control" id="link" name="links[]" placeholder="https://facebook.com/yourprofile" required>
		            </div>
		
		            <!-- Platform Dropdown -->
		            <div class="col-12">
		              <label for="platform" class="form-label">Platform</label>
		              <select class="form-select icon-select" id="platform" name="platform[]" required>
		                <option value="">-- Select Platform --</option>
		                <option value="facebook" data-icon="fa-brands fa-facebook" data-color="#1877F2">Facebook</option>
		                <option value="twitter" data-icon="fa-brands fa-x-twitter" data-color="#000000">Twitter (X)</option>
		                <option value="linkedin" data-icon="fa-brands fa-linkedin" data-color="#0A66C2">LinkedIn</option>
		                <option value="instagram" data-icon="fa-brands fa-instagram" data-color="#E4405F">Instagram</option>
		                <option value="github" data-icon="fa-brands fa-github" data-color="#181717">GitHub</option>
		                <option value="youtube" data-icon="fa-brands fa-youtube" data-color="#FF0000">YouTube</option>
		                <option value="whatsapp" data-icon="fa-brands fa-whatsapp" data-color="#25D366">WhatsApp</option>
		                <option value="telegram" data-icon="fa-brands fa-telegram" data-color="#0088cc">Telegram</option>
		                <option value="discord" data-icon="fa-brands fa-discord" data-color="#5865F2">Discord</option>
		                <option value="stackoverflow" data-icon="fa-brands fa-stack-overflow" data-color="#F48024">StackOverflow</option>
		                <option value="medium" data-icon="fa-brands fa-medium" data-color="#12100E">Medium</option>
		                <option value="reddit" data-icon="fa-brands fa-reddit" data-color="#FF4500">Reddit</option>
		                <option value="pinterest" data-icon="fa-brands fa-pinterest" data-color="#E60023">Pinterest</option>
		              </select>
		            </div>
		
		            <!-- Add More Button -->
		            <div class="col-12 d-grid">
		              <button type="button" class="btn btn-success" id="addSkill">+ Add</button>
		            </div>
		          </div>
		
		          <!-- Dynamic Skills List -->
		          <div id="skillsList"></div>
		
		          <!-- Submit / Reset -->
		          <div class="mt-3">
		            <button type="submit" class="btn btn-primary">Save Links</button>
		            <button type="reset" class="btn btn-outline-secondary">Clear</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Script to show icons inside select -->
		<script>
		  document.addEventListener("DOMContentLoaded", function () {
		    const select = document.getElementById("platform");
		
		    select.addEventListener("change", function () {
		      const selected = this.options[this.selectedIndex];
		      const icon = selected.getAttribute("data-icon");
		      const color = selected.getAttribute("data-color");
		
		      if (icon) {
		        this.style.backgroundImage = `url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><foreignObject width="20" height="20"><i xmlns="http://www.w3.org/1999/xhtml" class="${icon}" style="color:${color}; font-size:18px;"></i></foreignObject></svg>')`;
		        this.style.backgroundRepeat = "no-repeat";
		        this.style.backgroundPosition = "8px center";
		        this.style.paddingLeft = "2rem";
		      }
		    });
		  });
		</script>

		
		<script>
		  // JS to clone skill row
		  document.getElementById("addSkill").addEventListener("click", function() {
		    const skillsList = document.getElementById("skillsList");
		
		    const row = document.createElement("div");
		    row.className = "row g-3 align-items-center mb-3";
		
		    row.innerHTML = `
		      <div class="col-12">
		        <input type="text" class="form-control" name="skills[]" placeholder="e.g. Spring Boot" required>
		      </div>
		      <div class="col-6">
		        <select class="form-select" name="proficiency[]">
		          <option value="Beginner">Beginner</option>
		          <option value="Intermediate" selected>Intermediate</option>
		          <option value="Advanced">Advanced</option>
		          <option value="Expert">Expert</option>
		        </select>
		      </div>
		      <div class="col-6 d-grid">
		        <button type="button" class="btn btn-danger removeSkill">Remove</button>
		      </div>
		    `;
		
		    // remove button event
		    row.querySelector(".removeSkill").addEventListener("click", function() {
		      row.remove();
		    });
		
		    skillsList.appendChild(row);
		  });
		</script>
     
      
      
      <div class="modal fade" id="addEducation">
           <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5">Add Education</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/EducationController" method="post" class="p-2">
                    <label class="form-label text-secondary fw-medium">School / University : </label>
                    <input type="text" name="school" class="form-control mb-3" placeholder="eg. Ranchi University">
                    <label class="form-label text-secondary fw-medium">Course / Degree :         </label>
                    <input type="text" name="degree" class="form-control mb-3" placeholder="eg. 10th/Inter/BCA/B.Tech">
                    <label class="form-label text-secondary fw-medium">Passing Year :   </label>
                    <input type="text" name="passingyear" class="form-control mb-3" placeholder="eg. 2025">
                    <label class="form-label text-secondary fw-medium">Marks :          </label>
                    <input type="text" name="grade" class="form-control mb-3" placeholder="eg. 70 %">
                    <button type="submit" class="btn btn-primary">Add Education</button>
                  </form>
                </div>
              </div>
           </div>
      </div>
      
      <div class="modal fade" id="addExperience">
           <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5">Add Experience Details</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/ExperienceController" method="post" class="p-2">
                    <label class="form-label text-secondary fw-medium">Company : </label>
                    <input type="text" name="company" class="form-control mb-3" placeholder="eg. Amazon">
                    <label class="form-label text-secondary fw-medium">Location :         </label>
                    <input type="text" name="location" class="form-control mb-3" placeholder="eg. Delhi">
                    <label class="form-label text-secondary fw-medium">Start Date :   </label>
                    <input type="text" name="start_date" class="form-control mb-3" placeholder="eg. 2022">
                    <label class="form-label text-secondary fw-medium">End Date :   </label>
                    <input type="text" name="end_date" class="form-control mb-3" placeholder="eg. 2025">
                    <label class="form-label text-secondary fw-medium">Job Title :          </label>
                    <input type="text" name="job_title" class="form-control mb-3" placeholder="eg. Java Developer ">
                    <label class="form-label text-secondary fw-medium">Skills Used : </label>
                    <input type="text" name="skills_used" class="form-control mb-3" placeholder="eg. Spring/React">
                    <label class="form-label text-secondary fw-medium">Description :    </label>
                    <textarea  name="description" class="form-control mb-3" placeholder="Your Description"></textarea>
                    <button type="submit" class="btn btn-primary">Add Experience</button>
                  </form>
                </div>
              </div>
           </div>
      </div>
      
      
      <div class="modal fade" id="addAddress">
           <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5">Add Address</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <form action="${pageContext.request.contextPath }/AddressController" method="post" class="p-2">
                    <label class="form-label text-secondary fw-medium">Address type : </label>
                    <input type="text" name="address_type" class="form-control mb-3" placeholder="eg. Permenent/Temperory">
                    <label class="form-label text-secondary fw-medium">Street :         </label>
                    <input type="text" name="street" class="form-control mb-3" placeholder="eg. Ratu Road">
                    <label class="form-label text-secondary fw-medium">City :         </label>
                    <input type="text" name="city" class="form-control mb-3" placeholder="eg. Ranchi">
                    <label class="form-label text-secondary fw-medium">State :   </label>
                    <input type="text" name="state" class="form-control mb-3" placeholder="eg. Jharkhand">
                    <label class="form-label text-secondary fw-medium">Pin Code :   </label>
                    <input type="text" name="pin_code" class="form-control mb-3" placeholder="eg. 835222">
                    <label class="form-label text-secondary fw-medium">Country :          </label>
                    <input type="text" name="country" class="form-control mb-3" placeholder="eg. India ">
                    <label class="form-label text-secondary fw-medium">Landmark : </label>
                    <input type="text" name="landmark" class="form-control mb-3" placeholder="eg. Near Pahadi Mandir">
                    <button type="submit" class="btn btn-primary">Add Address</button>
                  </form>
                </div>
              </div>
           </div>
      </div>
      
      <div class="modal fade mt-5" id="editprofilepic">
        <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="text-center">Edit Profile Picture</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/ProfileController" method="post" class="text-center" enctype="multipart/form-data">
                    <img src="${pageContext.request.contextPath}/images/profile_pics/${user.photo}" class="img-thumbnail rounded-circle border p-2" style="width:250px;height: 250px">
                    <input type="file" name="photo" class="form-control my-3" required>
                    <button type="submit" class="btn btn-primary">Update Profile Pic</button>
                  </form>
              </div>
          </div>
        </div>
      </div>
      
      <div class="modal fade mt-5" id="uploadResume">
        <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="text-center">Upload Resume</h1>
              </div>
              <div class="modal-body">
                  <form action="${pageContext.request.contextPath}/ResumeController" method="post" class="text-center" enctype="multipart/form-data">
                    <input type="file" name="resume" class="form-control my-3" required>
                    <button type="submit" class="btn btn-primary">Upload Resume</button>
                  </form>
                  
              </div>
          </div>
        </div>
      </div>
      
      <div class="modal fade" id="addProject">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title fs-5">Add New Project</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <form action="${pageContext.request.contextPath}/ProjectController" method="post">
                  <label class="form-label fw-bold text-secondary">Title : </label><input class="form-control mb-2" type="text" name="project_title">
                  <label class="form-label fw-bold text-secondary">Your Role : </label><input class="form-control mb-2" type="text" name="role">
                  <label class="form-label fw-bold text-secondary">Technologies Used : </label><input class="form-control mb-2" type="text" name="technologies">
                  <label class="form-label fw-bold text-secondary">Start Date : </label><input class="form-control mb-2" type="date" name="start_date">
                  <label class="form-label fw-bold text-secondary">End Date : </label><input class="form-control mb-2" type="date" name="end_date">
                  <label class="form-label fw-bold text-secondary">Project Site URL : </label><input class="form-control mb-2" type="text" name="project_url">
                  <label class="form-label fw-bold text-secondary">GitHub URL : </label><input class="form-control mb-2" type="text" name="github_url">
                  <label class="form-label fw-bold text-secondary">Description : </label><textarea class="form-control mb-2" name="description"></textarea>
                  <button type="submit" class="btn btn-primary">Add Project</button>
              </form>
          </div>
        </div>
      </div>
  </div>
      
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>