package edu.wpi.breakeven;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.jupiter.api.AfterAll;
import org.junit.runners.MethodSorters;

import com.amazonaws.util.json.Jackson;
import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.Gson;

import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.http.CreatePlaylistRequest;
import edu.wpi.breakeven.http.CreatePlaylistResponse;
import edu.wpi.breakeven.http.DeleteFromPlaylistRequest;
import edu.wpi.breakeven.http.DeleteFromPlaylistResponse;
import edu.wpi.breakeven.http.ListPlaylistRequest;
import edu.wpi.breakeven.http.ListPlaylistResponse;
import edu.wpi.breakeven.model.Playlist;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CreatePlaylistHandlerTest extends LambdaTest {
	
	@Test
    public void atestShouldBeDuplicate() {
		CreatePlaylistRequest cpreq = new CreatePlaylistRequest("tplaylist", 0);
        
        try {
        	CreatePlaylistHandler cph = new CreatePlaylistHandler();
        	cph.table = "testplaylist";
        	CreatePlaylistResponse cpresp = cph.handleRequest(cpreq, createContext("create playlist"));
        	assertEquals(null, cpresp.response);
        	assertEquals(200, cpresp.httpCode);
        } catch (Exception e) {
        	fail("Invalid:" + e.getMessage());
        }
    }
	
	@Test
	public void bgetPlaylist() {
		ListPlaylistRequest lpreq = new ListPlaylistRequest();
		try {
			ListPlaylistHandler lph = new ListPlaylistHandler();
			lph.table = "testplaylist";
			ListPlaylistResponse lpresp = lph.handleRequest(lpreq, createContext("list playlists"));
			Playlist pl = null;
			for(Playlist tpl : lpresp.list) {
				if(tpl.name.equals("tplaylist")) {
					pl = tpl;
					break;
				}
			}
			if(pl == null) {
				fail("Playlist not found in list");
			}
			assertTrue(pl.name.equals("tplaylist"));
			assertEquals(0, pl.segments);
		}
		catch(Exception e) {
			throw e;
		}
	}
	
	@After
	public void clean() throws Exception {
		PlaylistDAO dao = new PlaylistDAO();
		try {
			dao.deletePlaylist("tplaylist");
		}
		catch (Exception e) {
			throw e;
		}
	}
}