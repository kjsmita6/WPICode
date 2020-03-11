import java.util.LinkedList;
import static org.junit.Assert.*;
import org.junit.Test;

public class Examples 
{
	public Examples() {}

	// setting up a normal election (BASE CODE)
	ElectionData Setup1() 
	{
		ElectionData ED = new ElectionData();
		// put candidates on the ballot
		try 
		{
			ED.addCandidate("a");
			ED.addCandidate("b");
			ED.addCandidate("c");
		} 
		catch (CandidateExistsException cand) {}
		// cast votes
		try 
		{
			ED.processVote("a", "b", "c");
			ED.processVote("a", "c", "b");
			ED.processVote("b", "a", "c");
		} catch (Exception e) {}
		return (ED);
	}

	// setting up an election with a candidate receiving no votes
	// and another candidate receiving no first votes
	ElectionData Setup2() //(NEW STUFF)
	{
		ElectionData ED = new ElectionData();
		// put candidates on the ballot
		try 
		{
			ED.addCandidate("a");
			ED.addCandidate("b");
			ED.addCandidate("c");
			ED.addCandidate("d");
			ED.addCandidate("e");
		} 
		catch (CandidateExistsException cand) {}
		
		try 
		{
			ED.processVote("e", "d", "c");
			ED.processVote("c", "d", "b");
			ED.processVote("b", "d", "c");
		} 
		catch (Exception e) {}
		return (ED);
	}
	
	//testing with winner
	@Test
	public void testWinner() 
	{
		assertEquals("a", Setup1().findWinnerMostFirstVotes());
	}
	
	// test tie
	@Test
	public void testTie() 
	{
		assertEquals("Runoff required", Setup2().findWinnerMostFirstVotes());
	}

	// test all at least 1 vote
	@Test
	public void testMaxPoints1() 
	{
		assertEquals("a", Setup1().findWinnerMostPoints());
	}
	
	//test with winner getting no first place votes and other getting no votes
	@Test
	public void testMaxPoints2() 
	{
		assertEquals("d", Setup2().findWinnerMostPoints());
	}
	
	//test CandidateExists exception 
	@Test
	public void testCandidateExistsException() 
	{
		try 
		{
			ElectionData ED3 = Setup2();
			ED3.addCandidate("a");
		} 
		catch (CandidateExistsException e) 
		{
			assertTrue(true);
		}
	}
	
	// test DuplicateVotes exception 
	@Test
	public void testDuplicateVotesException()
	{
		try 
		{
			ElectionData ED1 = Setup1();
			ED1.processVote("b", "b", "c");
		} 
		catch (DuplicateVotesException e) 
		{
			assertTrue(true);
		} 
		catch (UnknownCandidateException e) 
		{
			assertTrue(false);
		}
	}

	// test UnknownCandidate exception 
	@Test
	public void testUnknownCandidateException() 
	{
		try 
		{
			ElectionData ED2 = Setup2();
			ED2.processVote("b", "blank", "a");
		} catch (UnknownCandidateException e) 
		{
			assertTrue(true);
		} 
		catch (DuplicateVotesException e) 
		{
			assertTrue(false);
		}
	}
}
