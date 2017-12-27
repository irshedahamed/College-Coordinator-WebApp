<%-- 
    Document   : index1
    Created on : 30-May-2015, 16:10:49
    Author     : Aravind Tyson
--%>

<%@page import="com.action.Find"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>



<%
    String username = session.getAttribute("username").toString();
    String index = request.getParameter("index");
    String index1 = request.getParameter("index1");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection connection = new dbcon().getConnection(Find.dept(username));
   // Statement statement = connection.createStatement();
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
                PreparedStatement statement=connection.prepareStatement("select distinct(batch) from subject_allocation where staffid=?");
                statement.setString(1, username);
                ResultSet rs = statement.executeQuery();

                String batch;

                while (rs.next()) {
                    batch = rs.getString("batch");


            %>
            <option value="<%=batch%>"><%=batch%></option>
            <% } %>
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
                    PreparedStatement statement=connection.prepareStatement("select distinct(sem) from subject_allocation where staffid=? and batch=?");
                    statement.setString(1, username);
                    statement.setString(2, batch);
                    ResultSet rs1 = statement.executeQuery();

                    String sem;

                    while (rs1.next()) {
                        sem = rs1.getString("sem");


                %>
                <option value="<%=sem%>"><%=sem%></option>
                <% } %>
            </select>
            <i></i>
        </label>
    </label>
    <br> <br>
</div>
<%
} else
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
                    PreparedStatement statement=connection.prepareStatement("select distinct(sec) from subject_allocation where staffid=? and batch=? and sem=?");
                    statement.setString(1, username);
                    statement.setString(2, batch);
                    statement.setString(3, sem);
                    ResultSet rs1 = statement.executeQuery();

                    String section;

                    while (rs1.next()) {
                        section = rs1.getString("sec");


                %>
                <option value="<%=section%>"><%=section%></option>
                <% } %>
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
                    PreparedStatement statement=connection.prepareStatement("select * from subject_allocation where batch=? and staffid=? and sem=? and sec=?");
                    statement.setString(1, batch);
                    statement.setString(2, username);
                    statement.setString(3, sem);
                    statement.setString(4, section);
                    ResultSet rs1 = statement.executeQuery();

                    String sub;

                    while (rs1.next()) {
                        sub = rs1.getString("subcode");


                %>
                <option value="sec"><%=section%></option>
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
    <div align="left" size="3px" id="div7"><b>
            From Date</b></div>
    <label class="select">

        <input type="text" id="datepicker" placeholder="dd/mm/yyyy" name="selected_date" />

        <i></i>
        <br> <br>
    </label></label>

<label class="input">
    <div align="left" size="3px" id="div7"><b>
            To Date</b></div>
    <label class="select">

        <input type="text" id="datepicker" placeholder="dd/mm/yyyy" name="selected_date" />

        <i></i>
        <br> <br>
    </label></label>
    <%
                    }
  //      if (statement != null) {
    //        statement.close();
      //  }
        if (connection != null) {
            connection.close();
        }
    %>







