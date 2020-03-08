package edu.wpi.breakeven;

import org.junit.Assert;
import org.junit.Test;

import com.google.gson.Gson;

import edu.wpi.breakeven.http.CreatePlaylistRequest;
import edu.wpi.breakeven.http.CreatePlaylistResponse;
import edu.wpi.breakeven.http.DeleteFromPlaylistRequest;
import edu.wpi.breakeven.http.DeleteFromPlaylistResponse;

public class DeleteFromPlaylistHandlerTest extends LambdaTest {

	@Test
	public void testDeleteTwice() {
		CreatePlaylistRequest usp = new CreatePlaylistRequest();
		String input = new Gson().toJson(usp);
		String incoming = input;
		CreatePlaylistHandler handler = new CreatePlaylistHandler();
		handler.table = "testplaylist";
		CreatePlaylistRequest req = new Gson().fromJson(incoming, CreatePlaylistRequest.class);
		CreatePlaylistResponse response = handler.handleRequest(req, createContext("adding remote site"));
		DeleteFromPlaylistRequest dsr = new DeleteFromPlaylistRequest("woo");
		DeleteFromPlaylistResponse dsh = new DeleteFromPlaylistHandler().handleRequest(dsr, createContext("deleting test playlist"));

		Assert.assertEquals(200,dsh.code);
	}

}