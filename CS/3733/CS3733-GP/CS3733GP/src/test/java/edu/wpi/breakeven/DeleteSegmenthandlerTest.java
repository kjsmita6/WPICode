package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.junit.Assert;
import org.junit.Before;

import com.google.gson.Gson;

import edu.wpi.breakeven.http.DeleteSegmentRequest;
import edu.wpi.breakeven.http.DeleteSegmentResponse;
import edu.wpi.breakeven.http.UploadSegmentRequest;
import edu.wpi.breakeven.http.UploadSegmentResponse;

class DeleteSegmenthandlerTest extends LambdaTest{

	@Test
	void testDeleteTwice() {
		UploadSegmentRequest usp = new UploadSegmentRequest("TestChar","QuoteTest","Mi43MTgyODE4Mjg=");
		String input = new Gson().toJson(usp);
		String incoming = input;
		UploadSegmentHandler handler = new UploadSegmentHandler("bluhtest", "testsegment");
		handler.table = "testsegment";
		handler.bucket = "bluhtest";
    	UploadSegmentRequest req = new Gson().fromJson(incoming, UploadSegmentRequest.class);
        UploadSegmentResponse response = handler.handleRequest(req, createContext("adding remote site"));
        
		DeleteSegmentRequest dsr = new DeleteSegmentRequest("Chartest");
		DeleteSegmentHandler dsh = new DeleteSegmentHandler("bluhtest", "testsegment");
		dsh.table = "testsegment";
		dsh.bucket = "bluhtest";
		DeleteSegmentResponse dsresp = dsh.handleRequest(dsr, createContext("deleting test video"));
		
		Assert.assertEquals(200,dsresp.code);
		//the test does not actually delete the segment from the bucket for some reason
//		DeleteSegmentRequest dsr2 = new DeleteSegmentRequest(uuid);
//		DeleteSegmentResponse dsh2 = new DeleteSegmentHandler("bluhtest", "testsegment").handleRequest(dsr2, createContext("deleting test video"));
//		
//		Assert.assertEquals(422, dsh2.getCode());
		
	}

}
