<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Registration form</title>
  
  <link rel="icon" type="image/png" href="assets/img/health.png"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="assets/css/register.css">
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
 <style type="text/css">
   html {
    background-image: url("assets/img/patient_image.jpg");
    background-repeat: no-repeat;
    background-size: cover;
}
 </style>

  
</head>

<body>
  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" >
	
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" rel="home" href="#"><img src="assets/css/health.png" style="max-width:30px; margin-top: -9px;margin-bottom: -10px;"></a>
	</div>
	
	<div class="collapse navbar-collapse" style="margin-left: 40%;">
		
		<ul class="nav navbar-nav" >
			<li><a href="index.jsp#Home" style="margin-right: 25px;">Home</a></li>
			<li><a href="index.jsp#About" style="margin-right: 25px;">About us</a></li>
			<li><a href="index.jsp#Contact_us" >Contact</a></li>
		</ul>

		
	</div>
</div>
    <br>
<!-- multistep form -->
<form id="msform" action="reg_patient.jsp" method="post" onsubmit="return ValidateForm();">
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Create your account</h2>
        <%
            String s=(String) request.getAttribute("err");
            if (s!=null){
        %>
        <div class="alert alert-danger  " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s %></h3></div>
        <%}%>
        <%
            String s1=(String) request.getAttribute("err1");
            if (s1!=null){
        %>
        <div class="alert alert-danger " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s1 %></h3></div>
        <%}%>
        <%
            String s2=(String) request.getAttribute("err2");
            if (s2!=null){
        %>
        <div class="alert alert-danger " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s2 %></h3></div>
        <%}%>
        <%
            String s3=(String) request.getAttribute("err3");
            if (s3!=null){
        %>
        <div class="alert alert-danger " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s2 %></h3></div>
        <%}%>
        
    <input type="text" name="pid" placeholder="Enter a User ID" required pattern="^[A-Za-z0-9_@]{5,15}$" title="alphanumeric letters with '@','_' (min 5 and max 15)" />
    <input type="email" name="pemail" placeholder="Email" required pattern="(?!(^[.-].*|[^@]*[.-]@|.*\.{2,}.*)|^.{254}.)([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@)(?!-.*|.*-\.)([a-zA-Z0-9-]{1,63}\.)+[a-zA-Z]{2,15}" title="invalid email"/>
    <input type="password" name="pass" id="pass1" placeholder="Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="invalid password (UpperCase, LowerCase, Number/SpecialChar and min 8 Chars)"/>
    <input type="password" name="cpass" id="pass2" placeholder="Confirm Password" required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="invalid password (UpperCase, LowerCase, Number/SpecialChar and min 8 Chars)" />
    <input type="reset" name="reset" class="reset action-button" value="Reset" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" />
  </fieldset>
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function ValidateForm() {
        var password = document.getElementById("pass1").value;
        var confirmPassword = document.getElementById("pass2").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
    

</body>
</html>
