<%-- 
    Document   : setUserUpdate
    Created on : 13 Mar, 2017, 1:36:17 AM
    Author     : 1405299
--%>

<%@page import="Classes.psettings"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.pLoginCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String uname=request.getParameter("uname");
  String pass=request.getParameter("pass");
  String pass1=request.getParameter("pass1");
  int count=0;
    boolean flag=pLoginCheck.checkUser(uname,pass);
        if(flag){
            count=psettings.checkUser(uname, pass1);
            if(count>0){
                String textae1="Password updated!";
                request.setAttribute("textae1", textae1); 
                request.getRequestDispatcher("userSett.jsp").forward(request, response);
                return;
            }
        }
        else{
            out.println("Data not inserted");
        }
        
        if(!flag){
            String erru="Incorrect password";
            request.setAttribute("erru", erru);
            RequestDispatcher rs = request.getRequestDispatcher("userSett.jsp");
            rs.include(request, response);
        }
     
%>
