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
   // public static final String[] Depts={"cse","mech","it","civil","eee","ece","chemical","ei","ic","mebiotech","meap","mesc","meps","mepd","meest","meci","meme","mba","mca"};
    
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
    
    if(username.contains("cs") || username.contains("CS"))
        return "cse";
    else if(username.contains("it")|| username.contains("IT"))
        return "it";
    else if(username.contains("me")|| username.contains("ME"))
        return "mech";
    else if(username.contains("ec")|| username.contains("EC"))
        return "ece";
    else if(username.contains("ee")|| username.contains("EE"))
        return "eee";
    else if(username.contains("cv")|| username.contains("CV") ||username.contains("ci")|| username.contains("CI")||username.contains("ce")|| username.contains("CE"))
        return "civil";
    else if(username.contains("ch")|| username.contains("CH"))
        return "chemical";
    else if(username.contains("ic")|| username.contains("IC"))
        return "ic";
    else if(username.contains("ei")|| username.contains("EI"))
        return "ei";
   else if(username.contains("meps")|| username.contains("MEPS"))
        return "meps";
   else if(username.contains("meped")|| username.contains("MEPD"))
        return "meped";
  else if(username.contains("mesc")|| username.contains("MESC"))
        return "me sc";
  else if(username.contains("meme")|| username.contains("MEME"))
        return "meme";
 else if(username.contains("meest")|| username.contains("MEEST"))
        return "meest";
    else if(username.contains("meap")|| username.contains("MEAP"))
        return "meap";
    else if(username.contains("mebt")|| username.contains("MEBT"))
        return "mebiotech";
    else if(username.contains("meci")|| username.contains("MECI"))
        return "meci";
    else if(username.contains("mba")|| username.contains("MBA"))
        return "mba";
       else if(username.contains("mca")|| username.contains("MCA"))
        return "mca";
 
 
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
}
