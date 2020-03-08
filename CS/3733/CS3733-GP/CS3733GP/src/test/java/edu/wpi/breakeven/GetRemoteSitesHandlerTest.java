package edu.wpi.breakeven;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import com.amazonaws.services.lambda.runtime.Context;

import edu.wpi.breakeven.http.GetRemoteSitesRequest;
import edu.wpi.breakeven.http.GetRemoteSitesResponse;
import edu.wpi.breakeven.model.RemoteSegment;

/**
 * A simple test harness for locally invoking your Lambda function handler.
 */
public class GetRemoteSitesHandlerTest {

    private static GetRemoteSitesRequest input;

    @BeforeClass
    public static void createInput() {
        input = new GetRemoteSitesRequest();
    }

    private Context createContext() {
        TestContext ctx = new TestContext();
        ctx.setFunctionName("getRemoteSites");
        return ctx;
    }

    @Test
    public void testGetRemoteSitesHandler() {
        GetRemoteSitesHandler handler = new GetRemoteSitesHandler();
        handler.table = "testsegment";
        Context ctx = createContext();

        GetRemoteSitesResponse output = handler.handleRequest(input, ctx);
        assertEquals(2, output.segments.size());
        for(RemoteSegment site : output.segments) {
        	assertTrue(site.url.equals("asda"));
        	assertTrue(site.character.equals("remote"));
        	assertTrue(site.text.equals("remote"));
        } 
    }
}
