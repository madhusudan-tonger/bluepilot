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
          
        </ul>
        <span>
          <a class="nav-link" href="tel:98XXXXXXXX">Call Us: +91-98XXXXXXXX</a>
        </span>
      </div>
    </nav>
	  <div class="py-5 px-2 c-heading"  data-aos="fade-right" data-aos-duration="1000" >
	    <h1>Exception Aaya Re!</h1>
	    <p>
	      Something went wrong.
	    </p>
	  </div>
	</header>
  
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