/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import Actor.Student;
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
 * @author irshed
 */
public class LabMarkUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //   processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            String regulation = session.getAttribute("regulation").toString();
            String sem = session.getAttribute("sem").toString();
            String batch = session.getAttribute("batch").toString();
            String dept = session.getAttribute("dept").toString();
            String exam = session.getAttribute("exam").toString();
            String ayear = session.getAttribute("ayear").toString();
            String mark;
            int count = 0;
            Subjects s = new Subjects();
            s.setAyear(ayear);
            s.setRegulation(regulation);
            s.setSem(sem);
            List<String> Subcodelist = Subjects.getLabSubCode(dept, s);
            for (String subcode : Subcodelist) {
                List<Student> list = Student.getAll(dept, batch, "%");
                for (Student stu : list) {
                    String a1 = stu.getId() + "_" + count;
                    mark = request.getParameter(a1);
                    if (mark == null) {
                        continue;
                    }
                    Mark m = new Mark();
                    m.setRollno(stu.getId());
                    m.setSubcode(subcode);
                    m.setType(exam);
                    m.setMark(mark);
                    Mark m1 = new Mark();
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
