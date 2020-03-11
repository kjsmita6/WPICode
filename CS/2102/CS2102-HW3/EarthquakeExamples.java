import static org.junit.Assert.*;
import org.junit.Test;
import java.util.LinkedList;

public class EarthquakeExamples {
	Earthquake1 E1 = new Earthquake1();

	LinkedList<Double> noData = new LinkedList<Double>();
	LinkedList<Double> threeDates = new LinkedList<Double>();  
	LinkedList<MaxHzReport> NovReports = new LinkedList<MaxHzReport>();
	LinkedList<MaxHzReport> OctReports = new LinkedList<MaxHzReport>();
	LinkedList<MaxHzReport> SeptReports = new LinkedList<MaxHzReport>();

	public EarthquakeExamples() 
	{

		threeDates.add(20150913.0);
		threeDates.add(1.0);
		threeDates.add(8.0);
		threeDates.add(20150924.0);
		threeDates.add(3.0);
		threeDates.add(12.0);
		threeDates.add(230.0);
		threeDates.add(20151013.0);
		threeDates.add(10.0);
		threeDates.add(5.0);
		threeDates.add(20151020.0);
		threeDates.add(40.0);
		threeDates.add(50.0);
		threeDates.add(45.0);
		threeDates.add(20151101.0);
		threeDates.add(6.0);

		NovReports.add(new MaxHzReport(20151101.0,6.0));
		OctReports.add(new MaxHzReport(20151013.0,10.0));
		OctReports.add(new MaxHzReport(20151020.0,50.0));
		SeptReports.add(new MaxHzReport(20150913.0,8.0));
		SeptReports.add(new MaxHzReport(20150924.0,230.0));
	}

	@Test
	public void instructorTestEQ1() { 
		assertEquals(NovReports,E1.dailyMaxForMonth(threeDates,11));
		assertEquals(OctReports,E1.dailyMaxForMonth(threeDates,10));
		assertEquals(SeptReports,E1.dailyMaxForMonth(threeDates,9));
	}

	/*
	 * subtasks for problem 3:
	 * 1. read through the list of dates/data
	 * 2. identify if they are dates, extract the month and if it is the same as the given month, add the date to list
	 * 3. filter through new LinkedList and read if it is a date or not. Then find the highest data number. Add that value as a MaxHzReport and return the MaxHzReport list
	 */
}