 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="General.Hostel"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>

<% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("hostel"))
        {
    
    
    %>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
    	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
         <link href="../css/sky-forms.css" rel="stylesheet">
          <link href="../css/tabledesign.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    
	
		
<center>
    <img src="../images/logo2.png" height="165px" width="700px" />	</center>
		
    <title>Hostel Student Details</title>
</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">

    
    
    
        <%
            int i = 0;
            String rollno = request.getParameter("rollno");
            Student s = Student.getById(rollno);
            java.sql.Connection con = new dbcon().getConnection("sjitportal");
            Statement st = con.createStatement();
          //  String data = "select roomno from room_change where rollno='" + rollno + "'";
            //ResultSet rs = st.executeQuery(data);
            if (true) {
                //String roomno = rs.getString("roomno");

                java.sql.Connection conn = new dbcon().getConnection("sjitportal?zeroDateTimeBehavior=convertToNull");
           //     Statement stt = conn.createStatement();
           PreparedStatement stt=conn.prepareStatement("select intime,outtime from entry  where rollno =?");
           stt.setString(1, rollno);
                //String date = ;
                ResultSet rss = stt.executeQuery();


        %>




    <center>
    <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


                <h1><header>Hostel Details</header></h1>


                <br> <h3>  Student Details</h3><br>

                    <img src="../../StudentPhotos/Batch<%=s.getBatch()%>/<%=s.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />


                    <br>Roll No :<%=s.getId().toUpperCase()%><br>

                    Name :<%=s.getName().toUpperCase()%><br>

                    Register No:<%=s.getRegno()%><br>
                    Dept :<%=s.getDept().toUpperCase()%><br>
                    Address :<%=s.getContact().getDoorno()%>
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getStreet()%>
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getArea()%>
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getCity()%>
                    <br>
                    D.O.B :<%=s.getGeneral().getDob()%><br>
                    E-mail :<%=s.getMailid()%><br>
                    Mobile :<%=s.getMobile()%><br>






                    <center>  <div>
                        <table>
                            <tr>
                                <td style="padding-left:-500px">
                    <h3>Father's Details</h3><br>
                    <img src="../../Father/Batch<%=s.getBatch()%>/<%=s.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />

                    <br>Name :<%=s.getFatherDetails().getFathername().toUpperCase()%><br>
                    Occupation :<%=s.getFatherDetails().getOccupation()%><br>
                    Address :<%=s.getFatherDetails().getAddress()%><br>
                    E- Mail :<%=s.getFatherDetails().getMail()%><br>
                    Mobile :<%=s.getFatherDetails().getMobile()%><br>
                                </td>
                                   
                                
                                <td style="padding-left:450px;">
                    <h3>Mother's Details</h3><br>
                    <img src="../../Mother/Batch<%=s.getBatch()%>/<%=s.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />

                    <br>Name :<%=s.getMotherDetails().getMothername().toUpperCase()%><br>
                    Occupation :<%=s.getMotherDetails().getOccupation()%><br>
                    Address :<%=s.getMotherDetails().getAddress()%><br>
                    E- Mail :<%=s.getMotherDetails().getMail()%><br>
                    Mobile :<%=s.getMotherDetails().getMobile()%><br>
                                </td>
                    </tr>
                        </table>
                    </div>
                    </center>
                                <div>
                                 <table>
                                    <tr>
                                        <td style= padding-left:-500px;">
                    <h3>Local Guardian1</h3>

                    <img src="../../LocalGuardian/Batch<%=s.getBatch()%>/<%=s.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />

                    <br>Name:<%=s.getLocalGuardian().getName().toUpperCase()%><br>
                    Phone No:<%=s.getLocalGuardian().getPhonenum()%> <br>
                    Area :<%=s.getLocalGuardian().getArea()%> <br>
                    City :<%=s.getLocalGuardian().getCity()%> <br>
                    Door No:<%=s.getLocalGuardian().getDoorno()%> <br>
                    Street:<%=s.getLocalGuardian().getStreet()%> <br>
                    Pincode:<%=s.getLocalGuardian().getPincode()%> <br
                    
                                        </td>
                                        <td style="padding-left:450px;">


                    <h3>Local Guardian2</h3>                                    

                    <img src="../../LocalGuardian2/Batch<%=s.getBatch()%>/<%=s.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />


                        <% if(s.getLocalGuardian2()!=null){%>
                    <br>Name:<%=s.getLocalGuardian2().getName()%> <br>
                    Phone No:<%=s.getLocalGuardian2().getPhonenum()%><br>
                    Area :<%=s.getLocalGuardian2().getArea()%><br>
                    City :<%=s.getLocalGuardian2().getCity()%><br>
                    Door No:<%=s.getLocalGuardian2().getDoorno()%><br>
                    Street:<%=s.getLocalGuardian2().getStreet()%><br>
                    Pincode:<%=s.getLocalGuardian2().getPincode()%><br>
                                        <%}%>
                                        
                                        </td>
                    </tr>

                                    </table>
                                </div>
                    <center>                  
                        <table class="bordered">
                            <thead><tr>   
                                    <th>S.No</th>
                                   
                                    <th>IN TIME</th>
                                    <th>OUT TIME</th></tr></thead>        
                    <%
                        while (rss.next()) {
                    %>

                            <td> <%=++i%> </td>
                            
                            <%
                                if (rss.getString("intime") != null) {
                                    String format = rss.getString("intime").substring(0, rss.getString("intime").length() - 2);
                                    format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];

                            %>
                            <td> <%=format%> </td>
                            <%
                            } else {
                            %>
                            <td></td>
                            <%
                                }
                            %>
                            <%
                                if (rss.getString("outtime") != null) {
                                    String format = rss.getString("outtime").substring(0, rss.getString("outtime").length() - 2);
                                    format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];

                            %>
                            <td> <%=format%> </td></tr>
                            <%
                            } else {
                            %>
                        <td></td></tr>
                            <%
                                }
                            %>
                            <%}%>                        
                            <% }%>
                            <br><br><br>
                        </table>
                </div></section>        </center>
            


                               <footer id="page-footer">
		<div class="container clearfix">
			<div class="copy"></div>
			<nav id="footer-nav">
                            			<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>
				
    			</nav>
		</div>
	</footer>
                               
        <script src="../js/jquery.js"></script>
        
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>   
    
    
    
    
    <%
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                ;//connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>
