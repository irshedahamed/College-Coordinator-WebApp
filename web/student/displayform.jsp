<%-- 
    Document   : displayform
    Created on : Feb 1, 2016, 10:55:18 AM
    Author     : Divya Sri
--%>

<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
<!DOCTYPE html>

		




<div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>Forms</h2><br><br>
<div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
<div align="left">
<% 
    String form = request.getParameter("index");
        
        String path = Base.path+"/forms/"+form+"/";
        List<String> list = new ArrayList<String>();
        List<String> listdescp=new ArrayList<String>();        
          try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection1 = new dbcon().getConnection("sjitportal");
            Statement statement1 = connection1.createStatement();
            ResultSet rs = statement1.executeQuery("select filename,descp from forms where location = '"+path+"'");
            
            
            while(rs.next())
            {
                String file = rs.getString("filename");
                    listdescp.add(rs.getString("descp"));
                 list.add(file);
                 
            }
            
            %>
            
            <%
           
            for(int i=0; i<list.size();i++)
              {
                  String str=list.get(i);
                  //session.setAttribute(str,list.get(i));
                  session.setAttribute("path",path);
            %>
            <a href="${pageContext.request.contextPath}/notesdownload?ind1=<%=str %>" ><%= str %> - <%=listdescp.get(i)%></a>
<br>
<%
           
           }
            session.setAttribute("size",list.size());
              if(statement1!=null)
                            statement1.close();
                              if(connection1!=null)
                                connection1.close();
          }
          catch(Exception e)
          {
           e.printStackTrace();
          }
%></div>
</div>
</center>
</div>
</div>










</html>
