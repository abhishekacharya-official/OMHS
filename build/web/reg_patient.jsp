

<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Classes.pRegEmail"%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="Classes.userSignup3"%>
<%@page import="Classes.userSignup2"%>
<%@page import="Classes.userSignup"%>
<%@page import="Classes.connDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.Connection"%>
<%
    String puname=request.getParameter("pid");
    String pemail=request.getParameter("pemail");
    String ppass=request.getParameter("pass");
    
    String pid=null,pmail=null,err=null,err1=null,err2=null, err3=null,msg=null,err4=null,stata=null;
    
        int status= userSignup.register(puname, pemail, ppass);
            if(status==1){
                err="Username already exists";
                request.setAttribute("err", err);
                request.getRequestDispatcher("register_patient.jsp").forward(request, response);
                return;
            }
            else if (status==2){
                err1="Email already exists";
                request.setAttribute("err1", err1);
                request.getRequestDispatcher("register_patient.jsp").forward(request, response);
                return;
            }
            else if (status==3){
                err3="Username or Email already exists";
                request.setAttribute("err3", err3);
                request.getRequestDispatcher("register_patient.jsp").forward(request, response);
                return;
            }
            else if (status == 0){
                int status1= userSignup2.register(puname, pemail, ppass);
                if(status1>0){
                    Random randomGenerator = new Random();
                    int randomInt = randomGenerator.nextInt(999999);
                    userSignup3 user1=new userSignup3();
                        int stat=user1.registertoken(puname,randomInt);
                    if(stat>0){
                        pRegEmail javaEmail=new pRegEmail();
                        try {
                                javaEmail.setMailServerProperties();
                                javaEmail.createEmailMessage(pemail,puname,randomInt);
                                javaEmail.sendEmail();
                                request.getRequestDispatcher("preg1.html").forward(request, response);
                                return;
                        } catch (Exception me) {
                            me.printStackTrace();
                        }
                    }
                    
                }
                else
                {
                    err2="Some error occured";
                    request.setAttribute("err2", err2);
                    request.getRequestDispatcher("register_patient.jsp").forward(request, response);
                    return;
                }
            }
%>
