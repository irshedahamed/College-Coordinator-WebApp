/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

import com.action.Find;
import dbconnection.dbcon;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class Student {
    String id;
    String name;
    String dept;
    String sec;
    String batch;
    String regno;
    String sex;
    String accomodation;
    String mobile;
    String mailid;
    String food;
    String bloodgrp;
    String roomno;
    String course;
    String model_type;
    String initial;
    public String getModel_type() {
        return model_type;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public void setModel_type(String model_type) {
        this.model_type = model_type;
    }
    
public String getInitial() {
        return initial;
    }

    public void setInitial(String initial) {
        this.initial = initial;
    }
    

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getBloodgrp() {
        return bloodgrp;
    }

    public void setBloodgrp(String bloodgrp) {
        this.bloodgrp = bloodgrp;
    }
    

    public String getMailid() {
        return mailid;
    }

    public void setMailid(String mailid) {
        this.mailid = mailid;
    }
    
    
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAccomodation() {
        return accomodation;
    }

    public void setAccomodation(String accomodation) {
        this.accomodation = accomodation;
    }

    
    public  class Admission{
    private String allotment;
    private String govt_mang;
    private String sport;
    private String scholarship;
    private String doa;
    private String orank;
    private String crank;
    private String gname;
    private String moi;

        public String getDoa() {
            return doa;
        }

        public void setDoa(String doa) {
            this.doa = doa;
        }

        public String getOrank() {
            return orank;
        }

        public void setOrank(String orank) {
            this.orank = orank;
        }

        public String getCrank() {
            return crank;
        }

        public void setCrank(String crank) {
            this.crank = crank;
        }

        public String getGname() {
            return gname;
        }

        public void setGname(String gname) {
            this.gname = gname;
        }

        public String getMoi() {
            return moi;
        }

        public void setMoi(String moi) {
            this.moi = moi;
        }

        public String getAllotment() {
            return allotment;
        }

        public void setAllotment(String allotment) {
            this.allotment = allotment;
        }

        public String getGovt_mang() {
            return govt_mang;
        }

        public void setGovt_mang(String govt_mang) {
            this.govt_mang = govt_mang;
        }

        public String getSport() {
            return sport;
        }

        public void setSport(String sport) {
            this.sport = sport;
        }

        public String getScholarship() {
            return scholarship;
        }

        public void setScholarship(String scholarship) {
            this.scholarship = scholarship;
        }
    
   
 
    }
    
    private Admission admission;
    private Academic academic;
    private FatherDetails fatherDetails;
    private MotherDetails motherDetails;
    private LocalGuardian localGuardian;
    private LocalGuardian2 localGuardian2;
    
    private OtherDetails otherDetails;
    private Contact contact;
    private Passport passport;
    private Visa visa;
    private General general;

    public Academic getAcademic() {
        if(academic==null)
            academic=fetchAcademicDetails();
        return academic;
    }

    public FatherDetails getFatherDetails() {
        if(fatherDetails==null)
            fatherDetails=fetchFatherDetails();
        return fatherDetails;
    }

    public MotherDetails getMotherDetails() {
        if(motherDetails==null)
            motherDetails=fetchMotherDetails();
        return motherDetails;
    }

    public LocalGuardian getLocalGuardian() {
        if(localGuardian==null)
            localGuardian=fetchLocalGuardianDetails();
        return localGuardian;
    }
 
    public LocalGuardian2 getLocalGuardian2() {
        if(localGuardian2==null)
            localGuardian2=fetchLocalGuardian2Details();
        return localGuardian2;
    }

    public OtherDetails getOtherDetails() {
        if(otherDetails==null)
            otherDetails=fetchOtherDetails();
        return otherDetails;
    }

    public Contact getContact() {
        if(contact==null)
            contact=fetchContactDetails();
        return contact;
    }

    public Passport getPassport() {
        if(passport==null)
            passport=fetchPassportDetails();
        return passport;
    }

    public Visa getVisa() {
        if(visa==null)
            visa=fetchVisaDetails();
        return visa;
    }

    public General getGeneral() {
        if(general==null)
            general=fetchGeneralDetails();
        return general;
    }
    
    public Admission getAdmissionDetails(){
        if(admission==null)
    admission=fetchAdmissionDetails();
        
        return admission;
    }

    
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
public String getRoomno(){
    return roomno;
}
public void setRoomno(String roomno){
    this.roomno=roomno;
}
    
    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getSec() {
        return sec;
    }

    public void setSec(String sec) {
        this.sec = sec;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getRegno() {
        return regno;
    }

    public void setRegno(String regno) {
        this.regno = regno;
    }
    
    public boolean isHostel(){
    if(accomodation.equalsIgnoreCase("hostel"))
        return true;
    else
        return false;
    }
     private  Admission fetchAdmissionDetails(){
    
    
         
               Connection conn=null;
         PreparedStatement stmt=null;
   Admission a=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_admission_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        a=new Admission();
                        a.setAllotment(rs.getString("adminallotment"));
                        a.setGovt_mang(rs.getString("govt_mang"));
                        a.setScholarship(rs.getString("scholarship"));
                        a.setSport(rs.getString("sports_admin"));
                        a.setCrank(rs.getString("community_rank"));
                        a.setOrank(rs.getString("overallrank"));
                        a.setGname(rs.getString("gamename"));
                        a.setDoa(rs.getString("doa"));
                        a.setMoi(rs.getString("MOI"));

                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return a;
    }
     
    public static List<Student> getAll(String dept,String batch,String sec){
        
               Connection conn=null;
    PreparedStatement stmt=null;
    List<Student> list=new ArrayList<Student>();
        try{
            
    conn=new dbcon().getConnection(dept);
    stmt = conn.prepareStatement("select * from student_personal where batch like ? "
                            + "and sec like ? order by CONVERT(regno,UNSIGNED)");
    stmt.setString(1, batch);
    stmt.setString(2, sec);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    while(rs.next()){
                        Student s=new Student();
                        s.setBatch(rs.getString("batch"));
                        s.setId(rs.getString("rollno"));
                        s.setDept(Find.sdept(s.getId()));
                        s.setRegno(rs.getString("regno"));
                        s.setName(rs.getString("name"));
                        s.setAccomodation(rs.getString("accomodation"));
                        s.setSec(rs.getString("sec"));
                        s.setMobile(rs.getString("mobileno"));
                        s.setSex(rs.getString("gender"));
                        s.setMailid(rs.getString("mailid"));
                        s.setFood(rs.getString("food"));
                        s.setBloodgrp(rs.getString("bloodgrp"));
                        s.setCourse(rs.getString("course"));
                        s.setModel_type(rs.getString("model_type"));
                        

                        list.add(s);
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
    
    return list;
    }
    

      public static Student getById(String id){
        
               Connection conn=null;
    PreparedStatement stmt=null;
    Student s=null;
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_personal where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        s=new Student();
                        s.setBatch(rs.getString("batch"));
                        s.setDept(Find.sdept(id));
                        s.setRegno(rs.getString("regno"));
                        s.setName(rs.getString("name"));
                        s.setId(rs.getString("rollno"));
                        s.setSec(rs.getString("sec"));
                        s.setSex(rs.getString("gender"));
                        s.setAccomodation(rs.getString("accomodation"));
                        s.setMobile(rs.getString("mobileno"));
                        s.setMailid(rs.getString("mailid"));
                        s.setFood(rs.getString("food"));
                        s.setBloodgrp(rs.getString("bloodgrp"));
                        s.setCourse(rs.getString("course"));
                        s.setModel_type(rs.getString("model_type"));
                        s.setInitial(rs.getString("initial"));
                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
    
    return s;
    }
public class Academic{
    String tenthschool;
    String tenthmark;
    String tenthboard;
    String tenthmedium;
    String tenthyearofpass;
    String twelfthschool;
    String twelfthmark;
    String twelfthboard;
    String twelfthmedium;
    String twelfthyearofpass;
    String diplomaclg;
    String diplomamark;
    String diplomaboard;
    String diplomamedium;
    String diplomayearofpass;

       
        
    

        public String getTenthschool() {
            return tenthschool;
        }

        public void setTenthschool(String tenthschool) {
            this.tenthschool = tenthschool;
        }

        public String getTenthmark() {
            return tenthmark;
        }

        public void setTenthmark(String tenthmark) {
            this.tenthmark = tenthmark;
        }

        public String getTenthboard() {
            return tenthboard;
        }

        public void setTenthboard(String tenthboard) {
            this.tenthboard = tenthboard;
        }

        public String getTenthmedium() {
            return tenthmedium;
        }

        public void setTenthmedium(String tenthmedium) {
            this.tenthmedium = tenthmedium;
        }

        public String getTenthyearofpass() {
            return tenthyearofpass;
        }

        public void setTenthyearofpass(String tenthyearofpass) {
            this.tenthyearofpass = tenthyearofpass;
        }

        public String getTwelfthschool() {
            return twelfthschool;
        }

        public void setTwelfthschool(String twelfthschool) {
            this.twelfthschool = twelfthschool;
        }

        public String getTwelfthmark() {
            return twelfthmark;
        }

        public void setTwelfthmark(String twelfthmark) {
            this.twelfthmark = twelfthmark;
        }

        public String getTwelfthboard() {
            return twelfthboard;
        }

        public void setTwelfthboard(String twelfthboard) {
            this.twelfthboard = twelfthboard;
        }

        public String getTwelfthmedium() {
            return twelfthmedium;
        }

        public void setTwelfthmedium(String twelfthmedium) {
            this.twelfthmedium = twelfthmedium;
        }

        public String getTwelfthyearofpass() {
            return twelfthyearofpass;
        }

        public void setTwelfthyearofpass(String twelfthyearofpass) {
            this.twelfthyearofpass = twelfthyearofpass;
        }

        public String getDiplomaclg() {
            return diplomaclg;
        }

        public void setDiplomaclg(String diplomaclg) {
            this.diplomaclg = diplomaclg;
        }

        public String getDiplomamark() {
            return diplomamark;
        }

        public void setDiplomamark(String diplomamark) {
            this.diplomamark = diplomamark;
        }

        public String getDiplomaboard() {
            return diplomaboard;
        }

        public void setDiplomaboard(String diplomaboard) {
            this.diplomaboard = diplomaboard;
        }

        public String getDiplomamedium() {
            return diplomamedium;
        }

        public void setDiplomamedium(String diplomamedium) {
            this.diplomamedium = diplomamedium;
        }

        public String getDiplomayearofpass() {
            return diplomayearofpass;
        }

        public void setDiplomayearofpass(String diplomayearofpass) {
            this.diplomayearofpass = diplomayearofpass;
        }
    
}
public class Contact{
    String doorno;
    String street;
    String country;
    String state;
    String pincode;
    String area;
    String city;
    String district;

        public String getDoorno() {
            return doorno;
        }

        public void setDoorno(String doorno) {
            this.doorno = doorno;
        }

        public String getStreet() {
            return street;
        }

        public void setStreet(String street) {
            this.street = street;
        }

        public String getCountry() {
            return country;
        }

        public void setCountry(String country) {
            this.country = country;
        }

        public String getState() {
            return state;
        }

        public void setState(String state) {
            this.state = state;
        }

        public String getPincode() {
            return pincode;
        }

        public void setPincode(String pincode) {
            this.pincode = pincode;
        }

        public String getArea() {
            return area;
        }

        public void setArea(String area) {
            this.area = area;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getDistrict() {
            return district;
        }

        public void setDistrict(String district) {
            this.district = district;
        }
  
    }
public class FatherDetails{
    String fathername;
    String qualification;
    String occupation;
    String desig;
    String address;
    String landline;
    String mobile;
    String mail;

        public String getFathername() {
            return fathername;
        }

        public void setFathername(String fathername) {
            this.fathername = fathername;
        }

        public String getQualification() {
            return qualification;
        }

        public void setQualification(String qualification) {
            this.qualification = qualification;
        }

        public String getOccupation() {
            return occupation;
        }

        public void setOccupation(String occupation) {
            this.occupation = occupation;
        }

        public String getDesig() {
            return desig;
        }

        public void setDesig(String desig) {
            this.desig = desig;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getLandline() {
            return landline;
        }

        public void setLandline(String landline) {
            this.landline = landline;
        }

        public String getMobile() {
            return mobile;
        }

        public void setMobile(String mobile) {
            this.mobile = mobile;
        }

        public String getMail() {
            return mail;
        }

        public void setMail(String mail) {
            this.mail = mail;
        }
    
}
public class MotherDetails{
    String mothername;
    String qualification;
    String occupation;
    String desig;
    String address;
    String landline;
    String mobile;
    String mail;

        public String getMothername() {
            return mothername;
        }

        public void setMothername(String mothername) {
            this.mothername = mothername;
        }

        public String getQualification() {
            return qualification;
        }

        public void setQualification(String qualification) {
            this.qualification = qualification;
        }

        public String getOccupation() {
            return occupation;
        }

        public void setOccupation(String occupation) {
            this.occupation = occupation;
        }

        public String getDesig() {
            return desig;
        }

        public void setDesig(String desig) {
            this.desig = desig;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getLandline() {
            return landline;
        }

        public void setLandline(String landline) {
            this.landline = landline;
        }

        public String getMobile() {
            return mobile;
        }

        public void setMobile(String mobile) {
            this.mobile = mobile;
        }

        public String getMail() {
            return mail;
        }

        public void setMail(String mail) {
            this.mail = mail;
        }
    
}
public class LocalGuardian{
    String doorno;
    String name;
    String street;
    String area;
    String city;
    String pincode;
    String phonenum;

        public String getDoorno() {
            return doorno;
        }

        public void setDoorno(String doorno) {
            this.doorno = doorno;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getStreet() {
            return street;
        }

        public void setStreet(String street) {
            this.street = street;
        }

        public String getArea() {
            return area;
        }

        public void setArea(String area) {
            this.area = area;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getPincode() {
            return pincode;
        }

        public void setPincode(String pincode) {
            this.pincode = pincode;
        }

        public String getPhonenum() {
            return phonenum;
        }

        public void setPhonenum(String phonenum) {
            this.phonenum = phonenum;
        }
    
    
}

public class LocalGuardian2{
    String doorno;
    String name;
    String street;
    String area;
    String city;
    String pincode;
    String phonenum;

        public String getDoorno() {
            return doorno;
        }

        public void setDoorno(String doorno) {
            this.doorno = doorno;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getStreet() {
            return street;
        }

        public void setStreet(String street) {
            this.street = street;
        }

        public String getArea() {
            return area;
        }

        public void setArea(String area) {
            this.area = area;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getPincode() {
            return pincode;
        }

        public void setPincode(String pincode) {
            this.pincode = pincode;
        }

        public String getPhonenum() {
            return phonenum;
        }

        public void setPhonenum(String phonenum) {
            this.phonenum = phonenum;
        }
    
    
}
public class General{
    String dob;
    String caste;
    String community;
    String religion;
    String nationality;
    String mothertongue;
    String parentincome;
    String club;
    String boarding;
        public boolean  update(){
        
         Connection conn=null;
       Statement stmt=null;
       
       try{
           conn=new dbcon().getConnection(Find.sdept(id));
            PreparedStatement pstmt;
            String sql1="update student_general set dob="+"?"+", caste='"+caste+"', community='"+community+
                    "', parents_annual_income='"+parentincome+"', religion='"+religion+"', nationality='"+nationality+
                    "', mother_tongue='"+mothertongue+"', club_member='"+club+"', boardingpt='"+boarding+"' where rollno like '"+id+"'";
    
        
            pstmt=conn.prepareStatement(sql1);
       if(dob!=null)
         pstmt.setDate(1,Date.valueOf(dob));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
      
       pstmt.executeUpdate();
     
       
       }catch(Exception e){
       e.printStackTrace();
      return false;
       }finally{
           try {
               if(stmt!=null)
                   stmt.close();
               if(conn!=null)
                   ;//conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
           return true;
       
        }
        
        public String getDob() {
            return dob;
        }

        public void setDob(String dob) {
            this.dob = dob;
        }

        public String getCaste() {
            return caste;
        }

        public void setCaste(String caste) {
            this.caste = caste;
        }

        public String getCommunity() {
            return community;
        }

        public void setCommunity(String community) {
            this.community = community;
        }

        public String getReligion() {
            return religion;
        }

        public void setReligion(String religion) {
            this.religion = religion;
        }

        public String getNationality() {
            return nationality;
        }

        public void setNationality(String nationality) {
            this.nationality = nationality;
        }

        public String getMothertongue() {
            return mothertongue;
        }

        public void setMothertongue(String mothertongue) {
            this.mothertongue = mothertongue;
        }

        public String getParentincome() {
            return parentincome;
        }

        public void setParentincome(String parentincome) {
            this.parentincome = parentincome;
        }

        public String getClub() {
            return club;
        }

        public void setClub(String club) {
            this.club = club;
        }

        public String getBoarding() {
            return boarding;
        }

        public void setBoarding(String boarding) {
            this.boarding = boarding;
        }
    
}
public class OtherDetails{
    String transferfrom;
    String instname;
    String prevaddress;
    String group;
    String yearofadmission;
    String yearrelif;
    String course_completed_in_time;
    String board;
    String medium;
    String reasonfordiscontinue;

        public String getTransferfrom() {
            return transferfrom;
        }

        public void setTransferfrom(String transferfrom) {
            this.transferfrom = transferfrom;
        }

        public String getInstname() {
            return instname;
        }

        public void setInstname(String instname) {
            this.instname = instname;
        }

        public String getPrevaddress() {
            return prevaddress;
        }

        public void setPrevaddress(String prevaddress) {
            this.prevaddress = prevaddress;
        }

        public String getGroup() {
            return group;
        }

        public void setGroup(String group) {
            this.group = group;
        }

        public String getYearofadmission() {
            return yearofadmission;
        }

        public void setYearofadmission(String yearofadmission) {
            this.yearofadmission = yearofadmission;
        }

        public String getYearrelif() {
            return yearrelif;
        }

        public void setYearrelif(String yearrelif) {
            this.yearrelif = yearrelif;
        }

        public String getCourse_completed_in_time() {
            return course_completed_in_time;
        }

        public void setCourse_completed_in_time(String course_completed_in_time) {
            this.course_completed_in_time = course_completed_in_time;
        }

        public String getBoard() {
            return board;
        }

        public void setBoard(String board) {
            this.board = board;
        }

        public String getMedium() {
            return medium;
        }

        public void setMedium(String medium) {
            this.medium = medium;
        }

        public String getReasonfordiscontinue() {
            return reasonfordiscontinue;
        }

        public void setReasonfordiscontinue(String reasonfordiscontinue) {
            this.reasonfordiscontinue = reasonfordiscontinue;
        }

        
    
    
}
public class Passport{
    String doe; 
    String passno;
    String forgn;

        public String getDoe() {
            return doe;
        }

        public void setDoe(String doe) {
            this.doe = doe;
        }

        public String getPassno() {
            return passno;
        }

        public void setPassno(String passno) {
            this.passno = passno;
        }

        public String getForgn() {
            return forgn;
        }

        public void setForgn(String forgn) {
            this.forgn = forgn;
        }
    
}
public class Visa{
    String doe;
    String visano;
    String type;

        public String getDoe() {
            return doe;
        }

        public void setDoe(String doe) {
            this.doe = doe;
        }

        public String getVisano() {
            return visano;
        }

        public void setVisano(String visano) {
            this.visano = visano;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
    
}
  private Academic fetchAcademicDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   Academic a=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_academic_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        a = new Academic();
                        a.setTenthschool(rs.getString("tenscl"));
                        a.setTenthmark(rs.getString("tenmrks"));
                        a.setTenthmedium(rs.getString("tenmed"));
                        a.setTenthyearofpass(rs.getString("tenyop"));
                        a.setTenthboard(rs.getString("tenboard"));
                        a.setTwelfthschool(rs.getString("twlscl"));
                        a.setTwelfthmark(rs.getString("twlmrks"));
                        a.setTwelfthmedium(rs.getString("twlmed"));
                        a.setTwelfthyearofpass(rs.getString("twlyop"));
                        a.setTwelfthboard(rs.getString("twlboard"));        
                        a.setDiplomaclg(rs.getString("dipcoll"));
                        a.setDiplomaboard(rs.getString("dipboard"));
                        a.setDiplomamark(rs.getString("dipmrks"));
                        a.setDiplomamedium(rs.getString("dipmed"));
                        a.setDiplomayearofpass(rs.getString("dipyop"));
                        

                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return a;
    }
 private  Contact fetchContactDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   Contact c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_contact_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new Contact();
                        c.setDoorno(rs.getString("Doorno"));
                        c.setStreet(rs.getString("street"));
                        c.setArea(rs.getString("area"));
                        c.setCity(rs.getString("city"));
                        c.setDistrict(rs.getString("district"));
                        c.setCountry(rs.getString("country"));
                        c.setState(rs.getString("state"));
                        c.setPincode(rs.getString("pincode"));
                        
                        

                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }
private  FatherDetails fetchFatherDetails(){
    
   
         
               Connection conn=null;
    PreparedStatement stmt=null;
   FatherDetails c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_father_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new FatherDetails();
                       c.setFathername(rs.getString("fathers_name"));
                       c.setOccupation(rs.getString("occupation"));
                       c.setQualification(rs.getString("qualification"));
                       c.setMobile(rs.getString("mobile"));
                       c.setMail(rs.getString("mailid"));
                       c.setAddress(rs.getString("address"));
                       c.setDesig(rs.getString("designation"));
                       c.setLandline(rs.getString("landline"));

                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }
private  MotherDetails fetchMotherDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   MotherDetails c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_mother_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new MotherDetails();
                       c.setMothername(rs.getString("mothers_name"));
                       c.setOccupation(rs.getString("occupation"));
                       c.setQualification(rs.getString("qualification"));
                       c.setMobile(rs.getString("mobileno"));
                       c.setMail(rs.getString("mailid"));
                       c.setAddress(rs.getString("address"));
                       c.setDesig(rs.getString("designation"));
                       c.setLandline(rs.getString("landline"));

                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }
private  General fetchGeneralDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   General c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_general where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new General();
                       c.setBoarding(rs.getString("boardingpt"));
                       c.setCaste(rs.getString("caste"));
                       c.setClub(rs.getString("club_member"));
                       c.setCommunity(rs.getString("community"));
                       c.setDob(rs.getString("dob"));
                       c.setMothertongue(rs.getString("mother_tongue"));
                       c.setNationality(rs.getString("nationality"));
                       c.setParentincome(rs.getString("parents_annual_income"));
                       c.setReligion(rs.getString("religion"));
                       
                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }

private  LocalGuardian fetchLocalGuardianDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   LocalGuardian c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_local_guardian where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new LocalGuardian();
                       c.setArea(rs.getString("area"));
                       c.setCity(rs.getString("city"));
                       c.setDoorno(rs.getString("Doorno"));
                       c.setName(rs.getString("name"));
                       c.setPhonenum(rs.getString("phno"));
                       c.setPincode(rs.getString("pincode"));
                       c.setStreet(rs.getString("streetname"));
                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
       
        
    return c;
    }

private  LocalGuardian2 fetchLocalGuardian2Details(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   LocalGuardian2 c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_local_guardian2 where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new LocalGuardian2();
                       c.setArea(rs.getString("area"));
                       c.setCity(rs.getString("city"));
                       c.setDoorno(rs.getString("Doorno"));
                       c.setName(rs.getString("name"));
                       c.setPhonenum(rs.getString("phno"));
                       c.setPincode(rs.getString("pincode"));
                       c.setStreet(rs.getString("streetname"));
                        
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }

private  OtherDetails fetchOtherDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   OtherDetails c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_other_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new OtherDetails();
                       c.setBoard(rs.getString("boardofstudy"));
                       c.setCourse_completed_in_time(rs.getString("course_completed_in_time"));
                       c.setGroup(rs.getString("group"));
                       c.setInstname(rs.getString("instname"));
                       c.setMedium(rs.getString("medium"));
                       c.setPrevaddress(rs.getString("prev_addr"));
                       c.setTransferfrom(rs.getString("transfer_from_other_inst"));
                       c.setYearofadmission(rs.getString("yearadm"));
                       c.setReasonfordiscontinue(rs.getString("reason_for_discontinuation"));
                       c.setYearrelif(rs.getString("yearrelif"));
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }

private  Passport fetchPassportDetails(){
    
    
         
               Connection conn=null;
    PreparedStatement stmt=null;
   Passport c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_passport_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new Passport();
                    c.setDoe(rs.getString("doe"));
                    c.setForgn(rs.getString("forgn"));
                    c.setPassno(rs.getString("passno"));
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }
private Visa fetchVisaDetails(){
    
    
         
               Connection conn=null;
   PreparedStatement stmt=null;
   Visa c=null;
    
        try{
            
    conn=new dbcon().getConnection(Find.sdept(id));
    stmt = conn.prepareStatement("select * from student_visa_details where rollno like ?");
    stmt.setString(1, id);
                    ResultSet rs=stmt.executeQuery();
                    
                    
                    rs.beforeFirst();
                    if(rs.next()){
                        c=new Visa();
                    c.setDoe(rs.getString("doe"));
                    c.setVisano(rs.getString("visano"));
                    c.setType(rs.getString("typeofvisa"));
                    }
    }catch(Exception e){
    e.printStackTrace();
    }finally{
        try {
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                ;//conn.close();
        } catch (SQLException ex) {
      ex.printStackTrace();
        }
    }
        
        
    return c;
    }
}
