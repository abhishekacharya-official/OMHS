
<%@page import="Classes.JavaEmail"%>
<%@page import="java.util.Properties" %>
<%@page import="javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.mail.MessagingException;"%>
<%
	String message = null;
	String status = null;
        
                if (request.getParameter("submit") != null) {

                            JavaEmail javaEmail = new JavaEmail();
                            javaEmail.setMailServerProperties();
                            String emailSubject = "Contact Form";
                            String emailBody = "";
                            if (request.getParameter("name") != null) {
                                    emailBody = "Sender Name: " + request.getParameter("name")
                                                    + "<br>";
                            }
                            if (request.getParameter("email") != null) {
                                    emailBody = emailBody + "Sender Email: "
                                                    + request.getParameter("email") + "<br>";
                            }
                            if (request.getParameter("phone") != null) {
                                    emailBody = emailBody + "Sender Phone: "
                                                    + request.getParameter("phone") + "<br>";
                            }
                            if (request.getParameter("message") != null) {
                                    emailBody = emailBody + "Message: " + request.getParameter("message")
                                                    + "<br>";
                            }
                            javaEmail.createEmailMessage(emailSubject, emailBody);
                            try {
                                    javaEmail.sendEmail();
                                    status = "success";
                                    message = "Email sent Successfully!";
                            } 

                            catch (MessagingException me) {
                                    status = "error";
                                    message = "Error in Sending Email!";
                            }
	}
        
%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/png" href="assets/img/health.png"/>
  <title>OMHS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="assets/css/index.css">

    <!--FOR NAV BAR]-->
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="assets/css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    
 <!--END OF NAV BAR-->
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script> 
    
</head>

<body>
   
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: rgba(0,0,0,.5);">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbaropt" >
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" rel="home" href="#"><img src="assets/img/health.png" style="max-width:30px; margin-top: -9px;margin-bottom: -10px;"></a>
	</div>
	
	<div class="collapse navbar-collapse" style="margin-left: 40%;" id="navbaropt">
		
		<ul class="nav navbar-nav" >
			<li><a href="#Home" style="margin-right: 25px;">Home</a></li>
			<li><a href="#About" style="margin-right: 25px;">About us</a></li>
			<li><a href="#Contact_us" >Contact</a></li>
		</ul>

		
    </div>
</div>
</div>

 <div class="sect sectOne" id="Home" >
    
    
    <div id="main" class="container"  >
       
	<div>
            <h3  style=" font-weight:bold;margin-bottom:1em;margin-top:8em;">For Patients</h3>
            <section style="margin-bottom:1em;">
		<button id="js-trigger-overlay" type="button" onclick="location.href='login_patient.jsp';">Login</button>
            </section>
            <section style="margin-bottom:1em;">
		<button id="js-trigger-overlay" type="button" onclick="location.href='register_patient.jsp';">Sign Up</button>
            </section>
	</div>
	<div>
            <h3 style="text-align:center; font-weight:bold;margin-bottom:1em;">For Doctors</h3>
            <section style="margin-bottom:1em;">
                <button id="js-trigger-overlay" type="button" onclick="location.href='login_doctor.jsp';">Login</button>
            </section>
	</div>
	<div>
            <h3 style="text-align:center; font-weight:bold;margin-bottom:1em;">For Hospitals</h3>
            <section style="margin-bottom:1em;">
		<button id="js-trigger-overlay" type="button" onclick="location.href='login_hospital.jsp';">Login</button>
	    </section>
	    <section style="margin-bottom:1em;">
		<button id="js-trigger-overlay" type="button" onclick="location.href='register_hospital.jsp';">Sign Up</button>
            </section>
	</div>
</div>
</div>
 <div class="subSect" id="About" >
 	<div class="section-title center">
        <h2 style="text-align:center">Meet <strong>our team</strong></h2>
        <div class="line">
        <hr><br>
    	</div>
    </div>
    		<div class="cont">
    	        <div class="row">
            <div class="col-sm-4 col-md-2">
                <img class="img-circle img-responsive img-center" src="assets/img/1.jpeg" style="width:100px">
                <h2>Abhishek Acharya</h2>
                <p>ScrumMaster, UI/UX</p>
            </div>
            <div class="col-sm-4 col-md-2">
                <img class="img-circle img-responsive img-center" src="assets/img/2.jpg" style="width:100px" >
                <h2>Animesh Acharya</h2>
                <p>UI/UX, AJAX</p>
            </div>
            <div class="col-sm-4 col-md-2">
                <img class="img-circle img-responsive img-center" src="assets/img/3.jpg" style="width:100px">
                <h2>Dinesh Panda</h2>
                <p>Product Developer</p>
            </div>
              <div class="col-sm-4 col-md-2" id="ia" >
                <img class="img-circle img-responsive img-center" src="assets/img/4.jpg" style="width:100px">
                <h2>Kunja Bihari Mishra</h2>
                <p>Documentation</p>
            </div>
              <div class="col-sm-4 col-md-2" >
                <img class="img-circle img-responsive img-center" src="assets/img/5.jpeg" style="width:100px">
                <h2>Ashish Behera</h2>
                <p>Documentation</p>
            </div>
        </div>
       </div>
 </div>
 <div class="sect sectTwo" id="Contact_us">
 	<form id="msform" method="post" >
  <!-- fieldsets -->
            <fieldset>
              <h2 class="fs-title">Contact Us</h2>
              <h3 class="fs-subtitle">Feel Free to Contact Us</h3>
              <input type="text" name="name" placeholder="Your Name" required="required" />
              <input type="email" name="email" placeholder="Your Email" required="required" />
              <input type="number" name="phone" placeholder="Your Phone Number" required="required" />
              <textarea name="message" placeholder="Your Message" required="required"></textarea>
              
              <input type="reset" name="reset" class="reset action-button" value="Reset" />
              <input type="submit" name="submit" class="submit action-button" value="Submit" />
            </fieldset>
  
	</form>
 </div>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>