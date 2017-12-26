/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import Actor.Student;
import General.Batch;
import Subjects.Subjects;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Irshed
 */
public class ExamUpdate extends HttpServlet {

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     //   processRequest(request, response);
     response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
         String clg = (String)request.getSession().getAttribute("clg");
      
        String regulation = Batch.getRegulation(batch,clg);
        
            String mark;
            int count = 0;
              
            Subjects s = new Subjects(clg);
            s.setAyear(ayear);
            s.setRegulation(regulation);
            s.setSem(sem);
            List<String> Subcodelist;
                                    if(exam.contains("lab"))
                                Subcodelist= Subjects.getLabSubCode(dept, s,clg);
                                else
                                Subcodelist= Subjects.getTherorySubCode(dept, s,clg);
        for (String subcode : Subcodelist) {
                List<Student> list = Student.getAll(dept, batch, sec,clg);
                for (Student stu : list) {
                    String a1 = stu.getId() + "_" + count;
                    mark = request.getParameter(a1);
                    System.out.println(a1+" "+mark);
                    if (mark == null) {
                        continue;
                    }else if(mark.equals("null")){
                    continue;
                    }else if(mark.equals("")){
                    continue;
                    }
                    Mark m = new Mark(clg);
                    m.setRollno(stu.getId());
                    m.setSubcode(subcode);
                    m.setType(exam);
                    m.setMark(mark);
                    Mark m1 = new Mark(clg);
                    m1.insertOrUpdateMarks(dept, m);
                }
                count++;
            }
            response.getWriter().println("<center><h1>UPDATED SUCCESSFULLY</h1></center>");
        } catch (SQLException ex) {
            response.getWriter().print(ex);
        } catch (IOException ex) {
            response.getWriter().print(ex);
        }
    }
}