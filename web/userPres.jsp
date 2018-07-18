<%-- 
    Document   : userPres
    Created on : 10 Mar, 2017, 12:12:58 PM
    Author     : 1405299
--%>
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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OMHS</title>
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
                <a class="navbar-brand" href="userIndex.jsp"><%=userName%></a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><a href="logout_patient.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav><!-- /. NAV TOP  -->
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
                        <a  href="userMyA.jsp"><i class="fa fa-qrcode fa-3x"></i> My Appointments</a>
                    </li>
                           <li  >
                        <a class="active-menu"  href="userPres.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Prescriptions</a>
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
                     <h2>Prescriptions</h2>   
                        <h5>Click on the appointments to see your prescription</h5>
                    </div>
                </div>
                 <!-- /. ROW  -->
                <hr />
                <div class="tableC">
                    <table class="table table-hover table-responsive" >
                    
                    <thead style="background-color:grey;color:white;">
                      <tr>
                        <th hidden>Doctor Id</th><!-- use style="display:none" if hidden is not working -->
                        <th hidden>Prescription Id</th>
                        <th hidden>Hospital Id</th>
                        <th hidden>Patient Id</th>
                        <th hidden>Appointment Id</th>
                        <th>Date</th>
                        <th>Hospital</th>
                        <th>Department</th>
                        <th>Doctor</th>
                        <th>Prescription For</th>
                      </tr>
                    </thead> <%
                    
                 
                 try {
                    Connection con=connDao.getCon();
                    String query="select v_app_date,v_h_id,v_d_id,v_doc_id,v_name,v_app_id from visiting where v_p_id=?";
                    PreparedStatement stm=con.prepareStatement(query);
                    
                    stm.setString(1,userName);
                    ResultSet rs=stm.executeQuery();
                    //System.out.println(sqlDate);
                    //System.out.println(userName);
                    
                String vappid="";
                    while(rs.next())
                    {vappid=rs.getString("v_app_id");
                       %>
                    <tbody>
                      <tr onclick="window.location='userPresView.jsp?var=<%=vappid%>'" style="cursor:pointer;">
                        <td hidden>did</td>
                        <td hidden>pid</td>
                        <td hidden>hid</td>
                        <td hidden>pid</td>
                        <td hidden>AId</td>
                        <td><%=rs.getDate("v_app_date")%> </td>
                        <%String abc=rs.getString("v_h_id");Connection con1=connDao.getCon();
                    String query1="select h_name from hospital_details where h_id=?";
                    PreparedStatement stm1=con1.prepareStatement(query1);
                    
                    stm1.setString(1,abc);
                    ResultSet rs1=stm1.executeQuery();
                    //System.out.println(sqlDate);
                    //System.out.println(userName);
                    
                
                    while(rs1.next())
                    {%>
                        <td><%=rs1.getString("h_name")%></td><%}%>
                        <td><%=rs.getString("v_d_id")%></td>
                        <%String abcd=rs.getString("v_doc_id");Connection con2=connDao.getCon();
                    String query2="select doc_name from doctor_details where doc_id=?";
                    PreparedStatement stm2=con2.prepareStatement(query2);
                    
                    stm2.setString(1,abcd);
                    ResultSet rs2=stm2.executeQuery();
                    //System.out.println(sqlDate);
                    //System.out.println(userName);
                    
                
                    while(rs2.next())
                    {%>
                        <td><%=rs2.getString("doc_name")%></td><%}%>
                        <td><%=rs.getString("v_name")%></td>
                        <%}}catch(Exception e){e.printStackTrace();}%>
                      </tr>
                    </tbody>
                      
                    </table>
              </div>
             
           </div>
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
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>