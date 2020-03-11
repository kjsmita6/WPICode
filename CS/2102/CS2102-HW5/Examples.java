import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.LinkedList;

import java.util.GregorianCalendar;

import org.junit.Test;
import org.junit.Before;

/**
 * 
 * @author Kyle Smith (kjsmith@wpi.edu), Wonjae Jang (wjang@wpi.edu)
 *
 */
public class Examples 
{
	/*
	 * Part 2 Question:
	 * In averageHighForMonth and averageLowForMonth, the code is duplicated. The code is the exact same
	 * except for which value is being added to the sum, either the low temperature or the high temperature.
	 * To eliminate the duplicate code, you can create a helper function that loops through the reports,
	 * where the only difference is in the actual average methods, the difference being whether the 
	 * low or the high is being calculated. The same would happen in Racket, a helper function would be created.
	 */
	Time timeBase = new Time(12,30);

	//temperatures
	int t1 = 20;
	int t2 = 31;
	int t3 = 44;
	int t4 = 11;
	int t5 = 15;
	int t6 = 92;
	int t7 = 46;
	int t8 = 54;
	int t9 = 83;
	int t10 = 43;
	int t11 = 54;
	int t12 = 12;
	int t13 = 78;
	int t14 = 23;
	int t15 = 78;
	int t16 = 89;
	int t17 = 45;
	int t18 = 34;
	int t19 = 87;
	int t20 = 90;

	//readings
	Reading r1 = new Reading(timeBase, t1);
	Reading r2 = new Reading(timeBase, t2);
	Reading r3 = new Reading(timeBase, t3);
	Reading r4 = new Reading(timeBase, t4);
	Reading r5 = new Reading(timeBase, t5);
	Reading r6 = new Reading(timeBase, t6);
	Reading r7 = new Reading(timeBase, t7);
	Reading r8 = new Reading(timeBase, t8);
	Reading r9 = new Reading(timeBase, t9);
	Reading r10 = new Reading(timeBase, t10);
	Reading r11 = new Reading(timeBase, t11);
	Reading r12 = new Reading(timeBase, t12);
	Reading r13 = new Reading(timeBase, t13);
	Reading r14 = new Reading(timeBase, t14);
	Reading r15 = new Reading(timeBase, t15);
	Reading r16 = new Reading(timeBase, t16);
	Reading r17 = new Reading(timeBase, t17);
	Reading r18 = new Reading(timeBase, t18);
	Reading r19 = new Reading(timeBase, t19);
	Reading r20 = new Reading(timeBase, t20);

	//readings 1-6 are January
	//readings 7-10 are tests

	GregorianCalendar jan1 = new GregorianCalendar(2012, 1, 1);
	GregorianCalendar jan2 = new GregorianCalendar(2012, 1, 2);
	GregorianCalendar jan3 = new GregorianCalendar(2012, 1, 3);
	GregorianCalendar jan4 = new GregorianCalendar(2012, 1, 4);
	GregorianCalendar jan5 = new GregorianCalendar(2012, 1, 5);
	GregorianCalendar jan6 = new GregorianCalendar(2012, 1, 6);
	GregorianCalendar feb1 = new GregorianCalendar(2012, 2, 1);
	GregorianCalendar feb2 = new GregorianCalendar(2012, 2, 2);
	GregorianCalendar feb3 = new GregorianCalendar(2012, 2, 3);
	GregorianCalendar nextYear = new GregorianCalendar(2013, 1, 1);

	DailyWeatherReport dwr1 = new DailyWeatherReport (jan1,r1,r2);
	DailyWeatherReport dwr2 = new DailyWeatherReport (jan2,r3,r4);
	DailyWeatherReport dwr3 = new DailyWeatherReport (jan3,r5,r6);
	DailyWeatherReport dwr4 = new DailyWeatherReport (jan4,r7,r8);
	DailyWeatherReport dwr5 = new DailyWeatherReport (jan5,r9,r10);
	DailyWeatherReport dwr6 = new DailyWeatherReport (jan6,r11,r12);
	DailyWeatherReport dwr7 = new DailyWeatherReport (feb1,r13,r14);
	DailyWeatherReport dwr8 = new DailyWeatherReport (feb2,r15,r16);
	DailyWeatherReport dwr9 = new DailyWeatherReport (feb3,r17,r18);
	DailyWeatherReport dwr10 = new DailyWeatherReport (nextYear,r19,r20);

	ReportList<DailyWeatherReport> report1 = new ReportList<DailyWeatherReport>(new DailyWeatherReport[] { 
			dwr1,dwr2,dwr3,dwr4,dwr5,dwr6,dwr7,dwr8,dwr9,dwr10});
	ReportList<DailyWeatherReport> testAddDailyReport1 = new ReportList<DailyWeatherReport>(new DailyWeatherReport[] { 
			dwr1,dwr2,dwr3,dwr4,dwr5,dwr7,dwr8,dwr9});

	Reading raddDailyLow = new Reading(timeBase, 11);
	Reading raddDailyHigh = new Reading(timeBase, 44);
	DailyWeatherReport addDailyReport1 = new DailyWeatherReport (jan6,raddDailyHigh, raddDailyLow);

	ReportList<DailyWeatherReport> testAddDailyReport2 = new ReportList<DailyWeatherReport>(new DailyWeatherReport[] { 
			dwr1,dwr2,dwr3,dwr4,dwr5,dwr7,dwr8,dwr9,addDailyReport1});

	WeatherMonitor wm1 = new WeatherMonitor(report1);
	WeatherMonitor wm2 = new WeatherMonitor(testAddDailyReport1);
	
	WeatherMonitor wm3 = new WeatherMonitor(testAddDailyReport2);

	LinkedList<Reading> readings1 = new LinkedList<Reading>(Arrays.asList(new Reading[] {r1,r2,r3,r4,r5}));

	//11 low 44 high

	final double EPSILON = 1E-14;
	
	@Test
	public void testAveHigh()
	{
		double aveHigh1 = wm1.averageHighForMonth(1, 2012);  
		double aveHigh2 = wm1.averageHighForMonth(2, 2012);  
		double aveHigh3 = wm1.averageHighForMonth(13, 2012); 
		double aveHigh4 = wm1.averageHighForMonth(1, 2013);  
		
		assertEquals(131.0/3, aveHigh1, EPSILON);
		assertEquals(67, aveHigh2, EPSILON);
		assertEquals(0, aveHigh3, EPSILON);
		assertEquals(87, aveHigh4, EPSILON);
	}

	@Test
	public void testAveLow()
	{
		double aveLow1 = wm1.averageLowForMonth(1, 2012);  //correct month
		double aveLow2 = wm1.averageLowForMonth(2, 2012);  //incorrect month
		double aveLow3 = wm1.averageLowForMonth(13, 2012); //out of bounds month
		double aveLow4 = wm1.averageLowForMonth(1, 2013);  //incorrect year
		
		assertEquals(40.5, aveLow1, EPSILON);
		assertEquals(146.0/3, aveLow2, EPSILON);
		assertEquals(0, aveLow3, EPSILON);
		assertEquals(90, aveLow4, EPSILON);
	}

	/*
	@Test 
	public void testAddDailyReport()
	{
		wm2.addDailyReport(jan6,readings1);
		assertTrue(wm2.equals(wm3));
	}
	*/
}
