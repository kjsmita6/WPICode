package edu.wpi.breakeven;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.amazonaws.services.lambda.runtime.Context;

import edu.wpi.breakeven.http.AppendSegmentRequest;
import edu.wpi.breakeven.http.AppendSegmentResponse;
import edu.wpi.breakeven.http.MarkLocalRequest;
import edu.wpi.breakeven.http.MarkLocalResponse;

class MarkAndUnmarkLocalHandlerTest {
	private Context createContext() {
		TestContext ctx = new TestContext();
		ctx.setFunctionName("appendSegment");
		return ctx;
	}

	@Test
	void markSegmentDAO() {
		
	}
	
	@Test
	void handleRequest() {
		MarkLocalRequest var = new MarkLocalRequest("07838f3e_ea35_434d_8823_c60b47f9cba4");
		Context context = createContext();
		MarkAndUnmarkLocalHandler segmentHandler = new MarkAndUnmarkLocalHandler("bluhtest", "testsegment");
		MarkLocalResponse response = segmentHandler.handleRequest(var, context);
		assertEquals("success", response.message);
		assertEquals(200, response.code);
		
		segmentHandler = new MarkAndUnmarkLocalHandler("bluh", "seg");
		response = segmentHandler.handleRequest(var, context);
		assertTrue(response.message.contains("Unable to change segment accessibility: "));
		assertEquals(403, response.code);
		
	}

}