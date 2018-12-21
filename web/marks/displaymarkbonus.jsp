<%--  
    Document   : displaymarkbonus
    Created on : 6 Sep, 2016, 8:55:29 PM
    Author     : Home
--%>



<%@page import="java.sql.PreparedStatement"%>
<%@page import="General.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <style rel="stylesheet">
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
            */
            /* 
                Created on : 26 May, 2015, 3:36:50 PM
                Author     : aravind
            */



            table {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;

                overflow-x : auto; 
            }


            .bordered {
                border: solid #ccc 1px;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                -webkit-box-shadow: 0 1px 1px #ccc; 
                -moz-box-shadow: 0 1px 1px #ccc; 
                box-shadow: 0 1px 1px #ccc;         
            }

            .bordered tr:hover {
                background: #fbf8e9;
                -o-transition: all 0.1s ease-in-out;
                -webkit-transition: all 0.1s ease-in-out;
                -moz-transition: all 0.1s ease-in-out;
                -ms-transition: all 0.1s ease-in-out;
                transition: all 0.1s ease-in-out;     
            }    

            .bordered td, .bordered th {
                border-left: 1px solid #ccc;
                border-top: 1px solid #ccc;
                padding: 4px;
                text-align: left;    
            }

            .bordered th {
                background-color: #dce9f9;
                background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
                background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
                -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
                -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
                box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
                border-top: none;
                text-shadow: 0 1px 0 rgba(255,255,255,.5); 
            }

            .bordered td:first-child, .bordered th:first-child {
                border-left: none;
            }

            .bordered th:first-child {
                -moz-border-radius: 6px 0 0 0;
                -webkit-border-radius: 6px 0 0 0;
                border-radius: 6px 0 0 0;
            }

            .bordered th:last-child {
                -moz-border-radius: 0 6px 0 0;
                -webkit-border-radius: 0 6px 0 0;
                border-radius: 0 6px 0 0;
            }

            .bordered th:only-child{
                -moz-border-radius: 6px 6px 0 0;
                -webkit-border-radius: 6px 6px 0 0;
                border-radius: 6px 6px 0 0;
            }

            .bordered tr:last-child td:first-child {
                -moz-border-radius: 0 0 0 6px;
                -webkit-border-radius: 0 0 0 6px;
                border-radius: 0 0 0 6px;
            }

            .bordered tr:last-child td:last-child {
                -moz-border-radius: 0 0 6px 0;
                -webkit-border-radius: 0 0 6px 0;
                border-radius: 0 0 6px 0;
            }

            h2{
                font-size: 18px;
                margin: 0px;
                padding: 0px;
            }
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <%
        String dept = request.getParameter("dept");
        if (dept == null) {
            dept = session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        String regulation = Batch.getRegulation(batch);
        String  rollno, name;
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("batch", batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept", dept);
        session.setAttribute("exam", exam);
        int count = 0;
    %>
    <body>
        <%
            String a1 = request.getParameter("word");

            if (a1 != null) {
                if (a1.equals("yes")) {
                    String formName = "";
                    formName = "MarkStudent.doc";
                    File filepath = new File(formName);
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=" + filepath);
                }
            }
        %>
        <div id="yourTableIdName1">
            <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
            <center><h2>Assessment -<%=exam%> Marks Report</h2>

                <h2 style="margin-left: 0px;">Batch: <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    &nbsp;
                    Branch Name: <%=dept.toUpperCase()%> </h2>

                <h2 style="margin-left: 0px;">Semester No: <%=sem%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    Category: Assessment-<%=exam%>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    Section: <%=sec%></h2>

            </center>
        </div>
        <br>
    <center>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
            <table class="bordered">
                <thead>

                    <tr>

                        <th name="cc">Roll No</th>
                        <th>Register No</th>

                        <th>Name</th>
                            <%
                                int bonusreq = Integer.parseInt(request.getParameter("bonus"));

    Subjects s = new Subjects();
                                s.setAyear(ayear);
                                s.setRegulation(regulation);
                                s.setSem(sem);
                                List<String> Subcodelist;
                                                        if(exam.contains("lab"))
                                Subcodelist= Subjects.getLabSubCode(dept, s);
                                else
                                Subcodelist= Subjects.getTherorySubCode(dept, s);
                                for (String subco : Subcodelist) {
                                                        %>
                        <th><%=subco%></th>
                            <%
                                }
                            %>


                    </tr>
                </thead>

                <%
                    Connection con = new dbcon().getConnection(dept);

                    int bonus = bonusreq;
                    // String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
                    
                    for (Student stu:Student.getAll(dept, batch, sec)) {
                        rollno = stu.getId();
                        name = stu.getName();
                        String regno = stu.getRegno();
                        //Statement st3 = con.createStatement();
                        bonus = bonusreq;
                        String forSqlexam=null;
                        if(exam.equals("labmodel"))
                            forSqlexam="3";
                        else
                            forSqlexam=exam;
                        String sql7 = "select * from bonuscut where rollno=? and assessment <=? and sem=?";
                        PreparedStatement st3=con.prepareStatement(sql7);
                        st3.setString(1, rollno);
                        st3.setString(2, forSqlexam);
                        st3.setString(3, sem);
                        ResultSet rs3 = st3.executeQuery();
                        if (rs3.next()) {
                            bonus = 0;
                        }
                        //     System.out.println(rollno + " " + bonus);
                %>
                <tr>

                    <td><%=rollno.toUpperCase()%></td>        
                    <td><%=regno%></td>
                    <td><%=name.toUpperCase()%></td>

                    <%

                        for(String subcode:Subcodelist){

                            //subcode = rs1.getString("subcode");
                            Mark m = new Mark();
                            m.setRollno(rollno);
                            m.setSubcode(subcode);
                            
                             int total = 0;
                             int gtotal=0;
                             boolean show=false;
                            if(exam.equals("labmodel")){
                            m.setType(exam);
                            String mark=Mark.getUserMark(dept, m).getMark();    
                            if(mark!=null)
                                {
                                    if(!mark.equals("A"))
                                gtotal=Integer.parseInt(mark);
                                else
                                        gtotal=0;
                                    
                                    show=true;
                                }
                                if (bonus != 0) {

                                        gtotal+=10;
                                    
                                }
                                    gtotal*=5;
                                    
                          }else{
                            List<Mark> li = Mark.getExamMark(dept, m);
                            int flag =0;
                            String marku1=null,marku2=null,zmarku1=null,zmarku2=null; 
                            String markm3=null,zmarkm3=null;
                            switch(Integer.parseInt(exam)){
                                case 1:
                                    if(li.size()!=0){
                                        show=true;
                                    for (Mark mi : li) {
                                    if (mi.getType().equals("unit1")) {
                                        marku1 = mi.getMark();
                                    } else if (mi.getType().equals("unit2")) {
                                        marku2 = mi.getMark();
                                    } else if (mi.getType().equals("zreunit1")) {
                                        zmarku1 = mi.getMark();
                                    }
                                    else if (mi.getType().equals("zreunit2")) {
                                        zmarku2 = mi.getMark();
                                    }
                                }
                                    int u1=0;
                                    if(marku1!=null && !marku1.equals("A") && !marku1.equals("N")){
                                       total = Integer.parseInt(marku1);
                                       if(Integer.parseInt(marku1)<34){
                                           if(zmarku1!=null && !zmarku1.equals("A") && !zmarku1.equals("N")){
                                               if(Integer.parseInt(zmarku1)>34){
                                               u1=1;
                                               }
                                         }
                                       }else{
                                            u1 =1;
                                       }                                       
                                    }
                                    if(marku2!=null && !marku2.equals("A") && !marku2.equals("N")){
                                       total += Integer.parseInt(marku2);
                                       float x = (float)(((float)total/150.0)*100.0);
                                       gtotal= (int)(x+0.99);
                                       if(Integer.parseInt(marku2)<34 && u1!=0){
                                           if(zmarku2!=null && !zmarku2.equals("A") && !zmarku2.equals("N")){
                                               if(Integer.parseInt(zmarku2)>34 && u1!=0){
                                                if (bonus != 0) {
   
                                               gtotal=Find.calcBonus(total, Student.getById(rollno).getModel_type());
                                                }                                           
                                               }
                                         }
                                       }else{if (bonus != 0) {
   
                                               gtotal=Find.calcBonus(total, Student.getById(rollno).getModel_type());
                                                }
                                       }                                       
                                    }
                                    }                       
                                    break;
                                case 2:
                                    if(li.size()!=0){
                                        show=true;
                                    for (Mark mi : li) {
                                    if (mi.getType().equals("unit3")) {
                                        marku1 = mi.getMark();
                                    } else if (mi.getType().equals("unit4")) {
                                        marku2 = mi.getMark();
                                    } else if (mi.getType().equals("zreunit3")) {
                                        zmarku1 = mi.getMark();
                                    }
                                    else if (mi.getType().equals("zreunit4")) {
                                        zmarku2 = mi.getMark();
                                    }
                                }
                                     int u1=0;
                                    if(marku1!=null && !marku1.equals("A") && !marku1.equals("N")){
                                       total = Integer.parseInt(marku1);
                                       if(Integer.parseInt(marku1)<34){
                                           if(zmarku1!=null && !zmarku1.equals("A") && !zmarku1.equals("N")){
                                               if(Integer.parseInt(zmarku1)>34){
                                               u1=1;
                                               }
                                         }
                                       }else{
                                            u1 =1;
                                       }                                       
                                    }
                                    if(marku2!=null && !marku2.equals("A") && !marku2.equals("N")){
                                       total += Integer.parseInt(marku2);
                                       float x = (float)(((float)total/150.0)*100.0);
                                       gtotal= (int)(x+0.99);
                                       float  temp = (float) (((float)total/150.0)*75.0);
                                       if(Integer.parseInt(marku2)<34 && u1!=0){
                                           if(zmarku2!=null && !zmarku2.equals("A") && !zmarku2.equals("N")){
                                               if(Integer.parseInt(zmarku2)>34 && u1!=0){
                                                 if(bonus!=0){  
                                               gtotal=Find.calcBonus((int)temp, Student.getById(rollno).getModel_type());
                                                 }
                                               }
                                         }
                                       }else{
                                           if (bonus != 0) {
   
                                               gtotal=Find.calcBonus((int)temp, Student.getById(rollno).getModel_type());
                                                }
                                           }                                       
                                    }
                                    }
                                    break;
                                case 3:
                                     if(li.size()!=0){
                                        show=true;
                                    for (Mark mi : li) {
                                    if (mi.getType().equals("model3")) {
                                        markm3 = mi.getMark();
                                    } else if (mi.getType().equals("zremodel3")) {
                                        zmarkm3 = mi.getMark();
                                    }
                                }
                                     if(markm3!=null && !markm3.equals("A") && !markm3.equals("N")){
                                       total += Integer.parseInt(markm3);
                                        float  mark = (float) (((float)Integer.parseInt(markm3))*0.75);
                                        if(Student.getById(rollno).getModel_type().equals("<7")){
                                            mark+=0.5;
                                        }
                                       if(Integer.parseInt(markm3)<45){
                                           if(zmarkm3!=null && !zmarkm3.equals("A") && !zmarkm3.equals("N")){
                                               
                                               if(Integer.parseInt(zmarkm3)>=45){
                                                  if(bonus!=0){
                                                   total=Find.calcBonus((int)mark, Student.getById(rollno).getModel_type());
                                                }
                                               }
                                         }
                                       }else{
                                            if(bonus!=0){
                                                   total=Find.calcBonus((int)mark, Student.getById(rollno).getModel_type());
                                                }
                                       }                                       
                                    }
                                    
                                    gtotal += total;
                                     }
                                    
                                    break;
                                        
                            }
                            
                            if(flag!=0){
                            String markc = null, markm = null, marku = null,zmark=null;
                            if (li.size() != 0) {
                                show=true;
                                for (Mark mi : li) {
                                    if (mi.getType().equals("model" + exam)) {
                                        markm = mi.getMark();
                                    } else if (mi.getType().equals("unit" + exam)) {
                                        marku = mi.getMark();
                                    } else if (mi.getType().equals("cycle" + exam)) {
                                        markc = mi.getMark();
                                    }
                                    else if (mi.getType().equals("zremodel" + exam)) {
                                        zmark = mi.getMark();
                                    }
                                }
                                gtotal = Find.calculateTotal(markm, markc, marku);

                                //bonus logic
                                if (bonus != 0) {

                                        gtotal += Find.calculateBonus(gtotal, Student.getById(rollno).getModel_type()) ;
                                    
                                }
                                
                                if(zmark!=null){
                                if (bonus != 0) {
                                    
                                    if(!zmark.equals("A")){
                                        
                                        if(markm.equals("A")){
                                        markm=zmark;
                                        if(gtotal<Find.calculateTotal(markm, markc, marku))
                                            gtotal=Find.calculateTotal(markm, markc, marku);
                                        gtotal += Find.calculateBonus(Find.calculateTotal(markm, markc, marku), Student.getById(rollno).getModel_type());
                                        
                                        
                                        } else  {
                                            if(gtotal<Integer.valueOf(zmark))
                                                gtotal=Integer.valueOf(zmark);
                                        gtotal += Find.calculateBonus(Integer.valueOf(zmark), Student.getById(rollno).getModel_type()) ;
                                    }
                                    }
                                }else{
					if(!zmark.equals("A"))
						if(gtotal<Integer.valueOf(zmark))	
                                                    gtotal=Integer.valueOf(zmark);

					}
                                                              
                                }
                            }
                            }
                            }
                            if(show){
                                if(gtotal>100)
                                gtotal=100;

                    %>


                    <td><%=gtotal%></td>

                    <%
                    } else {
                    %>
                    <td>   </td>

                    <%
                            }

                        }
                    %><%
                        }
                        if (con != null) {
                            ;//con.close();
                        }

                    %>

                </tr>        


            </table>
        </form>
    </center>
    <br>
    <center><a id="exportword" href ="displaymarkbonus.jsp?word=yes&dept=<%=dept%>&section=<%=sec%>&batch=<%=batch%>&sem=<%=sem%>&exam=<%=exam%>&ayear=<%=ayear%>&bonus=<%=bonusreq%>" >Export to word</a>
    </center>
</body>
</html>
