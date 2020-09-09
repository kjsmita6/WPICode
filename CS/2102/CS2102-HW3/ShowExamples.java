import static org.junit.Assert.*;
import org.junit.Test;
import java.util.LinkedList;
import java.util.Arrays;

public class ShowExamples 
{
	ShowManager1 sm1 = new ShowManager1();
	LinkedList<Show> shows = new LinkedList<Show>();
	ShowSummary report1 = new ShowSummary();
	
	public ShowExamples()
	{
		LinkedList<Episode> eps1 = new LinkedList<Episode>();
		eps1.add(new Episode("Best of Both Worlds", 88));
		eps1.add(new Episode("The Ultimate Computer", 49));
		eps1.add(new Episode("Trials and Tribble-ations", 43));		
		Show s1 = new Show("Star Trek", 1800, eps1);
		shows.add(s1);
		report1.primetime.add(s1);
		
		LinkedList<Episode> eps2 = new LinkedList<Episode>();
		eps2.add(new Episode("Fear of a Bot Planet", 23));
		eps2.add(new Episode("The Why of Fry", 21));
		eps2.add(new Episode("Roswell that Ends Well", 23));
		eps2.add(new Episode("Meanwhile", 22));
		Show s2 = new Show("Futurama", 1900, eps2);
		shows.add(s2);
		report1.primetime.add(s2);
		
		LinkedList<Episode> eps3 = new LinkedList<Episode>();
		eps3.add(new Episode("Yakko's World", 4));
		eps3.add(new Episode("Hello Nice Warners", 8));
		eps3.add(new Episode("Where Rodents Dare", 9));
		Show s3 = new Show("Animaniacs", 1630, eps3);
		shows.add(s3);
		report1.daytime.add(s3);
		
		LinkedList<Episode> eps4 = new LinkedList<Episode>();
		eps4.add(new Episode("The Letter W", 59));
		eps4.add(new Episode("The Letter P", 57));
		eps4.add(new Episode("The Letter I", 58));
		Show s4 = new Show("Sesame Street", 900, eps4);
		shows.add(s4);
		report1.daytime.add(s4);
		
		LinkedList<Episode> eps5 = new LinkedList<Episode>();
		eps5.add(new Episode("Hello1", 10));
		eps5.add(new Episode("Hello2", 10));
		eps5.add(new Episode("Hello3", 10));
		Show s5 = new Show("Hello Darkness My Old Friend",1000, eps5);
		shows.add(s5);
		report1.daytime.add(s5);
		
		LinkedList<Episode> eps6 = new LinkedList<Episode>();
		eps6.add(new Episode("Hello1", 10));
		eps6.add(new Episode("Hello2", 10));
		eps6.add(new Episode("Hello3", 10));
		Show s6 = new Show("Hello Darkness My Old Friend",100, eps6);
		shows.add(s6);

		LinkedList<Episode> eps7 = new LinkedList<Episode>();
		eps7.add(new Episode("Zero1", 0));
		eps7.add(new Episode("Zero2", 0));
		eps7.add(new Episode("Zero3", 0));
		Show s7 = new Show("Zero1",900, eps7);
		shows.add(s7);
		report1.daytime.add(s7);
		
		LinkedList<Episode> eps8 = new LinkedList<Episode>();
		eps8.add(new Episode("Zero1", 0));
		eps8.add(new Episode("Zero2", 0));
		eps8.add(new Episode("Zero3", 0));
		Show s8 = new Show("Zero1",2300,eps8);
		shows.add(s8);
		
		LinkedList<Episode> eps9 = new LinkedList<Episode>();
		eps9.add(new Episode("Zero1", 0));
		eps9.add(new Episode("Zero2", 0));
		eps9.add(new Episode("Zero3", 0));
		Show s9 = new Show("Zero1", 1700, eps9);
		shows.add(s9);
		report1.primetime.add(s9);
	}
	
	@Test
	public void instructorTestOrganizeShows() 
	{
		ShowSummary report2 = sm1.organizeShows(shows);
		assertEquals(report1, report2);
	}
	/*
	 * The subtasks for problem 1 are:
	 * 1. cycle through the linked list of shows
	 * 2. identify whether the show is daytime or primetime
	 * 3. add shows to the corresponding linked lists of daytime 
	 * and primetime while cycling through the linked list of shows
	 * 4. return the ShowSummary
	 */
}
