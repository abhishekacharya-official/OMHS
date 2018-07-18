<%-- 
    Document   : hospVDoc
    Created on : 10 Mar, 2017, 12:03:06 PM
    Author     : 1405299
--%>

 <%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
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
    <script language="javascript" type="text/javascript">  
        var xmlHttp ; 
        var xmlHttp;
        function xyz(){
            var mn=<%= userName %>;
            showDoc(document.getElementById('deptm').value,mn);
        }
    function showDoc(str){
                if (typeof XMLHttpRequest !== "undefined"){
                xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
            } 
            var url="hospVDoc2.jsp";
            url +="?count=" +str+"&cnt="+"<%=userName%>";
            xmlHttp.onreadystatechange = docChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function docChange(){   
            if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
            document.getElementById("doctor").innerHTML=xmlHttp.responseText;   
        }   
        }
        
        
        /*function showDetails(str){
            if (typeof XMLHttpRequest !== "undefined"){
              xmlHttp= new XMLHttpRequest();
            }
            else if (window.ActiveXObject){
              xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
              }
                if (xmlHttp===null){
                alert("Browser does not support XMLHTTP Request");
                return;
                } 
            var url="hospVDoc3.jsp";
            url +="?count=" +str;
            xmlHttp.onreadystatechange = stateDetails1;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
      function stateChange1(){   
        if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete"){   
        document.getElementById("ajaxDiv").innerHTML=xmlHttp.responseText ;  
        }   
      }*/
    </script>
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
                     <h2>View Doctor</h2>   
                        
                         <div class="form-group">
                    <select id="department" class="form-control" name="dname" required="required" onchange="showDoc(this.value)">
                      <option value="none" disabled selected>Department</option>
                    <%
                        String dname;
                        try{
                            Connection con=connDao.getCon();
                            String query="select distinct doc_dept_id from doctor_details where doc_h_id=?";
                            PreparedStatement stm=con.prepareStatement(query);
                            stm.setString(1,userName);
                            ResultSet rs=stm.executeQuery();
                            while(rs.next()){
                                dname=rs.getString("doc_dept_id");%>
                                <option value="<%=dname%>"><%=dname%></option>
                    <%}
                        
                    }
                    catch(Exception e){
                        e.printStackTrace();
                        
                    }
                    %>
                  </select>
                  
                          </div>
                    </div>
                </div>      
                <hr>    
                    <table class="table table-hover table-responsive" >
                
                <thead style="background-color:grey;color:white;">
                  <tr>
                    <th>Doctor Id</th>
                    <th>Doctor Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                  </tr>
                </thead>
                <tbody id="doctor">
                  
                </tbody>
                  
                </table>
                <!--<div id='ajaxDiv'>Your result will display here</div>-->
                
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
    
   
</body>
</html>
