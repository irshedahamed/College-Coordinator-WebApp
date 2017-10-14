/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RESTful;

import Mark.Mark;
import com.action.Find;
import java.sql.SQLException;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

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
    @GET
    @Path("{auth}/{rollno}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Mark> getJson(@PathParam("auth")String auth,@PathParam("rollno")String rollno) throws SQLException {
        //TODO return proper representation object
        Mark m=new Mark();
        
        System.out.println(auth);
        System.out.println(context.getAbsolutePath().toString());
        
        System.out.println(context.getPath());
        
        System.out.println(context.getQueryParameters().size());
        for(String s:context.getQueryParameters().keySet()){
        
            System.out.println(s);
            System.out.println(context.getQueryParameters().getFirst(s));
        
        
        }
        m.setRollno(rollno);
        m.setSubcode("cs2352");
        return Mark.getExamMark(Find.sdept(rollno), m);
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
