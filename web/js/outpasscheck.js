/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    $("#outpassform").submit(function(){
       
        var date=new Date($("#nfrom").val());
        var diff=date - new Date() ;
        var hour=Math.abs(diff/(1000*60*60));
        if(hour<24)
            return true;
        else
            alert("Out Pass can only be Granted before 24hrs from date of leaving");
        return false;
    });
    
});