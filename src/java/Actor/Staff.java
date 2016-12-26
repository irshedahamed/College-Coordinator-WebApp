/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actor;

/**
 *
 * @author Lenovo
 */
public class Staff {
 
    String id;
    Councillor councillor;
    
    public Staff(String id){
    
        this.id=id;
    }
    
    public  Councillor getCouncillorDetails(){
        if(councillor==null){
        councillor=new Councillor();
        councillor.getCouncillor(id);
        }
    return councillor; 
    }
    
    
}
