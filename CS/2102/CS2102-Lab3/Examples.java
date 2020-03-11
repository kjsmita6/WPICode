import static org.junit.Assert.*;

import java.util.LinkedList;

import org.junit.Test;

public class Examples {
	
	@Test
	public void testRainfall() {
		LinkedList<Double> test1 = new LinkedList<Double>();
		test1.add(1.0);
		test1.add(-2.0);
		test1.add(5.0);
		test1.add(-999.0);
		test1.add(8.0);
		
		LinkedList<Double> test2 = new LinkedList<Double>();
		test2.add(-999.0);
		test2.add(5.0);
		test2.add(8.0);
		
		LinkedList<Double> test3 = new LinkedList<Double>();
		test3.add(5.0);
		test3.add(1.0);
		test3.add(9.0);
		
		assertEquals(3.0, Planning.rainfall(test1), 1e-14);
		assertEquals(-1.0, Planning.rainfall(test2), 1e-14);
		assertEquals(5.0, Planning.rainfall(test3), 1e-14);
	}
}
