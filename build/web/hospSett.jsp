<%-- 
    Document   : hospSett
    Created on : 10 Mar, 2017, 12:02:12 PM
    Author     : 1405299
--%>

 <%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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

<%
    String hreg=null,hemail=null;
       
    try{
        Connection con=connDao.getCon();
        Statement stm=con.createStatement();
        ResultSet rs=stm.executeQuery("select h_regis,h_email from hospital_login where h_id ='"+userName+"'");
        while(rs.next()){
            hreg=rs.getString("h_regis");
            hemail=rs.getString("h_email");
            
        }     
    }
    catch(Exception e){
        e.printStackTrace();
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
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				    <li>
                        <a  href="hospIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                    <li>
                        <a    href="hospApp.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a  href="hospAdDoc.jsp"><i class="fa fa-desktop fa-3x"></i> Add Doctor</a>
                    </li>
                    <li>
                        <a  href="hospVDoc.jsp"><i class="fa fa-qrcode fa-3x"></i> View Doctor</a>
                    </li>
		    <li>
			<a  href="hospEPro.jsp"><i class="fa fa-qrcode fa-3x"></i> Edit Profile</a>
		    </li>	 				
		    <li>
                        <a class="active-menu" href="hospSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Settings</h2>   
                        <h5>Welcome to Settings</h5>
                    </div>
                </div>       <hr />         
                 <!-- /. ROW  -->
                 <form id="msform" action="setHospUpdate.jsp" onsubmit="return ValidateForm();" method="post">
                     <%     
                        String stext=(String) request.getAttribute("textae1");
                        if(stext!=null){
                    %>
                        <div class="alert alert-success"><%=stext%></div>
                    <% } %> 
                    <%     
                        String stext1=(String) request.getAttribute("erru");
                        if(stext1!=null){
                    %>
                        <div class="alert alert-success"><%=stext1%></div>
                    <% } %> 
                    <fieldset>
                            <h2 class="fs-title">Change your Password/Hospital Registration No.</h2>
                            <input type="text" name="uname" value="<%= userName %>"  readonly="readonly"/>
                            <input type="text" name="hregno" placeholder="Hospital Registration No." value="<%=hreg%>" required="required" readonly="readonly"/>
                            <input type="email" name="hemail" placeholder="Email ID" value="<%=hemail%>" required="required" readonly="readonly" />
                            <input type="password" name="pass" placeholder="Old Password" required="required" />
                            <table>
                              <tr>
                                  <td><input type="password" id="pass1" name="pass1" placeholder="New Password" required="required" style="margin-right:7em" /></td>
                                  <td><input type="password" id="pass2" name="pass2" placeholder="Confirm New Password" required="required" style="margin-right:7em"/></td>
                              </tr>
                            </table>
                            <input type="reset" name="reset" class="reset action-button" value="Reset" />
                            <input type="submit" name="submit" class="submit action-button" value="Submit" />
                    </fieldset>
                           
               </form>  
            
                 <!-- /. ROW  -->           
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
    </script>
   
</body>
</html>
