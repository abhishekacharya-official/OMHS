<%-- 
    Document   : hAddDoc
    Created on : 14 Mar, 2017, 9:48:05 PM
    Author     : 1405299
--%>


<%@page import="Classes.hAdDoca"%>
<%@page import="Classes.hAdDoc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int status;
  String msg=null, err1=null, err2=null;
  String hname=request.getParameter("hname");
  String uid=request.getParameter("docid");
  String uname=request.getParameter("name");
  String contact=request.getParameter("contact");
  String pass=request.getParameter("pass");
  String dname=request.getParameter("dname");
  String demail=request.getParameter("mail");
  int slots=Integer.parseInt(request.getParameter("slots"));
  boolean flag = hAdDoc.register(uid, hname);
  if(!flag){
      status=hAdDoca.register(hname, uid, uname, contact, pass, dname, demail, slots);
      if(status>0){
          msg="Successfully registered";
          request.setAttribute("msg", msg);
          request.getRequestDispatcher("hospAdDoc.jsp").forward(request, response);
      }
      else{
          err1="Data not saved";
          request.setAttribute("err1", err1);
          request.getRequestDispatcher("hospAdDoc.jsp").forward(request, response);
      }
  }
  else{
      err1="Doctor username exists";
      request.setAttribute("err1", err1);
      request.getRequestDispatcher("hospAdDoc.jsp").forward(request, response);
  }
%>