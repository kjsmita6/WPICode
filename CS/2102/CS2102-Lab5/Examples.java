import static org.junit.Assert.*;

import java.util.LinkedList;

import org.junit.Test;

public class Examples {
	
	/**
	 * @author Kyle Smith (kjsmith@wpi.edu)
	 */
	@Test
	public void testBST() {
		// There is no specific class/tests for AVL trees because an AVL tree is a type of binary search tree.
		// This tree is a special type that is specified by the user of the program,
		// so there is no need to create a separate class for it.
		DataBST bst = new DataBST("Kyle", new DataBST("Achu"), new DataBST("Wonjae"));
		DataBST bst1 = new DataBST("Kyle", new DataBST("Achu", new EmptyBST(), new DataBST("Hamel")), new DataBST("Wonjae"));
		EventGuests eg = new EventGuests(bst);
		assertEquals(3, eg.numGuests());
		assertTrue(eg.isComing("Wonjae"));
		eg.addGuest("Hamel");
		assertTrue(bst1.equals(eg.guests));
	}
	
	@Test
	public void testList() {
		LinkedList<String> guests = new LinkedList<String>();
		guests.add("Kyle");
		guests.add("Achu");
		guests.add("Wonjae");
		LinkedListHelper helper = new LinkedListHelper(guests);
		
		LinkedList<String> guests1 = new LinkedList<String>();
		guests1.add("Kyle");
		guests1.add("Achu");
		guests1.add("Wonjae");
		guests1.add("Hamel");
		LinkedListHelper helper1 = new LinkedListHelper(guests1);
		
		EventGuests eg = new EventGuests(helper);
		assertEquals(3, eg.numGuests());
		assertTrue(eg.isComing("Achu"));
		eg.addGuest("Hamel");
		assertTrue(helper1.equals(eg.guests));
	}
}
