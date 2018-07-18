<%-- 
    Document   : editUserP
    Created on : 13 Mar, 2017, 8:49:38 AM
    Author     : 1405299
--%>

<%@page import="Classes.pEditDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  String puname=null,pfname=null,plname=null,contact=null,addr=null,gender=null,bldgrp=null;
  int age=0,hfoot=0,hinch=0,weight=0,count=0;
  puname=request.getParameter("uname");
  pfname=request.getParameter("fname");  
  plname=request.getParameter("lname");
  age=Integer.parseInt(request.getParameter("age"));
  contact=request.getParameter("contact");
  addr=request.getParameter("address");
  gender=request.getParameter("gender");
  bldgrp=request.getParameter("bloodgroup");
  hfoot=Integer.parseInt(request.getParameter("heightf"));
  hinch=Integer.parseInt(request.getParameter("heighti"));
  weight=Integer.parseInt(request.getParameter("weight"));
  count=pEditDetails.editDetails(puname, pfname, plname, age, contact, addr, gender, bldgrp, hfoot, hinch, weight);
  if(count>0){
    String textae1="User Details saved!";
    request.setAttribute("textae1", textae1); 
    request.getRequestDispatcher("userEditPro.jsp").forward(request, response);
    return;
  }
  else{
        out.println("<h1> " + "Data not Inserted " + "</h1>");
    }
  
%>