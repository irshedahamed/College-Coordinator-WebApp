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
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Home
 */
public class Result {

    /* public static Boolean passed(String rollno,String sem,String exam){
    Boolean result=false;
    Connection conn=null;
    Statement stmt=null;
    try{
    conn=new dbcon().getConnection(Find.sdept(rollno));
    stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT model"+exam+",cycle"+exam+",(CONVERT(model"+exam+",unsigned int)+CONVERT(cycle"+exam+",unsigned int)) as combined FROM marks_table where rollno='"+rollno+"' and sem like '"+sem+"'");
        if(rs.next())
        {
            if(rs.getString("cycle"+exam).equals("N")){
                if(rs.getString("model"+exam).equals("A"))
                    result=true;
                else if(Integer.parseInt(rs.getString("model"+exam))<45)
                { result=false;}
                else
                result=true;
           
                }
            else{
        int a=rs.getInt("combined");
        if(rs.getString("cycle"+exam).equals("A") && rs.getString("model"+exam).equals("A"))
            result=true;
        else if(a<58)
            result=false;
        else
            result=true;
            }
        }
    }catch(Exception e){e.printStackTrace();}finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
    }
        return result;
    }*/
    public static int numSubFailed(String rollno, String sem, String exam,String clg) throws SQLException {
        int fail = 0;
        Subjects s = new Subjects(clg);
        s.setSem(sem);
        s.setRegulation(Batch.getRegulation(Student.getById(rollno,clg).getBatch(),clg));
        List<String> list = Subjects.getTherorySubCode(Find.sdept(rollno), s,clg);
        for (String p : list) {
            Mark m = new Mark(clg);
            m.setRollno(rollno);
            m.setSubcode(p);
            List<Mark> li = Mark.getExamMark(Find.sdept(rollno), m,clg);
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
            int a = Find.calculateTotal(markm, markc, marku);
            if (a < 45) {
                fail++;
            }
        }
        return fail;
    }
    
}
