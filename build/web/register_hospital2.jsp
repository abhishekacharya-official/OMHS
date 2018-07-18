 <%
            //allow access only if session exists
            String uname = null;
            if(session.getAttribute("huname") == null){
                    response.sendRedirect("login_hospital.jsp");
            }else uname = (String) session.getAttribute("huname");
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                    if(cookie.getName().equals("huname")) userName = cookie.getValue();
                    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
            }
            }else{
                    sessionID = session.getId();
            }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Hospital Details</title>
  <link rel="icon" type="image/png" href="assets/img/health.png"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="assets/css/register.css">
    <link rel="stylesheet" href="assets/css/register.css">
      <script language="Javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
    <script type="text/JavaScript" src='assets/js/state.js'></script>
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
      <li><a href="index.html#Home" style="margin-right: 25px;">Home</a></li>
      <li><a href="index.html#About" style="margin-right: 25px;">About us</a></li>
      <li><a href="index.html#Contact_us" >Contact</a></li>
    </ul>

		
	</div>
</div>
    <br>
<!-- multistep form -->
<form id="msform" action="reg_hospital2.jsp" method="post" autocomplete="on">

  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">Hospital Details</h2>
    <input type="text" name="uname" value="<%= userName %>" readonly/>
    <input type="text" name="hname"  placeholder="Name of Hospital" required="required" pattern="/^[A-Za-z]*{3,30}\s{1}[A-Za-z]*{3,100}$/" title="only alphabets" /> 
    <input type="tel" name="contact" placeholder="Contact " required pattern="^[7-9]\d{9}$" title="Invalid number" />
    <textarea name="address" placeholder="Address" required  ></textarea>
  <div class="form-group">
      <select id="state" name="state" class="form-control" onchange='selct_district(this.value)' required></select>
            <br>
            <select id='cities' name="city" class="form-control" required></select>
  </div><!--drop down-->
    <input type="reset" name="reset" class="reset action-button" value="Reset" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" />
  </fieldset>
</form>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</body>
</html>
