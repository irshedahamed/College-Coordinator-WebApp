<%-- 
    Document   : showUpdateList
    Created on : 6 Apr, 2017, 10:23:42 AM
    Author     : Home
--%>


<%@page import="Transport.BoardingPoint"%>
<%@page import="Actor.Student"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        

        <title>JSP Page</title>
        <script type="text/javascript" src="../js/jquery.js"></script>

    </head>
    <body>
        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                    <center><h1>Update Changes </h1></center>
                    <center><form action="${pageContext.request.contextPath}/StudentUpdateChanges" class="sky-form" method="post">
                            <fieldset>					
                                <section>
                                    <br><br><br>                             
                                    <table class="bordered" >
                                        <thead>
                                        <th>Register Number</th>
                                        <th>Roll number</th>
                                        <th>Name</th>
                                        <th>Boarding Point</th>
                                        </thead>

                                        <tbody>
                                            <%
                                                  String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");
       
                                                String dept = request.getParameter("dept");
                                                String batch = request.getParameter("batch");
                                                for (Student s : Student.getAll(dept, batch, "%",clg)) {
                                                    // batch=rs.getString("batch");
%>
                                            <tr>
                                                <td><%=s.getRegno()%> </td>
                                                <td><%=s.getId()%></td>
                                                <td><%=s.getName()%></td>

                                                <td>

                                                    <select id="section" name="update<%=s.getId()%>" required>
                                                        <option value="<%=s.getGeneral().getBoarding()%>"><%=s.getGeneral().getBoarding()%></option>
                                                        <option value="HOSTELER">HOSTELER</option>
                                                        <%out.write(BoardingPoint.getHTMLContent(clg)); %>

                                                    </select>
                                                </td>
                                            </tr>

                                            <%
                                                }
                                            %>
                                        </tbody>

                                    </table>                            
                                    <br><br>

                                    <br> <br>



                                </section>

                                <input type="hidden" value="<%=batch%>" name="batch">

                                <input type="hidden" value="<%=dept%>" name="dept">
                                <div align="center">
                                    <input type="submit" id="submit" value="Submit" /></div>
                                <br>
                            </fieldset>
                        </form></center>


                </div></div></section>

    </body>

</html>
