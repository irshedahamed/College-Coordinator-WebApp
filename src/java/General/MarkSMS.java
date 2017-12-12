/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import Actor.Student;
import Mark.Mark;
import Subjects.Subjects;
import com.action.Find;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Home
 */
public class MarkSMS {

    public static String getContent(String rollno, String sem, String exam) throws SQLException {
        String marks = "";
        String pass;
        String name;
        String status;
        String content = "";
        int i = 0;
        Subjects s = new Subjects();
        s.setSem(sem);
        String batch=Student.getById(rollno).getBatch();
        s.setAyear(Find.getAcyear(batch, sem));
        s.setRegulation(Batch.getRegulation(batch));
        List<String> list = Subjects.getTherorySubCode(Find.sdept(rollno), s);
        for (String p : list) {
            Mark m = new Mark();
            m.setRollno(rollno);
            m.setSubcode(p);
            List<Mark> li = Mark.getExamMark(Find.sdept(rollno), m);
            String markc = null, markm = null, marku = null;
            for (Mark mi : li) {
                if (mi.getType().equals("model" + exam)) {
                    markm = mi.getMark();
                } else if (mi.getType().equals("unit" + exam)) {
                    marku = mi.getMark();
                } else if (mi.getType().equals("cycle" + exam)) {
                    markc = mi.getMark();
                }
            }
            i++;
            int mark;
            String subcode = p.toUpperCase();
            subcode = "Sub" + i + "(" + subcode + ")";
            mark = Find.calculateTotal(markm, markc, marku);
            if (markm != null && markm.equals("A")) {
                marks += subcode + ":" + "A" + ", ";
            } else {
                marks += subcode + ":" + mark + ", ";
            }
            name = Student.getById(rollno).getName();
            int num = Result.numSubFailed(rollno, sem, exam);
            if (num == 0) {
                pass = "PASSED";
                status = "happy";
            } else {
                pass = "FAILED in " + num + " Subjects";
                if (num == 1) {
                    pass = pass.substring(0, pass.length() - 1);
                }
                status = "sorry";
            }
            content = "Dear Parents, "
                    + "We are " + status + " to inform you that your ward " + name + " (" + rollno + ") has " + pass + " in the Model-" + exam + " Examination,Securing the following Marks " + marks.substring(0, marks.length() - 2) + ".Refer Portal for further details";
        }
        return content;
    }
}
