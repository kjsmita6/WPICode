import java.util.LinkedList;

class Earthquake1 {
	Earthquake1(){}

	// checks whether a datum is a date
	boolean isDate(double anum) { return (int)anum > 10000000; }
	// extracts the month from an 8-digit date
	int extractMonth(double dateNum) { return ((int)dateNum % 10000) / 100; }

	/**
	 * Takes in a list of raw data and returns the max value for every day of the month
	 * @param data List of raw data (double)
	 * @param month The numberical value of the wanted month
	 * @return Max data for every day of the month
	 */
	public LinkedList<MaxHzReport> dailyMaxForMonth(LinkedList<Double> data, int month) {
		LinkedList<MaxHzReport> report = new LinkedList<MaxHzReport>();
		double currentDate = 0;
		double max = 0;
		for(int i = 0; i < data.size(); i ++) {
			if(isDate(data.get(i)) && extractMonth(data.get(i)) == month) {
				currentDate = data.get(i);
				max = data.get(i + 1);
				for(int j = i + 1; j < data.size(); j ++) {
					if(!isDate(data.get(j))) {
						if(data.get(j) > max) {
							max = data.get(j);
						}
					}
					else {
						break;
					}
				}
				report.add(new MaxHzReport(currentDate, max));
				max = 0;
			}
		}
		return report;
	}
}