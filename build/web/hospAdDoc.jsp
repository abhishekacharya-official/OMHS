<%-- 
    Document   : hospAdDoc
    Created on : 10 Mar, 2017, 11:56:05 AM
    Author     : 1405299
--%>

 <%@page import="java.sql.Statement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
 
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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OMHS-<%= userName %></title>
    <link rel="icon" type="image/png" href="assets/img/health.png"/>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="hospIndex.jsp"><%= userName %></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="logout_hospital.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
					<li class="text-center">
                                        <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
					</li>
				    <li>
                        <a  href="hospIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    <li>
                        <a    href="hospApp.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a class="active-menu" href="hospAdDoc.jsp"><i class="fa fa-desktop fa-3x"></i> Add Doctor</a>
                    </li>
                    <li>
                        <a  href="hospVDoc.jsp"><i class="fa fa-qrcode fa-3x"></i> View Doctor</a>
                    </li>
		    <li>
			<a  href="hospEPro.jsp"><i class="fa fa-qrcode fa-3x"></i> Edit Profile</a>
		    </li>	 				
		    <li>
                        <a  href="hospSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a></li>	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Hospital Profile</h2>   
                        <h5>Welcome to Online Multipurpose Healthcare System. </h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                <h4>Welcome to Add Doctor.</h4>	
                
                <form id="msform" action="hAddDoc.jsp" method="post" onsubmit="return ValidateForm();">
                    
                <fieldset>
                  <h2 class="fs-title">Add Doctor to your organisation</h2>
                  <%
                    String s=(String) request.getAttribute("msg");
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
                    <div class="alert alert-danger " style="padding: 0px;border-radius: 3px;margin-bottom: 10px;width: 100%;box-sizing: border-box;font-size: 13px;"><h3 class="fs-subtitle"><%= s1 %></h3></div>
                    <%}%>
                  <input type="hidden" name="hname" value="<%=userName%>"  />
                  <input type="text" name="docid"  placeholder="Unique Doctor Id" required="required"/>
                  <input type="text" name="name"  placeholder="Doctor Name" required="required"/>
                  <input type="text" name="contact"  placeholder="Doctor Contact Number" required="required"/>
                  <input type="email" name="mail" placeholder="Doctor E-mail" required="required"/>
                  <input type="password" name="pass" id="pass1" placeholder="Doctor Password" required="required"/>
                  <input type="password" name="pass1" id="pass2" placeholder="Confirm Doctor Password" required="required"/>
                  <select id="department" class="form-control" name="dname" required="required">
                      <option value="" disabled selected>Department</option>
                <%
                    String dname;
                    try{
                        Connection con=connDao.getCon();
                        Statement stm=con.createStatement();
                        ResultSet rs=stm.executeQuery("select d_id from department");
                        while(rs.next()){
                            dname=rs.getString("d_id");%>
                            <option><%=dname%></option>
                        <%}
                        
                    }
                    catch(Exception e){
                        e.printStackTrace();
                        
                    }
                    %>
                  </select>
                  <br/>
                  <select id="SlotId" name="slots" class="form-control" required="required">
                  </select>
                  <br/>
                  <input type="submit" name="submit" class="submit action-button" value="Add Doctor" />
                  </fieldset> 
                </form>        
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
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
    
          var select = '';
          select += '<option value="" disabled selected >' + "No of Slots" + '</option>';
    for (i=1;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#SlotId').html(select);

    </script>
   
</body>
</html>
