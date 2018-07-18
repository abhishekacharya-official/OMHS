<%-- 
    Document   : log_doctor
    Created on : 19 Mar, 2017, 2:40:01 PM
    Author     : 1405283
--%>
<%@page import="Classes.docIDReturn"%>
<%@page import="Classes.dLoginCheck"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid=request.getParameter("email");
    String upass=request.getParameter("pass");
    String uname=null;
    boolean flag=dLoginCheck.checkUser(uid,upass);
    boolean flag1;
    try{
        Connection con=connDao.getCon();
        if(flag){
             uname=docIDReturn.returnUser(uid);
            
                session.setAttribute("uname",uname);
                session.setMaxInactiveInterval(30*60);
                Cookie userName = new Cookie("uname", uname);
                response.addCookie(userName);
                String encodedURL = response.encodeRedirectURL("docIndex.jsp");
                response.sendRedirect(encodedURL);
                return;
            }
        if(!flag){
            String erru="Incorrect data";
             request.setAttribute("erru", erru);
               RequestDispatcher rs = request.getRequestDispatcher("login_doctor.jsp");
               rs.include(request, response);
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>