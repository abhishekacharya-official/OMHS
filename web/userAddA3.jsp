<%-- 
    Document   : userAddA3
    Created on : 18 Mar, 2017, 2:57:47 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.connDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String city=request.getParameter("city");  
  String buffer="<select id='hosp' name='hosp' class='form-control' required='required'  onchange='showdept(this.value);'><option value='-1'>Select</option>"; 
  String hosp1=null,hospname=null;
  try {
        Connection con=connDao.getCon();
        String query="Select distinct h_id, h_name from hospital_details where h_city=?";
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, city);
            ResultSet rs=stm.executeQuery();
        while(rs.next()){
                hosp1=rs.getString("h_id");
                hospname=rs.getString("h_name");
                buffer=buffer+"<option value='"+hosp1+"'>"+hospname+"</option>"; 
                
          }response.getWriter().println(buffer);
  }
  catch(Exception e){
      e.printStackTrace();
  }
%>