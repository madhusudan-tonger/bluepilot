<%@page import="java.util.*"%>
<% 
	String userName=(String)session.getAttribute("userName");
	String userEmail=(String)session.getAttribute("userEmail");
	if(userName==null){
		session.setAttribute("msg", "Please Login!");
		response.sendRedirect("User.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
  <title>BluePilot</title>
  <link rel="icon" href="resources/bluepilot.png" />

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" integrity="sha512-6PM0qYu5KExuNcKt5bURAoT6KCThUmHRewN3zUFNaoI6Di7XJPTMoT6K0nsagZKk2OB4L7E3q1uQKHNHd4stIQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- Font Awesome End -->
  
  <!-- Lightbox CSS & Script -->
  <script src="resources/lightbox/ekko-lightbox.js"></script>
  <link rel="stylesheet" href="resources/lightbox/ekko-lightbox.css"/>
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
	<header>
	  <nav class="navbar navbar-expand-sm">
      <a class="c-logo navbar-brand" href="UserHome.jsp">
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
            <a class="nav-link" href="UserHome.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="AllCourses.jsp">Courses</a>
          </li>
        </ul>
        <span class="text-white">
        	<img src="GetPhoto?email=<%=userEmail %>&userType=user" height="40" style="border-radius:50%;" />
          Welcome: <b><%= userName %></b>
          <a class="btn btn-danger"  href="Logout">Logout</a>
        </span>
      </div>
    </nav>
	</header>
  
  	<section class="bg-dark p-5 text-center text-white">
  		<h2>User Enrollments</h2>
      <div class="c-inline">
	<%
	com.incapp.dao.Dao d=new com.incapp.dao.Dao();
		TreeSet<String> courseNames=d.getAllCoursesByUser(userEmail);
		
		for(String course_name: courseNames){
			HashMap course=d.getCoursesByName(course_name);
	%>
     <div>
       <img src="GetCourseImage?name=<%=course.get("name") %>"  alt="">
       <p class="text-center"><b><%=course.get("name") %></b></p>
       <p class="text-center" style="border-top:1px solid gray;">&#8377; <%=course.get("fee") %> [ <%=course.get("duration") %> ]</p>
       <p><a href="CourseDetails.jsp?name=<%=course.get("name") %>" class="btn btn-sm btn-primary">Details</a></p>
     </div>
	<%		
		}
		d.disconnect();
	%>
	</div>
  	</section>
  
	<a id="c-top-button" href="#" ><i class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
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
    $("#c-top-button").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });

    //script for AOS
    AOS.init();

</script>
</html>
<%		
	}
%>