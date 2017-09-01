<%-- 
    Document   : StaffAdded
    Created on : 11 Jul, 2016, 9:35:09 PM
    Author     : Home
--%>

<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            /*String username = session.getAttribute("username").toString();
  String password = session.getAttribute("password").toString();
             */
            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type = "";
            //ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
            if (true)//if(rsss.isBeforeFirst())
            {
                /*while(rsss.next())
      {
          type = rsss.getString("type");
      }*/
                if (true)//if(type.equals("admin"))
                {

    %>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%String msg = request.getParameter("msg");%>
        <h1 align='center'><%=msg%>  </h1>

        <%String msg1 = request.getParameter("msg1");
            String msg2 = request.getParameter("msg2");
            if (msg1 != null && msg2 != null) {
        %>
        <h1 align='center'>Username: <%=msg2%>  </h1>
        <h1 align='center'><%=msg1%>  </h1>

        <%
            }
        %>
    <center>
        <div align="center">
            <a href="staffprofileupdate.jsp"><input type='submit' value='Back'></a>
        </div>
    </div>
</div>


</center>
</section>
</body>
<%
            } else {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
</html>
