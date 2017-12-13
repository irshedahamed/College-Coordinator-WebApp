/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RESTful;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.HttpHeaders;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Lenovo
 */
@Path("deptUpload")
public class DeptUploadResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of DeptCircularResource
     */
    public DeptUploadResource() {
    }

    /**
     * Retrieves representation of an instance of RESTful.DeptUploadResource
     * @return an instance of java.lang.String
     */
    @POST
    @Path("{type}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@Context HttpHeaders headers,@PathParam("type") String type) {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of DeptUploadResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
