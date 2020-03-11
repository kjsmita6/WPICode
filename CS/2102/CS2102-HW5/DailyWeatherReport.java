import java.util.GregorianCalendar;

public class DailyWeatherReport {
	GregorianCalendar date;
	Reading high, low;
	
	public DailyWeatherReport(GregorianCalendar date, Reading high, Reading low) {
		this.date = date;
		this.high = high;
		this.low = low;
	}
}
