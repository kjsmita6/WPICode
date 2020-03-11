import java.util.LinkedList;

class ShowManager1 {
	
	ShowManager1() {}

	/**
	 * Organize shows based on whether a show is daytime or primetime
	 * @param shows List of Shows
	 * @return a ShowSummary with all the shows organized
	 */
	public ShowSummary organizeShows(LinkedList<Show> shows)
	{
		ShowSummary sum = new ShowSummary();
		for(Show show : shows) {
			if(show.broadcastTime >= 600 && show.broadcastTime < 1700) {
				sum.daytime.add(show);
			}
			else if(show.broadcastTime >= 1700 && show.broadcastTime < 2300) {
				sum.primetime.add(show);
			}
		}
		return sum;
	}
}
