package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.amazonaws.services.lambda.runtime.Context;

import edu.wpi.breakeven.http.AppendSegmentRequest;
import edu.wpi.breakeven.http.AppendSegmentResponse;

class AppendSegmentHandlerTest extends LambdaTest {
	
	String playlist = "Kirk is disturbed by probes";
	String seg = "07838f3e_ea35_434d_8823_c60b47f9cba4";
	
	private Context createContext() {
		TestContext ctx = new TestContext();
		ctx.setFunctionName("appendSegment");
		return ctx;
	}
	
	@Test
	void appendSegment() {
		AppendSegmentRequest var = new AppendSegmentRequest("07838f3e_ea35_434d_8823_c60b47f9cba4", "Kirk is disturbed by probes");
		AppendSegmentHandler ash = new AppendSegmentHandler();
		ash.table = "testsegment";
		try {
			AppendSegmentResponse resp = ash.handleRequest(var, createContext("append segment"));
			assertEquals(200, resp.httpCode);
			assertEquals("success", resp.response);
		} catch (Exception e) {
			System.out.println("Error");
		}
	}

	@Test
	void handleRequest() {
		AppendSegmentRequest var = new AppendSegmentRequest();
		var.playlistName = playlist;
		var.segmentName = seg;
		Context context = createContext();
		AppendSegmentHandler segmentHandler = new AppendSegmentHandler();
		segmentHandler.table = "testsegment";
		AppendSegmentResponse response = segmentHandler.handleRequest(var, context);
		assertEquals("success", response.response);
		assertEquals(200, response.httpCode);
		
	}
}
