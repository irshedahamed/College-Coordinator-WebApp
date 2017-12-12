/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RESTful;

import API.Authenticate;
import Actor.Student;
import General.Batch;
import General.Error;
import Mark.Mark;
import Subjects.Subjects;
import com.action.Find;
import com.google.gson.Gson;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * REST Web Service
 *
 * @author Fluffy
 */
@Path("mark")
public class MarkResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of MarkResource
     */
    public MarkResource() {
    }

    /**
     * Retrieves representation of an instance of RESTful.MarkResource
     * @param auth
     * @return an instance of java.lang.String
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@Context HttpHeaders headers,String body) throws SQLException {
        //TODO return proper representation object
        
        String rollno,sem;
        List<Mark> mlist=new ArrayList<Mark>();
        JSONParser parse=new JSONParser();
        if(headers.getRequestHeader("Content-Type")==null || !headers.getRequestHeader("Content-Type").get(0).equals("application/json")){
            return new Error(100).toJson();
        }
       if(headers.getRequestHeader("api-key")==null || !Authenticate.validateAPI(headers.getRequestHeader("api-key").get(0)) ){
            return new Error(200).toJson();
        }
        try {
            JSONObject json=(JSONObject) parse.parse(body);
            rollno=(String) json.get("rollno");
            sem=(String) json.get("sem");
       Subjects s = new Subjects();
        s.setSem(sem);
        Student stu=Student.getById(rollno);
        s.setAyear(Find.getAcyear(stu.getBatch(), sem));
        s.setRegulation(Batch.getRegulation(stu.getBatch()));
        List<String> list = Subjects.getTherorySubCode(stu.getDept(), s);
        for(String subcode:list){
                    Mark m = new Mark();
                    m.setSubcode(subcode);
                    m.setRollno(rollno);
                    
                    mlist.addAll(Mark.getExamMark("", m));

                }
        
        } catch (ParseException ex) {
            Logger.getLogger(MarkResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return new Gson().toJson(mlist);
    }

    /**
     * PUT method for updating or creating an instance of MarkResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
        System.out.println(content);
}
    
}
