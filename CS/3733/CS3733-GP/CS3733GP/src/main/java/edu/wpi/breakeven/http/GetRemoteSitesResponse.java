package edu.wpi.breakeven.http;

import java.util.ArrayList;
import java.util.List;

import edu.wpi.breakeven.model.RemoteSegment;

public class GetRemoteSitesResponse {
	public List<RemoteSegment> segments;

	public GetRemoteSitesResponse(List<RemoteSegment> segments) {
		this.segments = segments;
	}
}
