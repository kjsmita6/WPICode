import java.util.LinkedList;

class Earthquake2 {
	Earthquake2(){}

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
		LinkedList<MaxHzReport> monthMax = new LinkedList<MaxHzReport>();
		LinkedList<Double> filteredData = new LinkedList<Double>();
		double highest = -1;
		double currentDate = 0;
		double currentMonth = 0;

		for(double readings : data){
			if(isDate(readings)) {
				currentMonth = extractMonth(readings);
			}

			if(currentMonth == month && isDate(readings)){
				filteredData.add(readings);
			}

			if(currentMonth == month){
				filteredData.add(readings);
			}
		}
		for(double information : filteredData) {
			if(isDate(information)) {
				if(information != currentDate && highest >= 0) {
					monthMax.add(new MaxHzReport(currentDate, highest));
				}
				currentDate = information;
				highest = 0;
			}
			else if(information > highest){
				highest = information;
			}
		}
		monthMax.add(new MaxHzReport (currentDate, highest));
		return monthMax;
	}
}