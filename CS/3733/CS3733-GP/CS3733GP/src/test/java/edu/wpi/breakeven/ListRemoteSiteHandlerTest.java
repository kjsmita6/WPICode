package edu.wpi.breakeven;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import org.junit.Assert;
import org.junit.Test;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.LambdaLogger;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.model.S3ObjectSummary;

import edu.wpi.breakeven.db.ThirdPartyDAO;
import edu.wpi.breakeven.http.ListRemoteSiteRequest;
import edu.wpi.breakeven.http.ListRemoteSiteResponse;
import edu.wpi.breakeven.model.ThirdPartySite;

public class ListRemoteSiteHandlerTest extends LambdaTest {
	
boolean testThirdPartySiteArrayEquals(ArrayList<ThirdPartySite> actualArray, ArrayList<ThirdPartySite>  expectedArray) {
		
		if(actualArray.toArray().length != expectedArray.toArray().length)
		{
			return false;
		}
		for(int i = 0; i < actualArray.toArray().length; i++)
		{
			System.out.println("Actual third party site name: " + ((ThirdPartySite) actualArray.toArray()[i]).name);
			System.out.println("Expected third party site name: " + ((ThirdPartySite) expectedArray.toArray()[i]).name);
			
			if(!((ThirdPartySite) actualArray.toArray()[i]).name.equals(((ThirdPartySite) expectedArray.toArray()[i]).name)) {
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
		
		ListRemoteSiteHandler handler = new ListRemoteSiteHandler();
		handler.table = "testthirdpartysites";
		ListRemoteSiteRequest req = new ListRemoteSiteRequest();
		ListRemoteSiteResponse resp = handler.handleRequest(req, createContext("third party site"));
		
			ArrayList<ThirdPartySite> list = (ArrayList<ThirdPartySite>) resp.list;
			
			
			ThirdPartyDAO segment = new ThirdPartyDAO();
			segment.setTable("testthirdpartysites");
			segment.getAllThirdParty();
		Assert.assertEquals(200, resp.statusCode);
//		Assert.assertArrayEquals(resp.list.toArray() , playlist.getAllPlaylist().toArray());
		Assert.assertEquals(true ,testThirdPartySiteArrayEquals((ArrayList<ThirdPartySite>) resp.list, (ArrayList<ThirdPartySite>) segment.getAllThirdParty()));
		
		
	}

}