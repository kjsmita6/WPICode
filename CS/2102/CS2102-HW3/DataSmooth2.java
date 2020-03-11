import java.util.LinkedList;

class DataSmooth2 
{
	DataSmooth2(){}

	/**
	 * Takes in a list of shows and smooths the outlying data by taking the average of the surrounding values
	 * @param shows List of Shows
	 * @return A list of the average show length, smoothed
	 */
	public LinkedList<Double> dataSmooth(LinkedList<Show> shows) 
	{
		LinkedList<Double> showAvgLength = new LinkedList<Double>();

		for(Show show: shows)
		{
			double sum = 0;
			int counter = 0;
			for(Episode episode: show.episodes)
			{
				sum = sum + episode.runTime;
				counter++;
			}
			double averageLength = sum/counter;
			show.setAvgLength(averageLength);
		}
		
		showAvgLength.add(shows.get(0).avgLength);
		
		for(int x=1; x<shows.size()-1;x++)
		{
			double minus1 = shows.get(x-1).avgLength;
			double middle = shows.get(x).avgLength;
			double plus1  = shows.get(x+1).avgLength;

			double smoothing = (minus1 + middle + plus1)/3;
			showAvgLength.add(smoothing);
		}
		
		showAvgLength.add(shows.get(shows.size()-1).avgLength);
		
		return showAvgLength;
	}
}