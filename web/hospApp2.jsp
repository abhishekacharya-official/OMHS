<%-- 
    Document   : hospApp2
    Created on : 22 Mar, 2017, 3:17:15 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>

<%-- 
    Document   : hospApp
    Created on : 10 Mar, 2017, 11:57:13 AM
    Author     : 1405299
--%>

 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Classes.connDao"%>
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
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.css" />
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
                <a class="navbar-brand" href="hospIndex.jsp">Hospital Profile</a> 
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
                        <a class="active-menu"   href="hospApp.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Appointments</a>
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
                        <a  href="hospSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a>
                    </li>	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Hospital Profile</h2>   
                        <h5>See Appointments </h5>
                    </div>
                </div>   
                
                <table class="table table-hover table-responsive" >
                
                <thead style="background-color:grey;color:white;">
                  <tr>
                    <th>Appointment Id</th>
                    <th>Patient Id</th>
                    <th>Doctor Id</th><!-- use style="display:none" if hidden is not working -->
                    <th>Patient Name</th>
                    <th>Patient Age</th>
                    <th>Patient Gender</th>
                    <th>Patient Contact</th>
                    <th>Patient Address</th>
                  </tr>
                </thead>
<%
    
        String date1a=request.getParameter("datec");
        String dept1=request.getParameter("dept1a");
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date1 = sdf1.parse(date1a);
        java.sql.Date dateas = new java.sql.Date(date1.getTime()); 
         try{
            String pid=null, pname=null,doc_id=null,gender=null,cont=null,addr=null; int age=0,vid=0;
            Connection con=connDao.getCon();
            String query="select v_app_id,v_p_id,v_doc_id,v_name,v_age,v_gender,v_contact,v_addr from visiting where v_h_id=? and v_app_date=? and v_d_id=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, userName);
            stm.setDate(2, dateas);
            stm.setString(3, dept1);
            ResultSet rs=stm.executeQuery();
            while(rs.next()){
                vid=rs.getInt("v_app_id");
                pid=rs.getString("v_p_id");
                doc_id=rs.getString("v_doc_id");
                pname=rs.getString("v_name");
                age=rs.getInt("v_age");
                gender=rs.getString("v_gender");
                cont=rs.getString("v_contact");
                addr=rs.getString("v_addr");
%>              
<tbody>
                <tr>
                <td><%=vid%></td>
                <td><%=pid%></td>
                <td><%=doc_id%></td>
                <td><%=pname%></td>
                <td><%=age%></td>
                <td><%=gender%></td>
                <td><%=cont%></td>
                <td><%=addr%></td>
                </tr>
</tbody>
            <% }
         }
         catch(Exception e){
             e.printStackTrace();
         }
%>
                
                
                </table>
                

               <hr />         
                 <!-- /. ROW  -->
             
                 <!--  <tr onclick="window.location='docTodApp_Pres.html'" style="cursor:pointer;"> -->

                  
                	
            
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
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>

      
    
   
</body>
</html>

