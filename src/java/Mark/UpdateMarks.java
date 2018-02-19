package Mark;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Irshed
 */
public class UpdateMarks extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String dept = request.getParameter("dept");
        String exam = request.getParameter("exam");
        String subcode = request.getParameter("subject");
        String mark = request.getParameter("mark");
        String rollno = request.getParameter("rollno");
        Mark m = new Mark();
        m.setRollno(rollno);
        m.setSubcode(subcode);
        m.setType(exam);
        m.setMark(mark);
        Mark m1 = new Mark();
        try {
            String result = m1.insertOrUpdateMarks(dept, m);

            if (result.equals("Updated")) {
                out.println("Updated");
            } else {
                out.println("NotUpdated");
            }
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
