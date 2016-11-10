/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Circular;

import java.util.List;

/**
 *
 * @author Home
 */
public class Circular {
    private String name;
    private String desc;
    private String type;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
    
        
    public static String getHTMLContent(List<Circular> circular){
        String HTML="<div align='left' style='margin-left:25px;'>";
        for(Circular c:circular){
            
        HTML+="<a href='../formsdownload?ind1="+c.getName()+""
                + "&path="+c.getPath()+" ' >"
                + c.getDesc()+"</a>"+"<br><br>";
        }
                 HTML+="</div>";
    return HTML;
    }
}
