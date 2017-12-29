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


    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

            String index = request.getParameter("index");
            int n = Integer.parseInt(index);
            out.print("<label class='input'><div align='left' size='3px'><b>Theory Subjects<b></div></label>");

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

            for (int i = 1; i <= n; i++) {

                out.print("<tr>");
                out.print("<td>");
                out.print("<label class='input'><label class='select'>");
                out.print("<select id='batch" + i + "' name='batch" + i + "'>");
                out.print("<option value='null' required>select</option>");

                Connection conbatch = new dbcon(clg).getConnection("portal");
                Statement stmt1 = conbatch.createStatement();
                ResultSet rs1 = stmt1.executeQuery("select batch from regulations");
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
                out.print("<select id='sem" + i + "' name='sem" + i + "'>");
                out.print("<option required>select</option>");
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
                out.print("<select id='dept" + i + "' name='dept" + i + "' >");
                out.print(Find.getDeptHTMLContent());
                out.print("</select><i></i></label></label>");
                out.print("</td>");
                out.print(" <td>");
                out.print("<label class='input'><label class='select'>");
                out.print("<select id='subject" + i + "' name='subject" + i + "'>");
                out.print(" <option>Select</option>");
                out.print("</select><i></i></label></label>");
                out.print("</td>");
                out.print("<td>");
                out.print("<label class='input'><label class='select'>");
                out.print("<select id='sec" + i + "' name='sec" + i + "'>");
                out.print(" <option>Select</option>");
                out.print("<option value='a'>a</option>");
                out.print(" <option value='b'>b</option>");
                out.print(" <option value='c'>c</option>");
                out.print(" <option value='d'>d</option>");
                out.print("</select><i></i></label></label>");
                out.print(" </td>");

                out.print("<td>");
                out.print("<label class='input'><label class='select'>");
                out.print("<select id='sbatch" + i + "' class='sbatch' name='sbatch" + i + "'>");
                //out.print(" <option>Select</option>");
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
                out.print("<input type='text' id='nh" + i + "' name='nh" + i + "' size='1'>");
                out.print(" </td>");
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

</html>
