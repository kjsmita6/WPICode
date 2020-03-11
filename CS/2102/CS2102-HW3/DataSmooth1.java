import java.util.LinkedList;

class DataSmooth1 {
	DataSmooth1(){}
  
	/**
	 * Takes in a list of shows and smooths the outlying data by taking the average of the surrounding values
	 * @param shows List of Shows
	 * @return A list of the average show length, smoothed
	 */
	public LinkedList<Double> dataSmooth(LinkedList<Show> shows) 
	{
		LinkedList<Double> times = new LinkedList<Double>();
		for(Show show : shows) {
			double avg = 0;
			for(Episode e : show.episodes) {
				avg += e.runTime;
			}
			show.setAvgLength(avg / show.episodes.size());
		}
		for(int i = 0; i < shows.size(); i++) {
			if(i == 0 || i == shows.size() - 1) {
				times.add(shows.get(i).avgLength);
			}
			else {
				times.add((shows.get(i - 1).avgLength + shows.get(i).avgLength + shows.get(i + 1).avgLength) / 3);
			}
		}
		return times;
	}
}