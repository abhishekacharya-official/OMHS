<%-- 
    Document   : hospVDoc3
    Created on : 15 Mar, 2017, 3:43:51 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            //allow access only if session 
            String did=request.getParameter("var");
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
                        <a    href="hospApp.jsp"><i class="fa fa-bar-chart-o fa-3x"></i> Appointments</a>
                    </li>
                    <li>
                        <a  href="hospAdDoc.jsp"><i class="fa fa-desktop fa-3x"></i> Add Doctor</a>
                    </li>
                    <li>
                        <a class="active-menu" href="hospVDoc.jsp"><i class="fa fa-qrcode fa-3x"></i> View Doctor</a>
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
                     <h2>Manage Selected Doctor</h2>   
                    </div>
                </div>       
                <hr/>      
                <% 
                    String dname=null,dcon=null,demail=null,dsalt=null;int davail=0,dapp=0;
                    try {
                        
                        Connection con=connDao.getCon();
                        String query="Select doc_name,doc_salt,doc_contact,doc_email,doc_n_appt,doc_avail from doctor_details where doc_id=? and doc_h_id=?";
                            PreparedStatement stm=con.prepareStatement(query);
                            stm.setString(1, did);
                            stm.setString(2, userName);
                            ResultSet rs=stm.executeQuery();
                        while(rs.next()){
                                dname=rs.getString("doc_name");
                                dsalt=rs.getString("doc_salt");
                                dcon=rs.getString("doc_contact");
                                demail=rs.getString("doc_email");
                                dapp=rs.getInt("doc_n_appt");
                                davail=rs.getInt("doc_avail");
                          }
                  }
                  catch(Exception e){
                      e.printStackTrace();
                  }
                %>
                <%     
                        String stext=(String) request.getAttribute("textae1");
                        if(stext!=null){
                    %>
                        <div class="alert alert-success"><%=stext%></div>
                    <% } %> 
                    
                <%     
                        String stext1=(String) request.getAttribute("textae2");
                        if(stext1!=null){
                    %>
                        <div class="alert alert-success"><%=stext%></div>
                    <% } %> 
                    
                <%     
                        String stext2=(String) request.getAttribute("textae3");
                        if(stext2!=null){
                    %>
                        <div class="alert alert-success"><%=stext%></div>
                    <% } %> 
                 <!-- /. ROW  -->           
                 <form id="msform" action="hospVDoc3_1.jsp" method="post">
                <fieldset>
                  <h2 class="fs-title">Change Doctor Details</h2>
                  <input type="text" name="docid" value="<%=did%>" readonly="readonly"/>
                  <input type="text" name="docname" value="<%=dname%>"  placeholder="Doctor Name" readonly="readonly" />
                  <input type="text" name="docno" value="<%=dcon%>" placeholder="Doctor Contact Number" required="required"/>
                  <input type="email" name="mail" value="<%=demail%>" placeholder="Doctor E-mail" required="readonly"/>
                   <br/>
                   <select id="SlotId" name="Slots"  class="form-control" required="required">
                      <option value="<%=dapp%>" ></option>
                  </select>
                  <br/>
                  <input type="submit" name="submit" class="submit action-button" value="Change!!" />
                  </fieldset> 
                </form>
                <hr/>
                <form class="msform1" action="hospVDoc3_2.jsp" method="post">
                <fieldset>
                  <h2 class="fs-title">Change Doctor Password</h2>
                  <input type="hidden" name="docid" value="<%=did%>"/>
                  <input type="password" name="pass" id="pass" placeholder="Doctor Password" required="required"/>
                  <input type="password" name="cpass" id="cpass" placeholder="Confirm Doctor Password" required="required"/>
                  <input type="submit" name="submit" class="submit action-button" value="Change!!" />
                  </fieldset> 
                </form>
                <hr>
                <form class="msform1">
                <fieldset>
                  <h2 class="fs-title" style="color:red">Deactivate Doctor Account</h2>
                  <input type="submit" name="submit" class="submit action-button" value="Deactivate!!" />
                  </fieldset> 

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

    <script type="text/javascript">
          var select = '';
          select += '<option value="" disabled selected >' + "No of Slots" + '</option>';
    for (i=1;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#SlotId').html(select);

    </script>
    <script type="text/javascript">
    function ValidateForm() {
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("cpass").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
    </script>
    
   
</body>
</html>
