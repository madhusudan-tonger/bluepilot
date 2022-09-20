<%@page import="java.util.*"%>
<%
String userName = (String) session.getAttribute("userName");
String userEmail = (String) session.getAttribute("userEmail");
if (userName == null) {
	session.setAttribute("msg", "Please Login!");
	response.sendRedirect("User.jsp");
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
			<a class="c-logo navbar-brand" href="UserHome.jsp"> <img
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
					<li class="nav-item"><a class="nav-link" href="UserHome.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="AllCourses.jsp">Courses</a>
					</li>
				</ul>
				<span class="text-white"> <img
					src="GetPhoto?email=<%=userEmail%>&userType=user" height="40"
					style="border-radius: 50%;" /> Welcome: <b><%=userName%></b> <a
					class="btn btn-danger" href="Logout">Logout</a>
				</span>
			</div>
		</nav>
	</header>

	<section>
		<div class="row">
			<div class="col-4 p-4 bg-warning ">
				<%
				String pilot_email = request.getParameter("pilot_email");
				com.incapp.dao.Dao d=new com.incapp.dao.Dao();
				HashMap pilot = d.getPilotByEmail(pilot_email);
				d.disconnect();
				%>
				<p>
					<img src="GetPhoto?email=<%=pilot_email%>&userType=pilot"
						height="40" style="border-radius: 50%;" /> Name:
					<%=pilot.get("name")%>
				</p>
				<p>
					Experience:
					<%=pilot.get("experience")%>
				</p>
				<p>
					Gender:
					<%=pilot.get("gender")%>
				</p>

				<div class="bg-secondary p-3">
					<form action="AskQuestion" method="post" class="form-group">
						<div class="form-group m-2">
							<label>Ask your Question:</label>
							<textarea rows="3" class="form-control" name="question"></textarea>
						</div>
						<div class="form-group m-2">
							<input type="hidden" name="pilot_email" value="<%=pilot_email%>" />
							<button type="submit" class="form-control btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-7 p-4 ">
				<h4 class="bg-light text-center p-2">Conversations</h4>
				<%
				d = new com.incapp.dao.Dao();
				ArrayList<HashMap> conversations = d.getConversation(userEmail, pilot_email);
				d.disconnect();
				for (HashMap conversation : conversations) {
				%>
				<div class="p-2 m-2 bg-info">
					<p>
						Question: [<%=conversation.get("question_date")%>]
						<br/>
						<b><%=conversation.get("question")%></b>
					</p>
					<%
						if(conversation.get("answer")!=null){
					%>
					<p>
						Answer: 
						<%=conversation.get("answer")%>
					</p>
					<%} %>
				</div>
				<%
				}
				%>
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