
<%@page import="Classes.hDetailsSave"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
  String huname=null,hname=null,contact=null,addr=null,state=null,city=null;
  int count=0;
  huname=request.getParameter("uname");
  hname=request.getParameter("hname");  
  contact=request.getParameter("contact");
  addr=request.getParameter("address");
  state=request.getParameter("state");
  city=request.getParameter("city");
  count=hDetailsSave.detailsSave(huname, hname, contact, addr, state, city);
    if(count>0){
        request.getRequestDispatcher("hospIndex.jsp").forward(request, response);
        return;
    }
    else{
        out.println("<h1> " + "Data not Inserted " + "</h1>");
    }
%>