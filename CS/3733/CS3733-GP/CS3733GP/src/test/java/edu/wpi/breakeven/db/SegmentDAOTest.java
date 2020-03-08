package edu.wpi.breakeven.db;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.runners.MethodSorters;

import com.google.gson.Gson;

import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.UploadSegmentRequest;
import edu.wpi.breakeven.model.Segment;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class SegmentDAOTest {
	final double EPSILON = 1e-14;
	SegmentDAO dao;

	@Before
	public void setUp() throws Exception {
		dao = new SegmentDAO();
		dao.setTable("testsegment");
	}

	@Test
	public void atestAddAndGet() throws Exception {
		Segment seg = new Segment("t1", "https://bluhtest.s3.amazonaws.com/10.mp4", 1.2, "bones", "don't get dressed yet", 0, null);
		dao.addSegment(seg);
		Segment back = dao.getSegment("t1");
		assertTrue(back.name.equals("t1"));
		assertTrue(back.url.equals("https://bluhtest.s3.amazonaws.com/10.mp4"));
		assertTrue(Math.abs(back.duration - 1.2) < EPSILON);
		assertTrue(back.character.equals("bones"));
		assertTrue(back.quote.equals("don't get dressed yet"));
		assertEquals(0, back.type);
		assertTrue(back.pl.equals(""));
	}

	@Test
	public void btestUpdate() throws Exception {
		Segment seg = new Segment("t1", "https://bluhtest.s3.amazonaws.com/small.ogg", 2.4, "lego", "rotate", 1, null);
		assertTrue(dao.updateSegment(seg));

		Segment back = dao.getSegment("t1");
		assertTrue(back.name.equals("t1"));
		assertTrue(back.url.equals("https://bluhtest.s3.amazonaws.com/small.ogg"));
		assertTrue(Math.abs(back.duration - 2.4) < EPSILON);
		assertTrue(back.character.equals("lego"));
		assertTrue(back.quote.equals("rotate"));
		assertEquals(1, back.type);
		assertTrue(back.pl.equals(""));

		assertTrue(dao.addToPlaylist("t1", "pl"));
		Segment back1 = dao.getSegment("t1");
		assertTrue(back1.pl.equals("pl"));
	}

	@Test
	public void ctestGetAllSegments() throws Exception {
		List<Segment> segs = dao.getAllSegments();
		Segment seg = null;
		for(Segment s : segs) {
			if(s.name.equals("t1")) {
				seg = s;
			}
		}
		if(seg == null) {
			fail("segment not found");
		}
		assertTrue(seg.name.equals("t1"));
		assertTrue(seg.url.equals("https://bluhtest.s3.amazonaws.com/small.ogg"));
		assertTrue(Math.abs(seg.duration - 2.4) < EPSILON);
		assertTrue(seg.character.equals("lego"));
		assertTrue(seg.quote.equals("rotate"));
		assertEquals(1, seg.type);
		assertTrue(seg.pl.equals("pl"));
	}


	@Test
	public void dtestDeleteSegment() throws Exception {
		assertTrue(dao.deleteSegment("t1"));
	}
	
	@Test
	public void etestMarkSegment() throws Exception {
		Segment testMark = new Segment("TestMark", "url", EPSILON, "char", "quote", 0, null);
		String uuid = "TestMark";
		System.out.println(dao.table);
		dao.addSegment(testMark);
		Segment s = dao.getSegment(uuid);
		assertEquals(0, s.type);
		dao.markSegmentRemote(uuid);
		Segment s2 = dao.getSegment(uuid);
		assertEquals(1, s2.type);
		dao.markSegmentRemote(uuid);
		Segment s3 = dao.getSegment(uuid);
		assertEquals(0, s3.type);
		dao.deleteSegment(uuid);
	}
}

