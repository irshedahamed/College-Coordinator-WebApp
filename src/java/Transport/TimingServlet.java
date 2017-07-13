package Transport;

import General.WorkingTiming;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Irshed
 */
public class TimingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        String date = request.getParameter("date");
        String batch = request.getParameter("batch");
        String dept = request.getParameter("dept");
        boolean result = WorkingTiming.checkDate(date,batch,dept);
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  processRequest(request, response);
        WorkingTiming w = new WorkingTiming();
        w.setDept( request.getParameter("dept"));
        w.setBatch(request.getParameter("batch"));
        w.setTiming(request.getParameter("time"));
        w.setDate( request.getParameter("date"));
        w.setSem(request.getParameter("sem"));
        String result = WorkingTiming.insertTiming(w);
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.getWriter().write(json);
        
    }

}
