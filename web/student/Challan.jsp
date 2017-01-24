<%-- 
    Document   : Challan
    Created on : Jan 24, 2017, 9:17:34 AM
    Author     : Lenovo
--%>

<%@page import="java.util.Date"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    
    
    <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from student_login_details where rollno='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        
    session.setAttribute("deptname",Find.sdept(username) );
    
    %>

   <head>
      <title></title>
      <link type="text/css" rel="stylesheet" href="css/comman.css" media="undefined">
      <link type="text/css" rel="stylesheet" href="styles/menu.css" media="undefined">
   </head>
<%

    Student s=Student.getById(username);
    
   
%>
   <body style="padding:10px;margin:10px;" class="">
      <div class="row">
         <div class="row" id="divPrintChallan">
            <div style="border: 2px solid  #000; padding-left: 7px; float: left; padding-right: 7px;">
               <div style="float: none; clear: both;">
                  <div style="float: left;position:relative; width: 265px; line-height: 22px;">
                     <div style="text-align: center; font-size: 15px; font-weight: bold;">BANK COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                     <div>
                        <div style="float: left; height: 65px;">
                           <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                           <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                        </div>
                        <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                     </div>
                     <div style="clear: both; padding-top: 3px;">
                        <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                     </div>
                     <div style="text-align: center;">Paid into the Credit of</div>
                     <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                     <div style="text-align: center; font-weight: bold;">Tuition Fee<br>SB A/C No.&nbsp; 6106240021</div>
                     <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                     <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                     <div style="padding-top: 3px;">
                        <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                        <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                           <tbody>
                              <tr style="border: 1px solid #111;">
                                 <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                 <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                              </tr>
                              <tr style="border: 1px solid #111;">
                                 <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Tuition Fee<br>Bank Charges</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000<br>75</td>
                              </tr>
                              <tr>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">10075</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <div style="padding-top: 10px;">Signature of the Remitter :</div>
                     <div style="padding-top: 20px;">
                        <div style="float: left;">Cashier</div>
                        <div style="float: right;">Asst.Manager/Manager</div>
                     </div>
                  </div>
                  <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                     <div style="text-align: center; font-size: 15px; font-weight: bold;">COLLEGE COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                     <div>
                        <div style="float: left; height: 65px;">
                           <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                           <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                        </div>
                        <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                     </div>
                     <div style="clear: both; padding-top: 3px;">
                        <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                     </div>
                     <div style="text-align: center;">Paid into the Credit of</div>
                     <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                     <div style="text-align: center; font-weight: bold;">Tuition Fee<br>SB A/C No.&nbsp; 6106240021</div>
                     <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                     <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                     <div style="padding-top: 3px;">
                        <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                        <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                           <tbody>
                              <tr style="border: 1px solid #111;">
                                 <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                 <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                              </tr>
                              <tr style="border: 1px solid #111;">
                                 <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Tuition Fee<br>Bank Charges</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000<br>75</td>
                              </tr>
                              <tr>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">10075</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <div style="padding-top: 10px;">Signature of the Remitter :</div>
                     <div style="padding-top: 20px;">
                        <div style="float: left;">Cashier</div>
                        <div style="float: right;">Asst.Manager/Manager</div>
                     </div>
                  </div>
                  <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                     <div style="text-align: center; font-size: 15px; font-weight: bold;">STUDENT'S COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                     <div>
                        <div style="float: left; height: 65px;">
                           <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                           <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                        </div>
                        <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                     </div>
                     <div style="clear: both; padding-top: 3px;">
                        <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                     </div>
                     <div style="text-align: center;">Paid into the Credit of</div>
                     <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                     <div style="text-align: center; font-weight: bold;">Tuition Fee<br>SB A/C No.&nbsp; 6106240021</div>
                     <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                     <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                     <div style="padding-top: 3px;">
                        <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                        <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                           <tbody>
                              <tr style="border: 1px solid #111;">
                                 <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                 <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                              </tr>
                              <tr style="border: 1px solid #111;">
                                 <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Tuition Fee<br>Bank Charges</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000<br>75</td>
                              </tr>
                              <tr>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                 <td style="text-align: right; border: 1px solid #111;" align="right">10075</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                     <div style="padding-top: 10px;">Signature of the Remitter :</div>
                     <div style="padding-top: 20px;">
                        <div style="float: left;">Cashier</div>
                        <div style="float: right;">Asst.Manager/Manager</div>
                     </div>
                  </div>
               </div>
            </div>
            <div style="page-break-before: always;">
               <div style="border: 2px solid  #000; padding-left: 7px; float: left; padding-right: 7px;">
                  <div style="float: none; clear: both;">
                     <div style="float: left;position:relative; width: 265px; line-height: 22px;">
                        <div style="text-align: center; font-size: 15px; font-weight: bold;">BANK COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                        <div>
                           <div style="float: left; height: 65px;">
                              <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                              <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                           </div>
                           <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                        </div>
                        <div style="clear: both; padding-top: 3px;">
                           <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                        </div>
                        <div style="text-align: center;">Paid into the Credit of</div>
                        <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                        <div style="text-align: center; font-weight: bold;">Transport &amp; Mess Fee<br>SB A/C No.&nbsp; 6106240021</div>
                        <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                        <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                        <div style="padding-top: 3px;">
                           <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                           <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                              <tbody>
                                 <tr style="border: 1px solid #111;">
                                    <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                    <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                 </tr>
                                 <tr style="border: 1px solid #111;">
                                    <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Transport, Breakfast, Tea,Lunch on working days and examination days. Snacks on evening special class days <br><b>-Optional for DS</b><br>(or)<br>Boarding for the whole academic year<br> ( all 3 meals evening snacks and special meals on various occasions including holidays except Christmas and Summer vacations)<br><b>- Optional for HS</b></td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                 </tr>
                                 <tr>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div style="padding-top: 10px;">Signature of the Remitter :</div>
                        <div style="padding-top: 20px;">
                           <div style="float: left;">Cashier</div>
                           <div style="float: right;">Asst.Manager/Manager</div>
                        </div>
                     </div>
                     <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                        <div style="text-align: center; font-size: 15px; font-weight: bold;">COLLEGE COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                        <div>
                           <div style="float: left; height: 65px;">
                              <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                              <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                           </div>
                           <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                        </div>
                        <div style="clear: both; padding-top: 3px;">
                           <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                        </div>
                        <div style="text-align: center;">Paid into the Credit of</div>
                        <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                        <div style="text-align: center; font-weight: bold;">Transport &amp; Mess Fee<br>SB A/C No.&nbsp; 6106240021</div>
                        <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                        <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                        <div style="padding-top: 3px;">
                           <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                           <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                              <tbody>
                                 <tr style="border: 1px solid #111;">
                                    <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                    <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                 </tr>
                                 <tr style="border: 1px solid #111;">
                                    <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Transport, Breakfast, Tea,Lunch on working days and examination days. Snacks on evening special class days <br><b>-Optional for DS</b><br>(or)<br>Boarding for the whole academic year<br> ( all 3 meals evening snacks and special meals on various occasions including holidays except Christmas and Summer vacations)<br><b>- Optional for HS</b></td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                 </tr>
                                 <tr>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div style="padding-top: 10px;">Signature of the Remitter :</div>
                        <div style="padding-top: 20px;">
                           <div style="float: left;">Cashier</div>
                           <div style="float: right;">Asst.Manager/Manager</div>
                        </div>
                     </div>
                     <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                        <div style="text-align: center; font-size: 15px; font-weight: bold;">STUDENT'S COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                        <div>
                           <div style="float: left; height: 65px;">
                              <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                              <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                           </div>
                           <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                        </div>
                        <div style="clear: both; padding-top: 3px;">
                           <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                        </div>
                        <div style="text-align: center;">Paid into the Credit of</div>
                        <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                        <div style="text-align: center; font-weight: bold;">Transport &amp; Mess Fee<br>SB A/C No.&nbsp; 6106240021</div>
                        <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                        <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                        <div style="padding-top: 3px;">
                           <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                           <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                              <tbody>
                                 <tr style="border: 1px solid #111;">
                                    <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                    <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                 </tr>
                                 <tr style="border: 1px solid #111;">
                                    <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Transport, Breakfast, Tea,Lunch on working days and examination days. Snacks on evening special class days <br><b>-Optional for DS</b><br>(or)<br>Boarding for the whole academic year<br> ( all 3 meals evening snacks and special meals on various occasions including holidays except Christmas and Summer vacations)<br><b>- Optional for HS</b></td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                 </tr>
                                 <tr>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                    <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                        <div style="padding-top: 10px;">Signature of the Remitter :</div>
                        <div style="padding-top: 20px;">
                           <div style="float: left;">Cashier</div>
                           <div style="float: right;">Asst.Manager/Manager</div>
                        </div>
                     </div>
                  </div>
               </div>
               <div style="clear:both;float:none;page-break-before: always;">
                  <div style="border: 2px solid  #000; padding-left: 7px; float: left; padding-right: 7px;">
                     <div style="float: none; clear: both;">
                        <div style="float: left;position:relative; width: 265px; line-height: 22px;">
                           <div style="text-align: center; font-size: 15px; font-weight: bold;">BANK COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                           <div>
                              <div style="float: left; height: 65px;">
                                 <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                                 <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                              </div>
                              <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                           </div>
                           <div style="clear: both; padding-top: 3px;">
                              <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                           </div>
                           <div style="text-align: center;">Paid into the Credit of</div>
                           <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                           <div style="text-align: center; font-weight: bold;">Placement &amp; Training Fee<br>SB A/C No.&nbsp; 6106240021</div>
                           <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                           <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                           <div style="padding-top: 3px;">
                              <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                              <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                                 <tbody>
                                    <tr style="border: 1px solid #111;">
                                       <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                       <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                    </tr>
                                    <tr style="border: 1px solid #111;">
                                       <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Personality &amp; Career Development programmes and all other Training programme for higher studies. Industrial training in industries for the whole academic year - <b>optional</b></td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                    </tr>
                                    <tr>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <div style="padding-top: 10px;">Signature of the Remitter :</div>
                           <div style="padding-top: 20px;">
                              <div style="float: left;">Cashier</div>
                              <div style="float: right;">Asst.Manager/Manager</div>
                           </div>
                        </div>
                        <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                           <div style="text-align: center; font-size: 15px; font-weight: bold;">COLLEGE COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                           <div>
                              <div style="float: left; height: 65px;">
                                 <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                                 <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                              </div>
                              <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                           </div>
                           <div style="clear: both; padding-top: 3px;">
                              <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                           </div>
                           <div style="text-align: center;">Paid into the Credit of</div>
                           <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                           <div style="text-align: center; font-weight: bold;">Placement &amp; Training Fee<br>SB A/C No.&nbsp; 6106240021</div>
                           <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                           <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                           <div style="padding-top: 3px;">
                              <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                              <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                                 <tbody>
                                    <tr style="border: 1px solid #111;">
                                       <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                       <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                    </tr>
                                    <tr style="border: 1px solid #111;">
                                       <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Personality &amp; Career Development programmes and all other Training programme for higher studies. Industrial training in industries for the whole academic year - <b>optional</b></td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                    </tr>
                                    <tr>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <div style="padding-top: 10px;">Signature of the Remitter :</div>
                           <div style="padding-top: 20px;">
                              <div style="float: left;">Cashier</div>
                              <div style="float: right;">Asst.Manager/Manager</div>
                           </div>
                        </div>
                        <div style="float: left;position:relative; width: 265px; line-height: 22px;padding-left: 15px;margin-left: 15px; border-left: 2px solid #222;">
                           <div style="text-align: center; font-size: 15px; font-weight: bold;">STUDENT'S COPY<br>PAYABLE AT <br>ALL BRANCHES OF INDIAN BANK</div>
                           <div>
                              <div style="float: left; height: 65px;">
                                 <div style="float: left;"><img src="../css/images/sjit.jpg" alt="logo" height="65" width="65"></div>
                                 <div style="float: left;border:1px solid #222; padding-top: 5px; padding-left: 5px;padding-right: 5px;margin-left: 16px;width: 90px;">MUP Ref.No<br><span style="font-weight:bold;">MU006541023</span></div>
                              </div>
                              <div style="float: right; width: 55px; height: 65px;"><img src="../css/images/ib.jpg" alt="logo" height="65" width="65"></div>
                           </div>
                           <div style="clear: both; padding-top: 3px;">
                              <div style="text-align: right;">Date : <%=Find.getFormattedDate()%></div>
                           </div>
                           <div style="text-align: center;">Paid into the Credit of</div>
                           <div style="text-align: center; font-weight: bold;">St.Joseph's Institute of Technology</div>
                           <div style="text-align: center; font-weight: bold;">Placement &amp; Training Fee<br>SB A/C No.&nbsp; 6106240021</div>
                           <div style="padding-top: 3px;font-size:11px;">Student Name <b><%=s.getName()%> </b></div>
                           <div style="font-size:11px;">Roll No <b> <%=s.getId().toUpperCase()%></b></div>
                           <div style="padding-top: 3px;">
                              <img style="position:absolute;top: 300;left: 50;height:100px;width:200px;" src="../css/images/paidstamp.png">
                              <table width="100%" style="border-collapse: collapse; line-height: 15px; border: 1px solid #222;font-size: 12px;">
                                 <tbody>
                                    <tr style="border: 1px solid #111;">
                                       <td style="text-align: center; width: 80%; border: 1px solid #111;" align="center">Particulars</td>
                                       <td style="text-align: center; width: 20%; border: 1px solid #111;" align="center">Amount</td>
                                    </tr>
                                    <tr style="border: 1px solid #111;">
                                       <td style="padding: 10px 5px 10px 5px; border: 1px solid #111; padding-bottom: 10px;">Personality &amp; Career Development programmes and all other Training programme for higher studies. Industrial training in industries for the whole academic year - <b>optional</b></td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right" valign="middle">10000</td>
                                    </tr>
                                    <tr>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">Total&nbsp;</td>
                                       <td style="text-align: right; border: 1px solid #111;" align="right">10000</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                           <div style="padding-top: 10px;">Signature of the Remitter :</div>
                           <div style="padding-top: 20px;">
                              <div style="float: left;">Cashier</div>
                              <div style="float: right;">Asst.Manager/Manager</div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript">function printPage(){focus();print();}</script>
   </body>
   
   <%
          
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }
      if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
          
          %>
</html>