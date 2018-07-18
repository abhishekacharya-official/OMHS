<%-- 
    Document   : userMyA
    Created on : 10 Mar, 2017, 12:12:33 PM
    Author     : 1405299
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%
            //allow access only if session exists
            String uname = null;
            if(session.getAttribute("uname") == null){
                    response.sendRedirect("login_patient.jsp");
            }
            else
                uname = (String) session.getAttribute("uname");
            
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if(cookies !=null){
            for(Cookie cookie : cookies){
                    if(cookie.getName().equals("uname")) userName = cookie.getValue();
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
                <a class="navbar-brand" href="userIndex.jsp"><%= userName %></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="logout_patient.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                
                    
                   <li>
                        <a   href="userIndex.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                     <li>
                        <a  href="userAddA.jsp"><i class="fa fa-desktop fa-3x"></i> Add Appointment</a>
                    </li>
                    <li>
                        <a class="active-menu" href="userMyA.jsp"><i class="fa fa-qrcode fa-3x"></i> My Appointments</a>
                    </li>
						   <li  >
                        <a   href="userPres.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Prescriptions</a>
                    </li>
                    <li>
                        <a href="userEditPro.jsp"><i class="fa fa-dashboard fa-3x"></i> Edit Profile</a>
                    </li>				
					
					                   
                    
                  <li>
                        <a  href="userSett.jsp"><i class="fa fa-square-o fa-3x"></i> Settings</a>
                    </li>	   
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>My Appointments</h2>   
                        <h5>Welcome to My Appointments. </h5>
                       
                    </div>
                </div>
  <hr />
                <div class="tableC">
                            <table class="table table-hover table-responsive"  >
                        
                        <thead style="background-color:grey;color:white;">
                          <tr>
                            <th>Date of Appointment<br/>(yyyy-mm-dd)</th>
                            <th>Hospital Name</th>
                            <th>Hospital Address</th>
                            <th>Hospital Contact</th>
                            <th>Department</th>
                            <th>Doctor Name</th>
                            <th>Date of Booking<br/>(yyyy-mm-dd)</th>
                            <th>Appointment for</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                                    String hosp_state=null, hosp_addr=null,hosp_city=null,addr=null;
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
                                    Date today = dateFormat.parse(dateFormat.format(new Date()));     
                                    java.sql.Date sqlDate = new java.sql.Date(today.getTime());
                                    Connection con=connDao.getCon();
                                    String query="select * from visiting join hospital_details on visiting.v_h_id=hospital_details.h_id join doctor_details on hospital_details.h_id=doctor_details.doc_h_id where visiting.v_p_id=? and visiting.v_app_date>=?";
                                    PreparedStatement stm=con.prepareStatement(query);
                                    stm.setString(1, userName);
                                    stm.setDate(2,sqlDate);
                                    ResultSet rs=stm.executeQuery();
                                    while(rs.next()){
                                        hosp_addr=rs.getString("h_addr");
                                        hosp_state=rs.getString("h_state");
                                        hosp_city=rs.getString("h_city");
                                        addr=hosp_addr+", "+hosp_city+", "+hosp_state;
                        %>
                                        
                                        <tr>
                                            <th scope="row"><%=rs.getDate("v_app_date")%></th>
                                            <td><%=rs.getString("h_name")%></td>
                                            <td><%=addr%></td>
                                            <td><%=rs.getString("h_contact")%></td>
                                            <td><%=rs.getString("v_d_id")%></td>
                                            <td><%=rs.getString("doc_name")%></td>
                                            <td><%=rs.getDate("v_booking_date")%></td>
                                            <td><%=rs.getString("v_name")%></td>
                                        </tr>   
                                    <%}
                                }
                                catch(Exception e){
                                    e.printStackTrace();
                                }
                        %>
                        </tbody>
                          
                        
                          
                        </table>
                </div>
                

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
    
   
</body>
</html>
