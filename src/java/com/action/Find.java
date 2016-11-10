package com.action;

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
    
}
