/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

/**
 *
 * @author Home
 */
public class Find {
    
    public static String getFeeDetails(String type){
    if(type.equals("tution"))
        return "Tuition Fee";
    else if(type.equals("transport"))
        return "Transport, Breakfast, Tea,"
                             + "Lunch on working days and examination days. Snacks on evening special "
                             + "class days <br><b>-Optional for DS</b><br>(or)<br>Boarding for the whole academic year<br>"
                             + " ( all 3 meals evening snacks and special meals on various occasions including holidays"
                             + " except Christmas and Summer vacations)<br><b>- Optional for HS</b>";
    else if(type.equals("placement"))
        return "Personality &amp; Career Development programmes and all other Training programme"
                                + " for higher studies. Industrial training in industries for the whole academic year -"
                                + " <b>Optional</b>";
    else if(type.equals("hostel"))
        return "Hostel Fee<br><b>-Optional</b>";
    else if(type.equals("development"))
        return "Development Fee<br><b>-Optional</b>";
    else
        return null;
    }
    
    public static String getType(String colname){
        if(colname.equals("tution"))
            return "Tution";
        else if(colname.equals("transport"))
            return "Transport & Mess";
        else  if(colname.equals("placement"))
            return "Placement";
         else  if(colname.equals("hostel"))
            return "Hostel";
         else  if(colname.equals("development"))
            return "Development";
        else
        return null;
    }
    
    public static String getUtilityCode(String Amount){
    Float amt=Float.valueOf(Amount);
    return amt<=5000?"0065JIT1":amt<=10000?"0065JIT2" : "0065JIT3";
    }
}
