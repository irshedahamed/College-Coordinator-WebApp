/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

  $(document).ready(function(){
        $("#checkall").on('change',function(){       
        var checkall=$("#checkall");
              
           
                    $.each($(".checkme"),function(index,value){
                        
                        var box=$(this);
                        if(checkall.is(':checked'))  
                        box.prop("checked",true);
                    else
                        box.prop("checked",false);
                    
                        
                        
                        
                    });
                    
                
                
                });
            });
