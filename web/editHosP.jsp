<%-- 
    Document   : editUserP
    Created on : 13 Mar, 2017, 8:49:38 AM
    Author     : 1405299
--%>

<%@page import="Classes.hEditDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  String huname=null,hname=null,contact=null,addr=null,state=null,city=null;
  int count=0;
  huname=request.getParameter("uname");
  hname=request.getParameter("fname");  
  contact=request.getParameter("lname");
  addr=request.getParameter("address");
  state=request.getParameter("gender");
  city=request.getParameter("bloodgroup");
  count=hEditDetails.editDetails(huname, hname, contact, addr, state, city);
    if(count>0){
        String textae1="User Details saved!";
        request.setAttribute("textae1", textae1); 
        request.getRequestDispatcher("hospEPro.jsp").forward(request, response);
        return;
    }
    else{
        out.println("<h1> " + "Data not Inserted " + "</h1>");
    }
  
%>