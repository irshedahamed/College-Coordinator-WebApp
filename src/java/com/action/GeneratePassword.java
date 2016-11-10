/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.util.Random;

/**
 *
 * @author Home
 */
public class GeneratePassword {
    
   public static String next(){
        Random rn=new Random();
        String pass="";
        for(int i=0;i<8;i++)
            if(rn.nextInt()%3==0)
            pass+=String.valueOf(rn.nextInt(9));
            else
       pass+=String.valueOf(Character.toChars((rn.nextInt(26)%26)+97));
    
        return pass;
    }
    
}
