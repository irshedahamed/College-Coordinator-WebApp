/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import Actor.Student;

/**
 *
 * @author Lenovo
 */
public class Hostel {
    
    public static boolean AuthenticateAccess(String username,Student stu){
    boolean flag=false;
            if(!stu.isHostel())
                return false;
                         if(username.contains("girl")){
                         if(stu.getSex().contains("F"))
                                flag=true;
                         }else{
                         if(!stu.getSex().contains("F"))
                                flag=true;
                         
                         }
    
    return flag;
    }
    
}
