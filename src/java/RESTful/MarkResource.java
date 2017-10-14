/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RESTful;

import Actor.Student;
import General.Batch;
import Mark.Mark;
import Subjects.Subjects;
import com.action.Find;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
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
    @Path("{auth}/{rollno}/{sem}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Mark> getJson(@PathParam("auth")String auth,@PathParam("rollno")String rollno,@PathParam("sem")String sem) throws SQLException {
        //TODO return proper representation object
       Subjects s = new Subjects();
        s.setSem(sem);
        List<Mark> mlist=new ArrayList<Mark>();
        Student stu=Student.getById(rollno);
        s.setAyear(Find.getAcyear(stu.getBatch(), sem));
        s.setRegulation(Batch.getRegulation(stu.getBatch()));
        List<String> list = Subjects.getTherorySubCode(stu.getDept(), s);
        for(String subcode:list){
                    Mark m = new Mark();
                    m.setSubcode(subcode);
                    m.setType(context.getQueryParameters().getFirst("exam"));
                    m.setRollno(rollno);
                    m.fetchMark();
           
                    mlist.add(m);

                }
        return mlist;
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
