<%-- 
    Document   : log_patient
    Created on : 10 Mar, 2017, 12:44:31 PM
    Author     : 1405299
--%>

<%@page import="Classes.pRegEmail"%>
<%@page import="java.util.Random"%>
<%@page import="Classes.userIDreturn"%>
<%@page import="Classes.pLoginCheck2"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="Classes.pLoginCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uid=request.getParameter("email");
    String upass=request.getParameter("pass");
    String uname=null;
    boolean flag=pLoginCheck.checkUser(uid,upass);
    boolean flag1; boolean flag2;
    try{
        
        if(flag){
            uname=userIDreturn.returnUser(uid);
            flag2=pLoginCheck.checkUser1(uname);
            if(flag2){
                flag1=pLoginCheck2.checkUser(uname);
                if(flag1){
                    session.setAttribute("uname",uname);
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("uname", uname);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("userIndex.jsp");
                    response.sendRedirect(encodedURL);
                    return;
                }
                else{
                    session.setAttribute("uname",uname);
                    session.setMaxInactiveInterval(30*60);
                    Cookie userName = new Cookie("uname", uname);
                    response.addCookie(userName);
                    String encodedURL = response.encodeRedirectURL("register_patient2.jsp");
                    response.sendRedirect(encodedURL);
                    return;
                }
            }
            else{
                Random randomGenerator = new Random();
                int randomInt = randomGenerator.nextInt(999999);
                boolean stats= pLoginCheck.pTokenDetails(uname, randomInt);
                if(stats){
                    String pemail=userIDreturn.returnEmail(uname);
                    pRegEmail javaEmail=new pRegEmail();
                        try {
                                javaEmail.setMailServerProperties();
                                javaEmail.createEmailMessage(pemail,uname,randomInt);
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
               RequestDispatcher rs = request.getRequestDispatcher("login_patient.jsp");
               rs.include(request, response);
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }
%>