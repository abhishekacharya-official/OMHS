<%-- 
    Document   : userForgotPass1
    Created on : 20 Mar, 2017, 8:56:10 PM
    Author     : 1405299
--%>


<%@page import="Classes.hospFemail"%>
<%@page import="Classes.hospFmailCheck"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String err1=null, err2=null;
    String mail=request.getParameter("mail");
    String hid=hospFmailCheck.emailCheck(mail);
    if(hid!=null){
        Random randomGenerator = new Random();
        int randomInt = randomGenerator.nextInt(999999);
        int status=hospFmailCheck.fToken(hid, randomInt);
        if(status>0){
            hospFemail javaEmail = new hospFemail();
            try {
                javaEmail.setMailServerProperties();
                javaEmail.createEmailMessage(mail,hid,randomInt);
                javaEmail.sendEmail();
                request.getRequestDispatcher("preg2.html").forward(request, response);
                return;
            } catch (Exception me) {
                me.printStackTrace();
            }
        }
        else{
            err2="Some error occured";
            request.setAttribute("err2", err2);
            request.getRequestDispatcher("hospForgotPass.jsp").forward(request, response);
            return;
        }
    }
    else{
        err1="Emal ID doesn't exist";
        request.setAttribute("err1", err1);
        request.getRequestDispatcher("hospForgotPass.jsp").forward(request, response);
        return;
    }
%>
