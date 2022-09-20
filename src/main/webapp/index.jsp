<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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

	<%
	String m=(String)session.getAttribute("msg");
	if(m!=null){
	%>
		<p style="padding:10px;background-color:yellow;"> <%=m %> </p> 
		<%-- <script> alert("<%=m %>"); </script> --%>
	<%	
		session.setAttribute("msg",null);
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
            <a class="nav-link" data-toggle="modal" data-target="#adminModal">Admin</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="User.jsp">User</a>
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
    <div class="py-5 px-2 c-heading"  data-aos="fade-right" data-aos-duration="1000" >
      <h1>Welcome to <br/> BluePilot</h1>
      <p>
        BluePilot Helicopter Flight School has been training all kinds of Helicopter pilot since 1999.  
      </p>
      <button data-toggle="modal" data-target="#enquiryModal">Get In Touch</button>
    </div>
  </header>
  <section class="bg-light py-5 px-3">
    <div class="container">
      <div class="row text-center" data-aos="zoom-in" data-aos-duration="1000">
        <div class="col-sm">
          <i class="fa-solid fa-people-group fa-2x text-primary"></i>
          <h5 class="my-2">Best Instructors</h5>
          <small>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione iure, eligendi animi repellendus veniam esse.
          </small>
        </div>
        <div class="col-sm">
          <i class="fa-solid fa-crosshairs fa-2x text-primary"></i>
          <h5 class="my-2">Exiciting Locations</h5>
          <small>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione iure, eligendi animi repellendus veniam esse.
          </small>
        </div>
        <div class="col-sm">
          <i class="fa-solid fa-helicopter fa-2x text-primary"></i>
          <h5 class="my-2">Modern Helicopters</h5>
          <small>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione iure, eligendi animi repellendus veniam esse.
          </small>
        </div>
      </div>
    </div>
  </section>
  <section class="bg-dark p-5 text-center text-white">
      <h2>Our Courses</h2>
      <p><small>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit mollitia assumenda soluta, iusto praesentium tempora alias magnam ipsa enim aspernatur?</small></p>
      <div class="c-inline">
	<%
	com.incapp.dao.Dao d=new com.incapp.dao.Dao();
		ArrayList<HashMap> courses=d.getAllCourses();
		d.disconnect();
		for(HashMap course:courses){
	%>
     <div>
       <img src="GetCourseImage?name=<%=course.get("name") %>"  alt="">
       <p class="text-center"><b><%=course.get("name") %></b></p>
       <p class="text-center" style="border-top:1px solid gray;">&#8377; <%=course.get("fee") %> [ <%=course.get("duration") %> ]</p>
       <p><a href="CourseDetails.jsp?name=<%=course.get("name") %>" class="btn btn-sm btn-primary">Details</a></p>
     </div>
	<%		
		}
	%>
	</div>
    </section>
    <section class="container-fluid text-center my-5">
      <h2>Gallery</h2>
      <p class="px-5"><small>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit mollitia assumenda soluta, iusto praesentium tempora alias magnam ipsa enim aspernatur?</small></p>
      <div class="c-gallery">
        <a href="resources/img1.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img1.png" alt=""></a>
        <a href="resources/img2.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img2.png" alt=""></a>
        <a href="resources/img3.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img3.png" alt=""></a>
        <a href="resources/img4.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img4.png" alt=""></a>
        <a href="resources/img5.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img5.png" alt=""></a>
        <a href="resources/img6.png" data-toggle="lightbox" data-gallery="my-gallery"><img src="resources/img6.png" alt=""></a>
        
      </div>
    </section>
    <section class="bg-dark p-5">
      <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
          <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="resources/Banner1.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
              <button class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">Get In Touch</button>
            </div>
          </div>
          <div class="carousel-item">
            <img src="resources/Banner2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/Banner1.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </button>
      </div>
    </section>
    <section class="bg-light py-5 px-3 text-center">
      <h2>Our Team</h2>
      <p class="px-5"><small>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit mollitia assumenda soluta, iusto praesentium tempora alias magnam ipsa enim aspernatur?</small></p>
      <div class="container">
        <div class="row ">
          <div class="col-sm">
              <div class="c-card" data-aos="fade-up" data-aos-duration="1000">
                <img src="resources/person2.jpg" alt="">
                <p><small>Lorem ipsum dolor sit amet.</small></p>
              </div>
          </div>
          <div class="col-sm">
            <div class="c-card" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
              <img src="resources/person1.jpg" alt="">
              <p><small>Lorem ipsum dolor sit amet.</small></p>
            </div>
          </div>
          <div class="col-sm">
            <div class="c-card" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="500">
              <img src="resources/person2.jpg" alt="">
              <p><small>Lorem ipsum dolor sit amet.</small></p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3507.210774654972!2d77.51348691507906!3d28.4731983824809!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cea7e051fd949%3A0xefccd5003c9032b6!2sINCAPP!5e0!3m2!1sen!2sin!4v1652529139133!5m2!1sen!2sin"  height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </section>
    <footer class="bg-dark p-5 text-white">
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <a class="c-logo" href="index.html">
              <img src="resources/bluepilot.png" alt="">
              <span id="c-footer-logo">Blue<strong>Pilot</strong></span>
            </a>
            <p><small>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Blanditiis qui maxime vitae odit soluta sed rem fuga enim expedita dolore.</small></p>
            <p><small>&copy; 2022 Rights Reserved.</small></p>
          </div>
          <div class="col-sm-8">
            <h5>Enquiry Now!</h5>
            <form action="AddEnquiry" method="post"  class="form-inline">
              <div class="form-group m-1">
                <input type="text" name="name" pattern="[a-zA-Z ]+" maxlength="50" class="form-control" placeholder="Your Name" required />
              </div>
              <div class="form-group m-1">
                <input type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength="10" class="form-control" placeholder="Your Phone" required />
              </div>
              <div class="form-group m-1">
                <button type="submit" class="form-control btn btn-primary">Submit</button>
              </div>
            </form>
            <div class="row mt-5">
              <div class="col">
                <h5>Phone & Address!</h5>
                <p>
                  <i class="fa-solid fa-location-dot text-warning"></i>
                  5th floor, Om Tower, Alpha 1, Greater Noida
                </p>
                <p>
                  <i class="fa-solid fa-phone text-warning"></i>
                  9811XXXXXX,9811XXXXXX
                </p>
              </div>
              <div class="col">
                <h5>Get Social!</h5>
                <p id="c-social">
                  <a href="https://www.facebook.com/incapp"><i class="fa-brands fa-facebook fa-2x"></i></a>
                  <a href="https://www.instagram.com/incapp.in"><i class="fa-brands fa-instagram fa-2x"></i></a>
                  <a href="https://www.youtube.com/incapp"><i class="fa-brands fa-youtube fa-2x"></i></a>
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <a id="c-top-button" href="#" ><i class="fa-solid fa-circle-arrow-up fa-3x"></i></a>
</body>
<!-- Enquiry Modal -->
<div class="modal fade" id="enquiryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-light">
        <h5 class="modal-title" id="exampleModalLabel">Enquiry Now!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddEnquiry" method="post" class="form-inline" >
          <div class="form-group m-1">
            <input type="text" name="name" pattern="[a-zA-Z ]+" maxlength="50" class="form-control" placeholder="Your Name" required />
          </div>
          <div class="form-group m-1">
            <input type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength="10" class="form-control" placeholder="Your Phone" required />
          </div>
          <div class="form-group m-1">
            <button type="submit" class="form-control btn btn-primary">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Admin Modal -->
<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-light">
        <h5 class="modal-title" id="exampleModalLabel">Admin Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AdminLogin" method="post" class="form-inline" >
          <div class="form-group m-1">
            <input type="text" name="id"  maxlength="20" class="form-control" placeholder="Admin Id" required />
          </div>
          <div class="form-group m-1">
            <input type="password" name="password" maxlength="20" class="form-control" placeholder="password" required />
          </div>
          <div class="form-group m-1">
            <button type="submit" class="form-control btn btn-success">Login</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

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

    //script for light box
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
    });
    //script for AOS
    AOS.init();

</script>
</html>