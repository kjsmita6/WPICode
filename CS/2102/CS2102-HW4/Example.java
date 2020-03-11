import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;

/**
 * 
 * @author Kyle Smith (kjsmith@wpi.edu), Wonjae Jang (wjang@wpi.edu)
 *
 */
public class Example
{
	HeapTester tester = new HeapTester();

	IHeap MT1 = new MtHeap();
	IHeap MT2 = new MtHeap();

	IHeap HEAP1 = new DataHeap(1, MT1, MT2);
	IHeap HEAP2 = new DataHeap(2, MT1, MT2);
	IHeap HEAP3 = new DataHeap(3, MT1, MT2);
	IHeap HEAP4 = new DataHeap(4, MT1, MT2);
	IHeap HEAP5 = new DataHeap(5, MT1, MT2);
	IHeap HEAP6 = new DataHeap(6, MT1, MT2);
	IHeap HEAP7 = new DataHeap(7, MT1, MT2);
	IHeap HEAP8 = new DataHeap(8, MT1, MT2);
	IHeap HEAP9 = new DataHeap(9, MT1, MT2);

	//testing tester.addEltTester
	@Test
	public void TestaddEltTester()
	{
		// 1) add element to the end of a tree
		DataHeap ADD1A = new DataHeap(1, HEAP2, MT1);
		DataHeap ADD1B = new DataHeap(1, HEAP2, HEAP3);
		assertTrue(tester.addEltTester(ADD1A,3,ADD1B));

		// 2) add the same value
		DataHeap ADD2A = new DataHeap(1, HEAP2, MT1);
		DataHeap ADD2B = new DataHeap(1, HEAP2, HEAP2);
		assertTrue(tester.addEltTester(ADD2A,2,ADD2B));

		// 3) add a larger element
		IHeap ADD3A = new DataHeap(1, HEAP4, HEAP6);
		IHeap ADD3B = new DataHeap(1, HEAP4, new DataHeap(6, new DataHeap(8), new MtHeap()));
		assertTrue(tester.addEltTester(ADD3A,8,ADD3B));

		// 4) add to an empty heap
		IHeap ADD4A = new MtHeap();
		IHeap ADD4B = new DataHeap(4, MT1, MT2);
		assertTrue(tester.addEltTester(ADD4A,4,ADD4B));

		// 6) add to identical heaps in different sequence
		DataHeap ADD6A = new DataHeap(2, HEAP3, MT1);
		DataHeap ADD6B = new DataHeap(2, HEAP3, HEAP4);
		DataHeap ADD6C = new DataHeap(2, HEAP4, HEAP3);
		boolean test1 = tester.addEltTester(ADD6A, 4, ADD6B);
		boolean test2 = tester.addEltTester(ADD6A, 4, ADD6C);
		assertTrue(test1);
		assertTrue(test2);
	}

	//testing tester.remMinEltTester
	@Test
	public void TestremMinEltTester()
	{  
		// 1) remove an element
		IHeap REM1A = new DataHeap (1,HEAP2, HEAP3);
		IHeap REM1B = new DataHeap (2, HEAP3, MT1);
		assertTrue(tester.remMinEltTester(REM1A, REM1B,1));

		// 2) remove from an empty heap 
		IHeap REM2A = new MtHeap();
		//IHeap REM2B = new MtHeap();
		assertTrue(tester.remMinEltTester(REM2A,REM2A, 0));

		// 3) removing from identical heaps in different sequences
		IHeap HELPER1 = new DataHeap(2, HEAP3, MT1);
		IHeap HELPER2 = new DataHeap(2, MT1, MT2);
		IHeap BASE3A = new DataHeap(1, HELPER2, HELPER1);
		
		IHeap HELPER3 = new DataHeap(2, HEAP3, MT1);
		IHeap BASE3B = new DataHeap(2, HEAP2, HEAP3);
		IHeap BASE3C = new DataHeap(2, HELPER3, MT1);

		assertTrue(tester.remMinEltTester(BASE3A, BASE3B, 1));
		assertTrue(tester.remMinEltTester(BASE3A, BASE3C, 1));

		// 4) remove duplicate elements
		IHeap BASE4 = new DataHeap(1, HEAP2, HEAP2);
		IHeap REM4A = new DataHeap(2, HEAP2, MT1);
		IHeap REM4B = new DataHeap(2, MT1, HEAP2);

		assertTrue(tester.remMinEltTester(BASE4, REM4A, 1));
		assertTrue(tester.remMinEltTester(BASE4, REM4B, 1));

		// 5) ******************************************
		// 6) ******************************************
	}
}