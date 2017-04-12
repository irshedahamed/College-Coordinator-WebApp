package com.action;

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
    
    
    
    
    
    }

