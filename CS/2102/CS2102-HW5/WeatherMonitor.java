import java.util.GregorianCalendar;
import java.util.LinkedList;

public class WeatherMonitor {
	private ICollection<DailyWeatherReport> reports;
	
	public WeatherMonitor(ICollection<DailyWeatherReport> reports) { 
		this.reports = reports;
	}

	public ICollection<DailyWeatherReport> getReports() {
		return reports;
	}
	/**
	 * Calculates the average high temperature for the given month and year
	 * @param month Month to check (1 for Jan, 2 for Feb, etc)
	 * @param year Year to check
	 * @return Average high temperature
	 */
	public double averageHighForMonth(int month, int year) {
		double sum = 0, acc = 0;
		for(DailyWeatherReport report : reports) {
			if(report.date.get(GregorianCalendar.MONTH) == month && report.date.get(GregorianCalendar.YEAR) == year) {
				sum += report.high.temperature;
				acc ++;
			}
		}
		return acc != 0 ? sum / acc : 0;
	}

	/**
	 * Calculates the average high temperature for the given month and year
	 * @param month Month to check (1 for Jan, 2 for Feb, etc)
	 * @param year Year to check
	 * @return Average high temperature
	 */
	public double averageLowForMonth(int month, int year) {
		double sum = 0, acc = 0;
		for(DailyWeatherReport report : reports) {
			if(report.date.get(GregorianCalendar.MONTH) == month && report.date.get(GregorianCalendar.YEAR) == year) {
				sum += report.low.temperature;
				acc ++;
			}
		}
		return acc != 0 ? sum / acc : 0;
	}

	/**
	 * Adds the highs and lows of the date to the list of reports
	 * @param date
	 * @param readings
	 */
	private void addDailyReport(GregorianCalendar date, LinkedList<Reading> readings) {
		Reading high = readings.get(0);
		Reading low = readings.get(0);
		for(Reading reading : readings) {
			if(reading.temperature > high.temperature) {
				high = reading;
			}
			else if(reading.temperature < low.temperature) {
				low = reading;
			}
		}
		DailyWeatherReport report = new DailyWeatherReport(date, high, low);
		reports.add(report);
	}
}
