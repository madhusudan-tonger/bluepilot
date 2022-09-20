<%@page import="java.util.*"%>

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
      <a class="c-logo navbar-brand" href="index.jsp">
        <img src="resources/bluepilot.png" alt="">
        <span>Blue<strong>Pilot</strong></span>
      </a>
      <button class="navbar-toggler text-white" type="button" data-toggle="collapse" data-target="#my-navbar" >
        <i class="fa-solid fa-bars"></i> Menu
      </button>
      <div class="collapse navbar-collapse " id="my-navbar">
        <ul class="navbar-nav mx-auto">
        <!-- <ul class="navbar-nav ml-auto">--> <!--Right -->
        <!-- <ul class="navbar-nav mr-auto">--> <!--Left -->
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="Pilot.jsp">Pilot</a>
          </li>
        </ul>
        <span>
          <a class="nav-link" href="tel:98XXXXXXXX">Call Us: +91-98XXXXXXXX</a>
        </span>
      </div>
    </nav>
	</header>

	<section>
		<div class="row">
			<div class="col-sm-5 p-4  ">
				<h4 class="bg-light text-center p-2">Pilot LOGIN</h4>
				<form action="PilotLogin" method="post" class="form-group">
					<div class="form-group m-2">
						<label>Pilot Email:</label>
						<input type="email" name="email"  
							class="form-control" placeholder="Pilot Email" required />
					</div>
					<div class="form-group m-2">
						<label>Pilot Password:</label>
						<input type="password" name="password" class="form-control"
							placeholder="Pilot Password" required />
					</div>
					<div class="form-group m-2">
						<button type="submit" class="form-control btn btn-primary">LOGIN</button>
					</div>
				</form>
			</div>
			<div class="col-sm-5 p-4  ">
				<h4 class="bg-light text-center p-2">Pilot Registration</h4>
				<form action="PilotRegister" method="post" class="form-group"
					enctype="multipart/form-data">
					<div class="form-group m-2">
						<label>Pilot Email:</label>
						<input type="email" name="email"  
							class="form-control" placeholder="Pilot Email" required />
					</div>
					<div class="form-group m-2">
						<label>Pilot Name:</label>
						<input type="text" name="name"  pattern="[a-zA-Z ]+"
							class="form-control" placeholder="Pilot Name" required />
					</div>
					<div class="form-group m-2">
						<label>Pilot Phone:</label>
						<input type="tel" name="phone"  pattern="[0-9]+" maxlength="10" minlength="10"
							class="form-control" placeholder="Pilot Phone" required />
					</div>
					<div class="form-group m-2">
						<label>Pilot Experience:</label>
						<input type="number" name="experience"  max="80" min="1"
							class="form-control" placeholder="Pilot Experience" required />
					</div>
					<div class="form-group m-2">
						<label>Gender:</label>
						<input type="radio" name="gender" value="male" checked/>Male
						<input type="radio" name="gender" value="female"  />Female
					</div>
					<div class="form-group m-2">
						<label>Pilot Address:</label>
						<textarea rows="3" name="address" class="form-control"
							placeholder="Pilot Address" required></textarea>
					</div>
					<div class="form-group m-2">
						<label>Pilot Photo:</label>
						<input type="file" name="photo" class="form-control"  required/>
					</div>
					<div class="form-group m-2">
						<label>Pilot Password:</label>
						<input type="password" name="password" class="form-control"
							placeholder="Pilot Password" required />
					</div>
					<div class="form-group m-2">
						<button type="submit" class="form-control btn btn-primary">REGISTER</button>
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