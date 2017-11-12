/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import com.google.gson.Gson;

/**
 *
 * @author Fluffy
 */
public class Error {
    
    String Error_Code;
    String Description;

    public Error() {
    }
    public Error(int code){
    Error_Code=String.valueOf(code);
    switch (code){
        case 200:
            Description="Authentication Error";
            break;
        case 100:
          Description="Invalid Format";
          break;
          
    }
    }
    public String getError_Code() {
        return Error_Code;
    }

    public void setError_Code(String Error_Code) {
        this.Error_Code = Error_Code;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
    public String toJson(){
    
        return new Gson().toJson(this);
    }
    
}
