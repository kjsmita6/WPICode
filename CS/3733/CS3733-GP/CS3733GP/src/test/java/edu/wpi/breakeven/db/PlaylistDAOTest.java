package edu.wpi.breakeven.db;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import edu.wpi.breakeven.db.PlaylistDAO;
import edu.wpi.breakeven.model.Playlist;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PlaylistDAOTest {
	PlaylistDAO dao;

	@Before
	public void setUp() throws Exception {
		dao = new PlaylistDAO();
		dao.setTable("testplaylist");
	}

	@Test
	public void atestAddAndGetPlaylist() throws Exception {
		Playlist pl = new Playlist("pl1", 9999);
		assertTrue(dao.addPlaylist(pl));

		Playlist back = dao.getPlaylist("pl1");
		assertTrue(back.name.equals("pl1"));
		assertEquals(9999, back.segments);
	}

	@Test
	public void btestUpdatePlaylist() throws Exception {
		Playlist pl = new Playlist("pl1", 888888);
		assertTrue(dao.updatePlaylist(pl));
		Playlist back = dao.getPlaylist("pl1");
		assertEquals(888888, back.segments);
	}

	@Test
	public void ctestGetAllPlaylist() throws Exception {
		List<Playlist> list = dao.getAllPlaylist();
		Playlist pl = null;
		for(Playlist p : list) {
			if(p.name.equals("pl1")) {
				pl = p;
			}
		}
		if(pl == null) {
			fail("playlist not found");
		}
		assertTrue(pl.name.equals("pl1"));
		assertEquals(888888, pl.segments);
	}


	@Test
	public void dtestDeletePlaylist() throws Exception {
		assertTrue(dao.deletePlaylist("pl1"));
	}
}
