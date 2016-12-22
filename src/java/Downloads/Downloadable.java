/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Downloads;

import java.util.List;

/**
 *
 * @author Home
 */
public class Downloadable {
     private String name;
    private String desc;
   
    private String path;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }



    public String getPath() {
        return path;
    }

    public void setPath(String path) {      
        this.path=path;
        
    }
    
        
    public static String getHTMLContent(List<? extends Downloadable> list){
        String HTML="<div align='left' style='margin-left:25px;'>";
        
        for(Downloadable c:list){
            
        HTML+="<a href='../formsdownload?ind1="+c.getName().replace("&", "%26")+""
                + "&path="+c.getPath()+" ' >"
                + c.getDesc()+"</a>"+"<br><br>";
        }
                 HTML+="</div>";
    return HTML;
    }
    
    
}
