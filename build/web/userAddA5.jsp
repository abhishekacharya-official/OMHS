<%-- 
    Document   : userAddA5
    Created on : 18 Mar, 2017, 7:36:12 PM
    Author     : 1405299
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String dept=request.getParameter("dept1"); 
  String hosp=request.getParameter("hosp");
  String buffer="<select id='doctor1' name='doctor' class='form-control'  required='required' ><option value='-1'>Select</option>"; 
  String did=null, dname=null, name=null;
  try {
        Connection con=connDao.getCon();
        String query="Select distinct doc_id,doc_name from doctor_details where doc_dept_id=? and doc_h_id=?";
       
            PreparedStatement stm=con.prepareStatement(query);
            stm.setString(1, dept);
            stm.setString(2, hosp);
            ResultSet rs=stm.executeQuery();
        while(rs.next()){
            
                did=rs.getString("doc_id");
                name=rs.getString("doc_name");
                //dname=did+"  "+name;
                buffer=buffer+"<option value='"+did+"'>"+name+"</option>"; 
                
          }response.getWriter().println(buffer);
  }
  catch(Exception e){
      e.printStackTrace();
  }
%>