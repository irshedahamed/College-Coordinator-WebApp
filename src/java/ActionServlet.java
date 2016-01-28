

import java.io.IOException;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.google.gson.Gson;
import dbconnection.dbcon;

import javax.servlet.http.HttpSession;


public class ActionServlet extends HttpServlet {
private static final long serialVersionUID = 1L;


public ActionServlet() {
    // TODO Auto-generated constructor stub
}


protected void doGet(HttpServletRequest request,  
    HttpServletResponse response) throws ServletException, IOException {

    JSONArray cellarray = new JSONArray();
    JSONObject cellobj = null; //new JSONObject();
    JSONObject jo=new JSONObject();
    String sem=request.getParameter("sem"); 
    String dept=request.getParameter("dept");
    try
        
    {
        
         HttpSession session = request.getSession(true);
        String departmentname= session.getAttribute("deptname").toString();
             Connection connection = new dbcon().getConnection(departmentname);
              Statement stmt = connection.createStatement();  
         
        ResultSet rs = stmt.executeQuery("Select * from subject_sem_table where sem='"+sem+"',dept='"+dept+"'  ");  
        while(rs.next()){
            cellobj = new JSONObject();
            cellobj.put("id", rs.getString(1));
            cellobj.put("name", rs.getString(3));
            cellarray.add(cellobj);
        }  
        jo.put("arrayName",cellarray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jo.toString());
    }
    catch(Exception e){
     System.out.println(e);
    }



}


protected void doPost(HttpServletRequest request, 
    HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub

}

 }