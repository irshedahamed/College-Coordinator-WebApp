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
    if(type.equals("Tution"))
        return "Tuition Fee";
    else if(type.equals("Transport & Mess"))
        return "Transport, Breakfast, Tea,"
                             + "Lunch on working days and examination days. Snacks on evening special "
                             + "class days <br><b>-Optional for DS</b><br>(or)<br>Boarding for the whole academic year<br>"
                             + " ( all 3 meals evening snacks and special meals on various occasions including holidays"
                             + " except Christmas and Summer vacations)<br><b>- Optional for HS</b>";
    else if(type.equals("Placement & Training"))
        return "Personality &amp; Career Development programmes and all other Training programme"
                                + " for higher studies. Industrial training in industries for the whole academic year -"
                                + " <b>optional</b>";
    else if(type.equals("Hostel"))
        return "Hostel Fee<br><b>-Optional</b>";
    else
        return null;
    }
    
    public static String getType(String colname){
        if(colname.equals("tution"))
            return "Tution";
        else if(colname.equals("transport"))
            return "Transport & Mess";
        else  if(colname.equals("placement"))
            return "Placement & Training";
         else  if(colname.equals("hostel"))
            return "Hostel";
        else
        return null;
    }
}
