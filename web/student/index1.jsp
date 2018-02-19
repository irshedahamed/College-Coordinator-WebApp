<%-- 
    Document   : index1
    Created on : 30-May-2015, 16:10:49
    Author     : Aravind Tyson
--%>

<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%
        String username = session.getAttribute("username").toString();

%>


<%                              String index = request.getParameter("index");
    String index1 = request.getParameter("index1");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection connection = new dbcon().getConnection(Find.sdept(username));
  //  Statement statement = connection.createStatement();
    if (index.equals("i1")) {
%>
<label class="input">
    <div align="left" size="3px"><b>
            Batch:</b></div>
    <label class="select">
        <select id="batch" name="batch" onchange="sltdept2();" required>
            <option disabled selected>Select</option>
            <%
                //int i=Integer.parseInt(request.getParameter("val"));
                Student s1 = Student.getById(username);
                String batch;

                batch = s1.getById(username).getBatch();


            %>
            <option value="<%=batch%>"><%=batch%></option>

        </select>
        <i></i>
    </label></label>
<br> <br>
<%
} else
    if (index.equals("i2")) {
%>
<div id="div3">
    <label class="input">
        <div align="left" size="3px"><b>
                SEM </b></div>
        <label class="select">

            <select id="sem" name="sem" onchange="sltdept3();" required >
                <option disabled selected>select</option>
                <%
                    //int i=Integer.parseInt(request.getParameter("val"));
                    String batch = request.getParameter("index2");


                %>
                <option disabled selected>select</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>

            </select>
            <i></i>
        </label>
    </label>
    <br> <br>
</div>
<%              } else
    if (index.equals("i3")) {
%>

<div id="div4">
    <label class="input">
        <div align="left" size="3px"><b>
                Section </b></div>
        <label class="select">

            <select id="section" name="section" onchange="sltdept4();" required>
                <option disabled selected>select</option>
                <%
                    //int i=Integer.parseInt(request.getParameter("val"));
                    String batch = request.getParameter("index2");
                    String sem = request.getParameter("index3");

                    Student s2 = Student.getById(username);
                    String section;

                    section = s2.getById(username).getSec();


                %>
                <option value="<%=section%>"><%=section%></option>

            </select>
            <i></i>
        </label></label>
    <br> <br>
</div>
<%
} else
    if (index.equals("i4")) {
%>

<div id="div5">
    <label class="input">
        <div align="left" size="3px" ><b>
                Subject</b></div>
        <label class="select">

            <select id="subject" name="subject" required>
                <option disabled selected>select</option>
                <%
                    //int i=Integer.parseInt(request.getParameter("val"));
                    String batch = request.getParameter("index2");
                    String section = request.getParameter("index4");
                    String sem = request.getParameter("index3");
                    PreparedStatement statement=connection.prepareStatement("select * from subject_allocation where batch=? and staffid='cs009' and sem=? and sec=?");
                    statement.setString(1, batch);
                    statement.setString(2, sem);
                    statement.setString(3, section);
                    ResultSet rs1 = statement.executeQuery();

                    String sub;

                    while (rs1.next()) {
                        sub = rs1.getString("subcode");


                %>
                <option value="<%=sub%>"><%=sub%></option>
                <% } %>

            </select>

            <i></i>
            <br> <br>
        </label></label>
</div>
<%
} else {
%>

<label class="input">
    <div align="left" size="3px" id="div6"><b>
            Hour</b></div>
    <label class="select">

        <select id="hour" name="hour" required>
            <option disabled selected>select</option>
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>

        </select>

        <i></i>
        <br> <br>
    </label></label>

<label class="input">
    <div align="left" size="3px" id="div7"><b>
            Date</b></div>
    <label class="select">

        <input type="text" id="datepicker" placeholder="dd/mm/yyyy" name="selected_date" />

        <i></i>
        <br> <br>
    </label></label>
    <%
                    }

    %>

                   





