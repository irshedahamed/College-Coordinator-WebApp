<%-- 
    Document   : newjsp2
    Created on : Aug 16, 2015, 9:58:36 AM
    Author     : vijayashree
--%>


<%@page import="java.io.File"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>

    <title>Report generation</title>
     <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
       

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="../js/jspdf.js"></script>
    <script type="text/javascript" src="../js/from_html.js"></script>
    <script type="text/javascript" src="../js/split_text_to_size.js"></script>
    <script type="text/javascript" src="../js/standard_fonts_metrics.js"></script>
    <script type="text/javascript" src="../js/cell.js"></script>
    <script type="text/javascript" src="../js/FileSaver.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {

            $("#exportpdf").click(function() {
                var pdf = new jsPDF('l', 'pt', 'a4');
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                pdf.setFont('Times','bold');
               
                pdf.text(300,30,'St.Josephs Institute of Technology');
                pdf.text(300,30,'MARK SHEET');
                
                  pdf.setFont('Times','normal');
                source = $('#yourTableIdName1')[0];
                source1= $('#yourTableIdName') [0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme' : function(element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top : 50,
                    bottom : 60,
                    left : 60,
                    width : 1000,
                };
        margins1 = {
                    top : 50,
                    bottom : 60,
                    left : 60,
                    width : 1000,
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(source1, // HTML string or DOM elem ref.
                margins.left, // x coord
                margins.top, { // y coord
                    'width' : margins.width, // max width of content on PDF
                    'elementHandlers' : specialElementHandlers
                },
                

                function(dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('stjosephsportal.pdf');
                }, margins);
            });

        });
    </script>
    </head>
    
    <body>
    
        <%
            String aa1= request.getParameter("flag");
            if(aa1!=null)
            {
            if(aa1.equals("one"))
            {
                String formName = "";
                        formName = "test.doc";
                        File filepath = new File(formName);
                        response.setContentType("application/vnd.ms-word");
                        response.setHeader("Content-Disposition", "inline; filename=" + filepath);
            }
            }
        String dept = request.getParameter("dept");
        if(dept==null)
        {
            dept= session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection("sjitportal");
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
       
       String examm1=exam.toUpperCase();
        
        String regulation=null;
        String subcode,rollno,name;
        
        Statement st= con.createStatement();
        String sql="select * from regulations where batch='"+batch+"'";
        ResultSet rs= st.executeQuery(sql);
        while(rs.next())
        {
            regulation=rs.getString("regulation");
        }
        session.setAttribute("regulation",regulation);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam);
        rs.close();
        st.close();
        con.close();
        int count=0;
        %>
        <body>
        <div id="yourTableIdName1">
        <center><h1><u>DEPARTMENT OF CSE</u></h1></center>
        <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
        <center><h1><%=examm1%> EXAM MARK LIST</h1></center>
        </div>
        <div id="yourTableIdName">
             <center>   <table style="width: 1020px;font-size: 20px;" border="3" class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <%
       con = new dbcon().getConnection(dept);
    st=con.createStatement();
        
   
       String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
     rs=st.executeQuery(sql1);
        
        while(rs.next())
        {
           
        subcode = rs.getString("subcode");
        count++;
        
        
        
        
        %>
        
        
            
        <th><%=subcode%></th>
        
        <% }
        rs.close();
        %>
    </tr>
    </thead>
    
    <%
       String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
     rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         %>
         <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
         <%
         
       String sql5 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
       Statement st1 = con.createStatement();
     ResultSet rs1=st1.executeQuery(sql5);
       int m=0,c =0;
       float m3=0;
       float sum=0;
        
        while(rs1.next())
        {
           
        subcode = rs1.getString("subcode");
        String sql6 = "select * from marks_table where rollno='"+rollno+"' and subcode='"+subcode+"'";
         Statement st2 = con.createStatement();
        ResultSet rs2 = st2.executeQuery(sql6);
         
       
        if(rs2.next())
        {
            if(exam.equals("model1"))
            {
                String m1= rs2.getString("model1");
                String c1= rs2.getString("cycle1");
                m = Integer.parseInt(m1);
                c = Integer.parseInt(c1);
                sum = m+c;
                sum = sum /130;
                m3 = sum*100;
                
                
            }
            else if(exam.equals("model2"))
            {
                String m1= rs2.getString("model2");
                String c1= rs2.getString("cycle2");
                m = Integer.parseInt(m1);
                c = Integer.parseInt(c1);
                sum = m+c;
                sum = sum /130;
                m3 = sum*100;
                
            }
            else if(exam.equals("model3"))
            {
                String m1= rs2.getString("model3");
                String c1= rs2.getString("cycle3");
                m = Integer.parseInt(m1);
                c = Integer.parseInt(c1);
                sum = m+c;
                sum = sum /130;
                m3 = sum*100;
            }
            int aa=Math.round(m3);
         
        
        %>
      
    
       <td><%=aa%></td>

       <%
            
        }
        else
        {
            %>
            <td>   
            <%
        }
        
        rs2.close();
       }
        rs1.close();
     }
     rs.close();
     
     %>
    </tr>
                 </table></center></div>

    <a href="displaymarkreport.jsp?batch=<%=batch%>&section=<%=sec%>&sem=<%=sem%>&exam=<%=exam%>&aa1=one"> DOWNLOAD WORD</a>


    </body>

    </html>