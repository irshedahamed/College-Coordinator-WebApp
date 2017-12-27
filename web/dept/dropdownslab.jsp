<%-- 
    Document   : dropdowns
    Created on : Feb 13, 2015, 6:41:57 AM
    Author     : Divya sri
--%>

<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<html>
    <head>




        <%
            //open a database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {

                String index = request.getParameter("index");
                int n = Integer.parseInt(index);
                String index1 = request.getParameter("index1");
                int m = Integer.parseInt(index1);
                out.print("<br>");
                out.print("<label class='input'><div align='left' size='3px'><b>Lab Subjects<b></div></label>");
                out.print("<br>");

                out.print(" <table>");

                out.print("<tr>");
                out.print("<td><center><b>Batch</b></center></td>");
                out.print("<td><center><b>Semester</b></center></td>");
                out.print("<td><center><b>Department</b></center></td>");
                out.print("<td><center><b>Subject</b></center></td>");
                out.print("<td><center><b>Section</b></center></td>");
                out.print("<td><center><b>SBatch</b></center></td>");

                out.print("<td><center><b>Hours</b></center></td>");
                out.print("</tr>");

                for (int i = 1; i <= m; i++) {

                    out.print("<tr>");
                    out.print("<td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='lbatch" + i + "' name='lbatch" + i + "'>");
                    out.print("<option>select</option>");
                    Connection conbatch = new dbcon().getConnection("sjitportal");
                   // Statement stmt1 = conbatch.createStatement();
                   PreparedStatement stmt1=conbatch.prepareStatement("select batch from regulations");
                   ResultSet rs1 = stmt1.executeQuery();
                    String batch = null;
                    rs1.beforeFirst();
                    while (rs1.next()) {
                        batch = rs1.getString("batch");
                        out.print("<option value=" + batch + ">" + batch + "</option>");
                    }
                    out.print("</select><i></i></label></label>");

                    out.print("</td>");
                    out.print("<td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='lsem" + i + "' name='lsem" + i + "'>");
                    out.print("<option>select</option>");
                    out.print("<option value='01'>1</option>");
                    out.print("<option value='02'>2</option>");
                    out.print("<option value='03'>3</option>");
                    out.print("<option value='04'>4</option>");
                    out.print("<option value='05'>5</option>");
                    out.print("<option value='06'>6</option>");
                    out.print("<option value='07'>7</option>");
                    out.print("<option value='08'>8</option>");
                    out.print("</select><i></i></label></label>");

                    out.print("</td>");
                    out.print("<td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='ldept" + i + "' name='ldept" + i + "'>");
                    out.print(Find.getDeptHTMLContent());

                    out.print("</select><i></i></label></label>");
                    out.print("</td>");
                    out.print(" <td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='lsubject" + i + "' name='lsubject" + i + "'>");
                    out.print(" <option>Select</option>");
                    out.print("</select><i></i></label></label>");
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='lsec" + i + "' name='lsec" + i + "'>");
                    out.print(" <option>Select</option>");
                    out.print("<option value='a'>a</option>");
                    out.print(" <option value='b'>b</option>");
                    out.print("<option value='c'>c</option>");
                    out.print(" <option value='d'>d</option>");

                    out.print("</select><i></i></label></label>");
                    out.print(" </td>");

                    out.print("<td>");
                    out.print("<label class='input'><label class='select'>");
                    out.print("<select id='lsbatch" + i + "' class='lsbatch' name='lsbatch" + i + "'>");
                    out.print(" <option>Select</option>");
                    out.print("<option value='1'>1</option>");
                    out.print(" <option value='2'>2</option>");
                    out.print("<option value='3'>3</option>");
                    out.print(" <option value='4'>4</option>");
                    out.print("<option value='5'>5</option>");
                    out.print("<option value='6'>6</option>");
                    out.print("<option value='7'>7</option>");
                    out.print("<option value='8'>8</option>");

                    out.print("</select><i></i></label></label>");
                    out.print(" </td>");

                    out.print("<td>");
                    out.print("<label class='input'><label class='input'>");
                    out.print("<input type='text' id='lnh" + i + "' name='lnh" + i + "' size='1'>");

                    out.print("</label></label>");
                    out.print(" </td>");

                    out.print("</tr>");

                    if (stmt1 != null) {
                        stmt1.close();
                    }
                    if (conbatch != null) {
                        ;//conbatch.close();
                    }

                }
                out.print("</table>");

            } catch (Exception e) {
                out.print("<div><font color='red'>The following exception was thrown:</font></div>" + e);
                e.printStackTrace();
            } finally {

            }
        %>
    </head>
</html>
