<%@page import="java.util.*"%>
<%
String adminName = (String) session.getAttribute("adminName");
if (adminName == null) {
	session.setAttribute("msg", "Please Login!");
	response.sendRedirect("index.jsp");
} else {
%>
<!DOCTYPE html>
<html>
<head>
<title>BluePilot</title>
<link rel="icon" href="resources/bluepilot.png" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	integrity="sha512-6PM0qYu5KExuNcKt5bURAoT6KCThUmHRewN3zUFNaoI6Di7XJPTMoT6K0nsagZKk2OB4L7E3q1uQKHNHd4stIQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Font Awesome End -->

<!-- Lightbox CSS & Script -->
<script src="resources/lightbox/ekko-lightbox.js"></script>
<link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css" />
<!-- Lightbox END -->

<!-- AOS css and JS -->
<link rel="stylesheet" href="resources/aos/aos.css">
<script src="resources/aos/aos.js"></script>
<!-- AOS css and JS END-->

<!-- custom css-->
<link rel="stylesheet" href="resources/custom.css" />
<!-- custom css END-->

<meta name="author" content="Rahul Chauhan" />
<meta name="description" content="This is a website for Pilot Courses." />
<meta name="keywords" content="best pilot training in the world" />
</head>

<body>

	<%
	String m = (String) session.getAttribute("msg");
	if (m != null) {
	%>
	<p style="padding: 10px; background-color: yellow;">
		<%=m%>
	</p>
	<%-- <script> alert("<%=m %>"); </script> --%>
	<%
	session.setAttribute("msg", null);
	}
	%>

	<header>
		<nav class="navbar navbar-expand-sm">
			<a class="c-logo navbar-brand" href="adminHome.jsp"> <img
				src="resources/bluepilot.png" alt=""> <span>Blue<strong>Pilot</strong></span>
			</a>
			<button class="navbar-toggler text-white" type="button"
				data-toggle="collapse" data-target="#my-navbar">
				<i class="fa-solid fa-bars"></i> Menu
			</button>
			<div class="collapse navbar-collapse " id="my-navbar">
				<ul class="navbar-nav mx-auto">
					<!-- <ul class="navbar-nav ml-auto">-->
					<!--Right -->
					<!-- <ul class="navbar-nav mr-auto">-->
					<!--Left -->
					<li class="nav-item"><a class="nav-link" href="adminHome.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="adminCourses.jsp">Courses</a>
					</li>
					<li class="nav-item">
            			<a class="nav-link" href="adminPilots.jsp">Pilots</a>
          			</li>
				</ul>
				<span class="text-white"> Welcome: <b><%=adminName%></b> <a
					class="btn btn-danger" href="Logout">Logout</a>
				</span>
			</div>
		</nav>
	</header>

	<section>
		<%
		String name = request.getParameter("name");
		com.incapp.dao.Dao d = new com.incapp.dao.Dao();
		HashMap course = d.getCoursesByName(name);
		TreeSet<String> emails=d.getAllPilotsEmail();
		TreeSet<String> assignedPilotEmails=d.getAllPilotsEmailByCourse(name);
		
		d.disconnect();
		%>
		<div class="row">
			<div class="col-4 p-4 bg-warning ">
				<div>
					<img src="GetCourseImage?name=<%=course.get("name")%>" alt="">
					<p><b><%=course.get("name") %></b></p>
       				<p style="border-top:1px solid gray;">
       					&#8377; <%=course.get("fee") %> [ <%=course.get("duration") %> ]
       				</p>
       				<p><b><%=course.get("content") %></b></p>
				</div>
				<div>
					<%
					for(String email:assignedPilotEmails){
					%>
					<p>
  						<img src="GetPhoto?email=<%=email %>&userType=pilot" height="40" style="border-radius:50%;" /> 
  						<b><%=email %></b> 
  					</p>
					<%
					}
					%>
				</div>
				<div class="bg-light p-3">
					
					<form action="AssignPilotCourse" method="post" class="form-group">
						<div class="form-group m-2">
							<label>Select Pilot:</label>
							<select name="pilot_email"  class="form-control"> 
								<%
								for(String email:emails){
								%>
								<option><%=email %></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group m-2">
							<input type="hidden" name="course_name" value="<%=course.get("name")%>" />
							<button type="submit" class="form-control btn btn-primary">Assign Pilot</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-4 p-4 ">
				<h4 class="bg-light text-center p-2">Update Course</h4>
				<form action="UpdateCourse" method="post" class="form-group"
					enctype="multipart/form-data">
					<div class="form-group m-2">
						<label>Course Name:</label>
						<input type="text" name="name" value="<%=course.get("name") %>" pattern="[a-zA-Z ]+" maxlength="50"
							class="form-control" placeholder="Course Name" required />
					</div>
					<div class="form-group m-2">
						<label>Course Fee:</label>
						<input type="number" name="fee" value="<%=course.get("fee") %>" min='0' class="form-control"
							placeholder="Course Fee" required />
					</div>
					<div class="form-group m-2">
						<label>Course Duration:</label>
						<input type="text" name="duration" value="<%=course.get("duration") %>" class="form-control"
							placeholder="Course Duration" required />
					</div>
					<div class="form-group m-2">
						<label>Course Content:</label>
						<textarea rows="5" name="content" class="form-control"
							placeholder="Course Content" required><%=course.get("content") %></textarea>
					</div>
					<div class="form-group m-2">
						<label>Course Image:</label>
						<input type="file" name="image" class="form-control"  />
					</div>
					<div class="form-group m-2">
						<input type="hidden" name="oldName" value="<%=course.get("name")%>" />
						<button type="submit" class="form-control btn btn-primary">Update
							Course</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<a id="c-top-button" href="#"><i
		class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
</body>

<script>
	//Script for Scroll to Top button for hide and show
	$(window).scroll(function() {
		if ($(this).scrollTop()) {
			$('#c-top-button').fadeIn();
		} else {
			$('#c-top-button').fadeOut();
		}
	});
	//script for scroll to top
	$("#c-top-button").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, 1000);
	});

	//script for AOS
	AOS.init();
</script>
</html>
<%
}
%>