package edu.wpi.breakeven.db;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.model.ThirdPartySite;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class TPSDAOTest {
	ThirdPartyDAO dao;
	
	@Before
	public void setUp() throws Exception {
		dao = new ThirdPartyDAO();
		dao.setTable("testthirdpartysites");
	}

	@Test
	public void atestAddAndGet() throws Exception {
		ThirdPartySite tps = new ThirdPartySite("tps1", "url", "api");
		assertTrue(dao.addThirdPartySite(tps));
		
		ThirdPartySite back = dao.getThirdParty("tps1");
		assertTrue(back.name.equals("tps1"));
		assertTrue(back.url.equals("url"));
		assertTrue(back.apikey.equals("api"));
	}
	
	@Test
	public void btestGetAllThirdParty() throws Exception {
		List<ThirdPartySite> list = dao.getAllThirdParty();
		assertEquals(1, list.size());
		
		for(ThirdPartySite site : list) {
			assertTrue(site.name.equals("tps1"));
			assertTrue(site.url.equals("url"));
			assertTrue(site.apikey.equals("api"));
		}
	}

	@Test
	public void ctestDeleteSite() throws Exception {
		assertTrue(dao.deleteThirdParty("tps1"));
	}
}
