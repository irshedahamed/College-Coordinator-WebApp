package com.action;

import General.AcademicYear;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Home
 */
public class Find {
    
    
    public static final String[] Depts={"cse","mech","it","civil","eee","ece"};
   // public static final String[] Depts={"cse","mech","it","civil","eee","ece","chemical","ei","ic","biotech","mebiotech","meap","mesc","meps","mepd","meest","meci","meme","mecs","mees","mepe","mba","mca"};
    
    public static final String SERVERURL="https://portal.stjosephstechnology.ac.in/";
    static public String dept(String username){
    if(username.contains("cse"))
        return "cse";
    else if(username.contains("it"))
        return "it";
    else if(username.contains("mech"))
        return "mech";
    else if(username.contains("ece"))
        return "ece";
    else if(username.contains("eee"))
        return "eee";
    else if(username.contains("civil"))
        return "civil";
    return null;
    
    }
    
    static public String sdept(String username){
    
        username=username.toUpperCase();
    if(username.contains("MECS"))
        return "mecs";    
   else if(username.contains("MEPS"))
        return "meps";
    else if( username.contains("MEEST"))
        return "meest";
     else if( username.contains("MEES"))
        return "mees";
    else if( username.contains("MEPD"))
        return "meped";
     else if( username.contains("MEPE"))
        return "mepe";
    else if( username.contains("MESC"))
        return "mesc";
    else if( username.contains("MEME"))
        return "meme";
    else if( username.contains("MEAP"))
        return "meap";
    else if( username.contains("MEBT"))
        return "mebiotech";
    else if( username.contains("MECI"))
        return "meci";
    else if( username.contains("MBA"))
        return "mba";
    else if(username.contains("MCA"))
        return "mca";
    else if(username.contains("CS"))
        return "cse";
    else if(username.contains("IT"))
        return "it";
    else if(username.contains("ME"))
        return "mech";
    else if(username.contains("EC"))
        return "ece";
    else if(username.contains("EE"))
        return "eee";
    else if(username.contains("CV")|| username.contains("CI")|| username.contains("CE"))
        return "civil";
    else if( username.contains("CH"))
        return "chemical";
    else if( username.contains("IC"))
        return "ic";
    else if( username.contains("EI"))
        return "ei";
     else if(username.contains("BT"))
        return "biotech";
    
 return "first";
        
    }
    
    public static String  getDate(Date d){
     String year=String.valueOf(d.getYear()+1900);
    String month,day;
    if(new Date().getMonth()+1<10)
     month="0"+String.valueOf((d.getMonth()+1));
    else 
        month=String.valueOf((d.getMonth()+1));
    if(new Date().getDate()<10)
        day="0"+String.valueOf((d.getDate()));
        else
        day=String.valueOf((d.getDate()));
    return year+month+day;
    }
    
    
    public static String  getDate(){
    return getDate(new Date());
    }
    
    
    public static String  getFormattedDate(){
    return getFormattedDate(new Date());
    }
    
    
    public static String  getFormattedDate(Date d){
     String date=getDate(d);
     return getFormattedDate(date);
    }
    
     public static String  getFormattedDate(String d){
         d=d.replace("-","");
     return d.substring(6,8)+"-"+d.substring(4,6)+"-"+d.substring(0,4);
    }
    
     public static String parseFilename(String name){
     
         StringBuilder parsed=new StringBuilder();
         for(int i=0;i<name.length();i++)
             if( Character.isLetterOrDigit( name.charAt(i)) || Character.isWhitespace(name.charAt(i)) || name.charAt(i)=='.')
                    parsed.append(name.charAt(i));
         else
                 parsed.append(' ');
         
         return parsed.toString();
     
     }
    public static String category(String id){
    if(id.contains("AD"))
        return "Admission";
    else if(id.contains("VE"))
        return "Vendor";
    else if(id.contains("VI"))
        return "Visitor";
    else if(id.contains("AL"))
        return "Alumni";
    else if(id.contains("PA"))
        return "Parent";
    else if(id.contains("LG"))
        return "Guardian";
    else if(id.contains("DR"))
        return "Driver";
    
    return null;
    }

