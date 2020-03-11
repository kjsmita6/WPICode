import static org.junit.Assert.*;
import org.junit.Test;
import java.util.LinkedList;

public class DataSmoothExamples 
{  
  LinkedList<Show> shows = new LinkedList<Show>();
  LinkedList<Double> showResults = new LinkedList<Double>();
  DataSmooth1 D1 = new DataSmooth1();
  
  public DataSmoothExamples() 
  {
		LinkedList<Episode> eps1 = new LinkedList<Episode>();
		eps1.add(new Episode("Best of Both Worlds", 88));
		eps1.add(new Episode("The Ultimate Computer", 49));
		eps1.add(new Episode("Trials and Tribble-ations", 43));		
		shows.add(new Show("Star Trek", 1800, eps1));
		
		LinkedList<Episode> eps2 = new LinkedList<Episode>();
		eps2.add(new Episode("Fear of a Bot Planet", 23));
		eps2.add(new Episode("The Why of Fry", 21));
		eps2.add(new Episode("Roswell that Ends Well", 23));
		eps2.add(new Episode("Meanwhile", 22));
		shows.add(new Show("Futurama", 1900, eps2));
		
		LinkedList<Episode> eps3 = new LinkedList<Episode>();
		eps3.add(new Episode("Yakko's World", 4));
		eps3.add(new Episode("Hello Nice Warners", 8));
		eps3.add(new Episode("Where Rodents Dare", 9));
		shows.add(new Show("Animaniacs", 1630, eps3));
		
		LinkedList<Episode> eps4 = new LinkedList<Episode>();
		eps4.add(new Episode("The Letter W", 59));
		eps4.add(new Episode("The Letter P", 57));
		eps4.add(new Episode("The Letter I", 58));
		shows.add(new Show("Sesame Street", 900, eps4));
		
		LinkedList<Episode> eps5 = new LinkedList<Episode>();
		eps5.add(new Episode("Hello1", 10));
		eps5.add(new Episode("Hello2", 10));
		eps5.add(new Episode("Hello3", 10));
		shows.add(new Show("Hello Darkness My Old Friend", 1000, eps5));
		
		LinkedList<Episode> eps6 = new LinkedList<Episode>();
		eps6.add(new Episode("Hello1", 10));
		eps6.add(new Episode("Hello2", 10));
		eps6.add(new Episode("Hello3", 10));
		shows.add(new Show("Hello Darkness My Old Friend", 1200, eps6));
		
		LinkedList<Episode> eps7 = new LinkedList<Episode>();
		eps7.add(new Episode("Zero1", 0));
		eps7.add(new Episode("Zero2", 0));
		eps7.add(new Episode("Zero3", 0));
		shows.add(new Show("Zero1", 1200, eps7));
		
		LinkedList<Episode> eps8 = new LinkedList<Episode>();
		eps8.add(new Episode("Zero1", 0));
		eps8.add(new Episode("Zero2", 0));
		eps8.add(new Episode("Zero3", 0));
		shows.add(new Show("Zero1", 1200, eps8));
		
		LinkedList<Episode> eps9 = new LinkedList<Episode>();
		eps9.add(new Episode("Zero1", 0));
		eps9.add(new Episode("Zero2", 0));
		eps9.add(new Episode("Zero3", 0));
		shows.add(new Show("Zero1", 1200, eps9));
		

	    showResults.add(60.0);
	    showResults.add(29.75);
	    showResults.add(29.08333);
	    showResults.add(25.0);
	    showResults.add(26.0);
	    showResults.add(6.66667);
	    showResults.add(3.33333);
	    showResults.add(0.0);
	    showResults.add(0.0);
  }
  
  @Test
  public void instructorTestDS1() 
  {
	  LinkedList<Double> runtimes = D1.dataSmooth(shows);
	  
	  for(int i = 0; i < runtimes.size(); i++)
	  {
		  assertEquals(runtimes.get(i), showResults.get(i), .00001);
	  }
  }
  
  /*
   * The sub tasks for problem 2 were:
   * 1. run through the given show linkedlist and add the average length of each show using the setAvgLength from the show class
   * 2. run through the given show linkedlist and find the average of the three averages for all the values except for the 1st and last term. 
   * 3. While running through the given show for the second time, add the new smoothing average to a new linkedlist that will be returned as the solution. 
   * **add the first term before running through the show linkedlist for a second time, and add the last term after running through the show linkedlist for a second time since these two values cannot be averaged
   */
  
 
}