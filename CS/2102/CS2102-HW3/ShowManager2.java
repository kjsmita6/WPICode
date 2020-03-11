import java.util.LinkedList;

class ShowManager2 {
	
	ShowManager2() {}

	/**
	 * Organize shows based on whether a show is daytime or primetime
	 * @param shows List of Shows
	 * @return a ShowSummary with all the shows organized
	 */
	public ShowSummary organizeShows(LinkedList<Show> shows)
	{
		ShowSummary sum = new ShowSummary();
		for(Show show: shows)
		{
			while(show.broadcastTime >= 600 && show.broadcastTime < 1700)
			{
				sum.daytime.add(show);
				break;
			}
			while(show.broadcastTime >= 1700 && show.broadcastTime < 2300)
			{
				sum.primetime.add(show);
				break;
			}
		}
		return sum;
	}
}
