package edu.wpi.breakeven;
import java.awt.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import org.junit.Assert;
import org.junit.Test;

//
//import static org.junit.Assert.*;
//
//import java.io.IOException;
//import java.util.List;
//
//import org.junit.Assert;
//import org.junit.Test;
//
//import com.google.gson.Gson;
//
//import edu.wpi.breakeven.http.AddRemoteSiteRequest;
//import edu.wpi.breakeven.http.AddRemoteSiteResponse;
//import edu.wpi.breakeven.http.ListPlaylistRequest;
//import edu.wpi.breakeven.http.ListPlaylistResponse;
//import edu.wpi.breakeven.model.Playlist;
//import edu.wpi.breakeven.model.ThirdPartySite;
import edu.wpi.breakeven.LambdaTest;
import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.http.ListPlaylistRequest;
import edu.wpi.breakeven.http.ListPlaylistResponse;
import edu.wpi.breakeven.model.Playlist;
//
public class ListPlaylistHandlerTest extends LambdaTest {


	boolean testPlaylistArrayEquals(ArrayList<Playlist> actualArray, ArrayList<Playlist>  expectedArray) {

		if(actualArray.toArray().length != expectedArray.toArray().length)
		{
			return false;
		}
		for(int i = 0; i < actualArray.toArray().length; i++)
		{
			System.out.println("Actual playlist name: " + ((Playlist) actualArray.toArray()[i]).name);
			System.out.println("Expected playlist name: " + ((Playlist) expectedArray.toArray()[i]).name);

			if(!((Playlist) actualArray.toArray()[i]).name.equals(((Playlist) expectedArray.toArray()[i]).name)) {
				return false;
			}
			else {
				continue;
			}
		}
		return true;
	}



	@Test
	public void testHandleRequest() throws Exception {

		ListPlaylistHandler handler = new ListPlaylistHandler();
		handler.table = "testplaylist";
		ListPlaylistRequest req = new ListPlaylistRequest();
		ListPlaylistResponse resp = handler.handleRequest(req, createContext("playlist"));

		ArrayList<Playlist> list = (ArrayList<Playlist>) resp.list;


		PlaylistDAO playlist = new PlaylistDAO();
		playlist.setTable("testplaylist");
		playlist.getAllPlaylist();
		Assert.assertEquals(200, resp.statusCode);
		//		Assert.assertArrayEquals(resp.list.toArray() , playlist.getAllPlaylist().toArray());
		Assert.assertEquals(true ,testPlaylistArrayEquals((ArrayList<Playlist>) resp.list, (ArrayList<Playlist>) playlist.getAllPlaylist()));

	}
}