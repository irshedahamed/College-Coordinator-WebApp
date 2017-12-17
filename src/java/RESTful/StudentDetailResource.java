/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RESTful;

import Actor.Student;
import Actor.Student.Academic;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * REST Web Service
 *
 * @author Lenovo
 */
@Path("StudentDetail")
public class StudentDetailResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of StudentDetailResource
     */
    public StudentDetailResource() {
    }

    /**
     * Retrieves representation of an instance of RESTful.StudentDetailResource
     * @return an instance of java.lang.String
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@Context HttpHeaders headers,String body) {
        String rollno;
        JSONParser parse=new JSONParser();
        //List<Student> list = new ArrayList<Student>();
        Student s = null;
        try {
            JSONObject json = (JSONObject) parse.parse(body);
            rollno=(String) json.get("rollno");
            s = Student.getById(rollno);
            //list = Student.getAll(s.getDept(), s.getBatch(), s.getSec());
            //list.add(s);
            
        } catch (ParseException ex) {
            Logger.getLogger(StudentDetailResource.class.getName()).log(Level.SEVERE, null, ex);
        }
            return new Gson().toJson(s);
            
        //TODO return proper representation object
        //throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of StudentDetailResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
