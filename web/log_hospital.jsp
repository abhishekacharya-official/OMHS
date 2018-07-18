<%-- 
    Document   : log_hospital
    Created on : 11 Mar, 2017, 11:05:40 AM
    Author     : 1405299
--%>

<%@page import="Classes.hRegMail"%>
<%@page import="java.util.Random"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.hLoginCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid=request.getParameter("email");
    String upass=request.getParameter("pass");
    String huname=null;
    boolean flag=hLoginCheck.checkUser(uid,upass);
    boolean flag1; boolean flag2;
    try{
        if(flag){
            huname=hLoginCheck.returnUser(uid);
            flag2=hLoginCheck.checkUser1(huname);
            if(flag2){
                flag1=hLoginCheck.checkUser(huname);
                if(flag1){
                    session.setAttribute("huname",huname);
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("huname",huname);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("hospIndex.jsp");
                    response.sendRedirect(encodedURL);
                    return;
                }
                else{
                    session.setAttribute("huname",huname);
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("huname", huname);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("register_hospital2.jsp");
                    response.sendRedirect(encodedURL);
                    return;
                }
            }
            else{
                Random randomGenerator = new Random();
                int randomInt = randomGenerator.nextInt(999999);
                boolean stats= hLoginCheck.pTokenDetails(huname, randomInt);
                if(stats){
                    String hemail=hLoginCheck.returnEmail(huname);
                    hRegMail javaEmail=new hRegMail();
                        try {
                                javaEmail.setMailServerProperties();
                                javaEmail.createEmailMessage(hemail,huname,randomInt);
                                javaEmail.sendEmail();
                                request.getRequestDispatcher("preg1.html").forward(request, response);
                                return;
                        } catch (Exception me) {
                            me.printStackTrace();
                        }
                }
            }
        }
        if(!flag){
            String erru="Incorrect data";
             request.setAttribute("erru", erru);
               RequestDispatcher rs = request.getRequestDispatcher("login_hospital.jsp");
               rs.include(request, response);
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>