    public static String getDeptFullForm(String dept){
    
    if(dept.equals("cse"))
            return "Computer Science and Engineering";
    else if(dept.equals("ece"))
            return "Electronics and Communication Engineering";
    else if(dept.equals("eee"))
            return "Electrical and Electronics Engineering";
    else if(dept.equals("mech"))
            return "Mechanical Engineering";
    else if(dept.equals("civil"))
            return "Civil Engineering";
    else if(dept.equals("it"))
            return "Information Technology";
    
    
    return null;
    
    }
    public static String getDeptHTMLContent(){
    
         String HTML="<option disabled selected>SELECT</option>";
      
        for(String dept:Depts){
            
        HTML+="<option value='"+dept+"'>"+dept.toUpperCase()+"</option>";
        }
                 HTML+="</div>";
    return HTML;
    }
    public static int getSem(String batch, String acyr, String semister)
    {
        
    int temp=Integer.valueOf(batch.substring(2,4));
    temp=Integer.valueOf(acyr)-temp;
    temp*=2;
    if(semister.equals("Odd"))
        temp++;
    else
        temp+=2;
    return temp;
    }
    
    public static String getAcyear(String batch,String sem){
    
        int s;
        if(Integer.valueOf(sem)%2==0)
               s= getSem(batch,AcademicYear.getCurrentYear().getYear(),"Even");
        else
            s= getSem(batch,AcademicYear.getCurrentYear().getYear(),"Odd");
      
        
    int year=Integer.valueOf(AcademicYear.getCurrentYear().getYear()) -( (s-(Integer.valueOf(sem)))/2);
     
    return  String.valueOf(year); 
    }
    
    public static int calculateBonus(int mark,String category){
    
    if(category.equals("gen")&&mark>=45)
        return 50;
    if(category.equals("8+")&&mark>=70)
        return 30;
    if(category.equals("7.5+")&&mark>=65)
        return 35;
    if(category.equals("6.5+")&&mark>=60)
        return 40;
    if(category.equals("5+")&&mark>=50)
        return 50;
    if(category.equals("0")&&mark>=45)
        return 55;
    
        
    return 0;
    }
    
    public static int calcBonus(int mark,String category){
        float t=0.0F;   
        if(category.equals("8+")){
            if (mark>=45){
            return 100;
           }else{
               t = (float) (((float)mark/75.0)*100.0);
               t += t/2;
               return (int)(t+0.99);
           }
        }
        if(category.equals("7+")){
            if (mark>=41){
                return 100;
           }else{
               t = (float) ((mark/75.0)*100.0);
               t += t/2;
               return (int)(t+0.99);
           }
        }
        if(category.equals("<7")){
            if (mark>=38){
            return 100;
           }else{
               t = (float) ((mark/75.0)*100.0);
               t += t/2;
               return (int)(t+0.99);
           }
        }
        if(category.equals("0")){
        return 100;
        }
    return 0;
    }  
    public static int calculateTotal(String markm,String markc,String marku){
    
        int m,c,u;
        boolean cycle=false,unit=false,model=false;
            if(markm==null)
            {markm="0";model=true;}
        else if(markm.equals("null"))
            markm="0";
      
        if(markc==null)
        {markc="0";cycle=true;}
        else if(markc.equals("null"))
            markc="0";
      
        if(marku==null)
        { marku="0";unit=true;}
        else if(marku.equals("null"))
            marku="0";
      
        
        m=0;
        if(markm.equals("A"))
       m=0;
        else if(markm.equals("N"))
            model=true;
        else
         m = Integer.parseInt(markm);
        
        c=0;
        if(markc.equals("A"))
        c=0;
        else if(markc.equals("N"))
            cycle=true;
        else
        c = Integer.parseInt(markc);
        
        u=0;
        if(marku.equals("A"))
        u=0;
        else if(marku.equals("A"))
        unit=true;
        else
        u = Integer.parseInt(marku);
        
        
           float t=0.0F;
           if(cycle && unit)
               t=m;
           else if(unit){
               t=(float)m+ (float)c ;
            
                t/=1.3;
                t=(int)(t+0.99);//Rounding
           
           }else if(cycle){
               t=(float)m+ ( ((float)u / 48)*15 ) ;
            
                t/=1.15;
                t=(int)(t+0.99);//Rounding
           
           }else{
           t=(float)m+ ( (float)c /2 )+ ( ((float)u / 48)*15 );
            
                t/=1.3;
                t=(int)(t+0.99);//Rounding
           }
        
               
    return (int)t;
    }
    
    
    }

