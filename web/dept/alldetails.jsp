<%@page import="Mark.Mark"%>
<%@page import="java.util.List"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="Subjects.Subjects"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <%
            String username = session.getAttribute("username").toString();
       %>
    <head>
        <title>Bootstrap Case</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/tabledesign.css" rel="stylesheet">
    </head>
    <body>
        <%            String rollno = request.getParameter("rollno");
            String sem = request.getParameter("sem");
            String subname = null, cycle1 = null, cycle2 = null, cycle3 = null, model1 = null, model2 = null, model3 = null, unit1 = null, unit2 = null, unit3 = null;
        %>
    <center><h3>SEM <%=sem%></h3></center>
    <center><h3>NAME : <%=Student.getById(rollno).getName()%></h3></center>
    <center><table class="bordered"><tr>
                <th>Subcode</th>
                <th>Subject Name</th>
                <th>Unit 1</th>
                <th>Cycle 1</th>
                <th>Model 1</th>
                <th>Unit 2</th>
                <th>Cycle 2</th>
                <th>Model 2</th>
                <th>Unit 3</th>
                <th>Cycle 3</th>
                <th>Model 3</th>
            </tr>
            <%
                try {
                    String dept = Find.sdept(rollno);
                    Subjects s = new Subjects();
                    Mark m = new Mark();
                    s.setSem(sem);
                    s.setRegulation(Batch.getRegulation(Student.getById(rollno).getBatch()));
                    List<String> list = Subjects.getTherorySubCode(dept, s);
                    for (String subcode : list) {
                        subname = Subjects.getBySubcode(dept, subcode).getSubname();
                        m.setRollno(rollno);
                        m.setSubcode(subcode);
                        List<Mark> li = Mark.getExamMark(dept, m);
                        for (Mark mi : li) {
                            if (mi.getType().equals("model1")) {
                                model1 = mi.getMark();
                            } else if (mi.getType().equals("unit1")) {
                                unit1 = mi.getMark();
                            } else if (mi.getType().equals("cycle1")) {
                                cycle1 = mi.getMark();
                            } else if (mi.getType().equals("model2")) {
                                model2 = mi.getMark();
                            } else if (mi.getType().equals("unit2")) {
                                unit2 = mi.getMark();
                            } else if (mi.getType().equals("cycle2")) {
                                cycle2 = mi.getMark();
                            } else if (mi.getType().equals("model3")) {
                                model3 = mi.getMark();
                            } else if (mi.getType().equals("unit3")) {
                                unit3 = mi.getMark();
                            } else if (mi.getType().equals("cycle3")) {
                                cycle3 = mi.getMark();
                            }
                        }
            %>
            <tr>
                <td><%=subcode%></td>
                <td><%=subname%></td>
                <td><%=unit1%></td>
                <td><%=cycle1%></td>
                <td><%=model1%></td>
                <td><%=unit2%></td>
                <td><%=cycle2%></td>
                <td><%=model2%></td>
                <td><%=unit3%></td>
                <td><%=cycle3%></td>
                <td><%=model3%></td>
            </tr>
            <%
                        cycle1 = null;
                        cycle2 = null;
                        cycle3 = null;
                        model1 = null;
                        model2 = null;
                        model3 = null;
                        unit1 = null;
                        unit2 = null;
                        unit3 = null;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            %>
        </table></center>
</body>
</html>
