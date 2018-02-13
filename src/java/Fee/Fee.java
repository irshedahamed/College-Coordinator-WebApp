/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import Actor.Student;
import General.AcademicYear;
import java.util.List;

/**
 *
 * @author Home
 */
public class Fee {
    private static final String[] subCategory={"tution","transport","placement","development"};//hostel yet to decide
    public static final String[] getsubCategory(){
    
    return subCategory;
    }
    protected String tution;
    protected String transport;
    protected String hostel;
    protected String placement;
    protected String development;
    public String getByType(String type){
        if(type.equals("tution"))
            return tution;
        else if(type.equals("transport"))
            return transport;
        else  if(type.equals("placement"))
            return placement;
         else  if(type.equals("hostel"))
            return hostel;
        else  if(type.equals("development"))
            return development;
        else
        return null;
    }
    public String getTution() {
        return tution;
    }

    public void setTution(String tution) {
        this.tution = tution;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public String getHostel() {
        return hostel;
    }

    public String getDevelopment() {
        return development;
    }

    public void setDevelopment(String development) {
        this.development = development;
    }

    public void setHostel(String hostel) {
        this.hostel = hostel;
    }

    public String getPlacement() {
        return placement;
    }

    public void setPlacement(String placement) {
        this.placement = placement;
    }
    
    public static Fee getFeeById(String id){
    
    return getFeeById(id,AcademicYear.getFeeYear().getYear() );
    }
    
    public static Fee getFeeById(String id,String acyear){
    
    String cyear=acyear;
    Student s=Student.getById(id);
    List<BasicFee> fee=BasicFee.getByBatch(s.getBatch());
    SpecialFee sfee=SpecialFee.getFee(id, cyear);
            if(sfee==null){
                
                String type="";
                
                if(s.getAdmissionDetails().getGovt_mang().equals("Counseling"))
                type="Government";
                else if(s.getAdmissionDetails().getSport().equals("Yes"))
                    type="Sports";
                else //if(s.admission.getGovt_mang().equals("Management"))
                    type="Management";
                BasicFee bf=BasicFee.getByType(fee, type);
    
    return bf;
    }
    return sfee;
  }
}
