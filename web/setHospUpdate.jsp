<%-- 
    Document   : setHospUpdate
    Created on : 13 Mar, 2017, 9:20:51 AM
    Author     : 1405299
--%>

<%@page import="Classes.hSettings"%>
<%@page import="Classes.hLoginCheck"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String uname=request.getParameter("uname");
  String pass=request.getParameter("pass");
  String pass1=request.getParameter("pass1");
  int count;
  boolean flag=hLoginCheck.checkUser(uname,pass);
        if(flag){
            count=hSettings.checkUser(uname, pass1);
                if(count>0){
                    String textae1="Changes updated!";
                    request.setAttribute("textae1", textae1); 
                    request.getRequestDispatcher("hospSett.jsp").forward(request, response);
                    return;
                }
                else{
                    out.println("Data not inserted");
                }
            }
        if(!flag){
            String erru="Incorrect password";
             request.setAttribute("erru", erru);
               RequestDispatcher rs = request.getRequestDispatcher("hospSett.jsp");
               rs.include(request, response);
        }
%>
