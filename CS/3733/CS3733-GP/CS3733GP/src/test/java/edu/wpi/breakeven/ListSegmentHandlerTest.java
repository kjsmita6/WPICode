package edu.wpi.breakeven;

import static org.junit.Assert.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;


import edu.wpi.breakeven.db.SegmentDAO;
import edu.wpi.breakeven.http.ListSegmentRequest;
import edu.wpi.breakeven.http.ListSegmentResponse;
import edu.wpi.breakeven.model.Segment;

public class ListSegmentHandlerTest extends LambdaTest {
	
boolean testSegmentArrayEquals(ArrayList<Segment> actualArray, ArrayList<Segment>  expectedArray) {
//		
//		if(actualArray.toArray().length+13 != expectedArray.toArray().length)
//		{
//			return false;
//		}
		for(int i = 0; i < expectedArray.toArray().length; i++)
		{
			System.out.println("Actual segment name: " + ((Segment) actualArray.toArray()[i]).name);
			System.out.println("Expected segment name: " + ((Segment) expectedArray.toArray()[i]).name);
			
			if(!((Segment) actualArray.toArray()[i]).name.equals(((Segment) expectedArray.toArray()[i]).name)) {
				return false;
			}
			else {
				continue;
			}
		}
		return true;
	}

	@Test
	public void testHandleRequest() throws SQLException, Exception {
		ListSegmentsHandler handler = new ListSegmentsHandler("bluhtest","testsegment");
//		handler.table = "testsegment";
//		handler.bucket = "bluhtest";
		System.out.println(handler.bucket);
		ListSegmentRequest req = new ListSegmentRequest();
		ListSegmentResponse resp = handler.handleRequest(req, createContext("segment"));
		
			ArrayList<Segment> list = (ArrayList<Segment>) resp.list;
			
			
			SegmentDAO segmentdao = new SegmentDAO();
			segmentdao.setTable("testsegment");
			List<Segment> ls = segmentdao.getAllSegments();
		Assert.assertEquals(200, resp.statusCode);
		int count = 0;
		for(Segment s : list) {
			count += 1;
		}
		System.out.println(count);
		int count2 = 0;
		for(Segment s : ls) {
			count2 += 1;
		}
		System.out.println(count2);
		
//		Assert.assertArrayEquals(resp.list.toArray() , playlist.getAllPlaylist().toArray());
		Assert.assertEquals(true ,testSegmentArrayEquals(list, (ArrayList<Segment>) ls));
		
		
	}

}
