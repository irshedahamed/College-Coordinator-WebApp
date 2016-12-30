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
    else
    return "first";
        
        
    }
    
    public static String  getDate(){
     String year=String.valueOf(new Date().getYear()+1900);
    String month,day;
    if(new Date().getMonth()+1<10)
     month="0"+String.valueOf((new Date().getMonth()+1));
    else 
        month=String.valueOf((new Date().getMonth()+1));
    if(new Date().getDate()<10)
        day="0"+String.valueOf((new Date().getDate()));
        else
        day=String.valueOf((new Date().getDate()));
    return year+month+day;
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
    
    return null;
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
