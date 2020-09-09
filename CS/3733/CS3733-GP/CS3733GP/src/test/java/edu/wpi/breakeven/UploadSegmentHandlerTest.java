package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.util.UUID;

import org.junit.Assert;
import org.junit.Before;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.google.gson.Gson;

import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.DeleteRemoteSiteRequest;
import edu.wpi.breakeven.http.DeleteSegmentRequest;
import edu.wpi.breakeven.http.DeleteSegmentResponse;
import edu.wpi.breakeven.http.UploadSegmentRequest;
import edu.wpi.breakeven.http.UploadSegmentResponse;

class UploadSegmentHandlerTest extends LambdaTest{
	
	
//    void testFailInput(String incoming) throws IOException {
//    	UploadSegmentRequest req = new Gson().fromJson(incoming, UploadSegmentRequest.class);
//    	System.out.println("UploadSegmentrequest that should fail: " + req);
//    	UploadSegmentResponse response = handler.handleRequest(req, createContext("adding remote site"));
//
//    	String JSONreturned = new Gson().toJson(response);
//        System.out.println("should fail because empty: " + JSONreturned);
//        
//        Assert.assertEquals(422, response.statusCode);
//        
  //}
    
 
    

	@Test
	void testUploadWorks() {
		UploadSegmentRequest usp = new UploadSegmentRequest("TestCharacter","TestQuote","Mi43MTgyODE4Mjg=");
		String input = new Gson().toJson(usp);
		System.out.println("Upload Segment Works test : "+ input);
		
		UploadSegmentRequest req = new Gson().fromJson(input, UploadSegmentRequest.class);
        UploadSegmentHandler ush = new UploadSegmentHandler("bluhtest","testsegment");
        ush.table = "testsegment";
        ush.bucket = "bluhtest";
        UploadSegmentResponse resp = ush.handleRequest(req, createContext("adding remote site"));
        
        Assert.assertEquals(200, resp.statusCode);
        Assert.assertNull(resp.error);
        
		String uuid = "TestCharacter".substring("TestCharacter".length()-4,"TestCharacter".length())+ "TestQuote".substring("TestQuote".length()-4,"TestQuote".length());
		DeleteSegmentRequest dsr = new DeleteSegmentRequest(uuid);
		DeleteSegmentHandler dsh = new DeleteSegmentHandler("bluhtest", "testsegment");
		dsh.table = "testsegment";
		dsh.bucket = "bluhtest";
		DeleteSegmentResponse dsresp = dsh.handleRequest(dsr, createContext("deleting test video"));
		
	}
	
//	@Test
//	void testUploadFail() {
//		UploadSegmentRequest usp = new UploadSegmentRequest();
//		String input = new Gson().toJson(usp);
//		System.out.println(input);
//		
//		try {
//			testFailInput(input);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			Assert.fail("Invalid" + e.getMessage());
//		}
//		
//	}

}
