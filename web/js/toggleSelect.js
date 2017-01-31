/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 function toggle(id,name){
          
        $(document).ready(function(){
             
            
               
                if($("#"+id+" option:selected").val()==="others"){
                   $("#"+id).after('<input type="text" name='+name+'>');
                   $("#"+id).remove();
               }
            
                       
        });
        }