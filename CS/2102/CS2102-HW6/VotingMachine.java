import java.util.Scanner;

public class VotingMachine {
	private ElectionData ED;
	private Scanner keyboard;
	
	public VotingMachine() {
		ED = new ElectionData();
	}
	
	public void printBallot() {
		ED.printBallot();
	}
	
	public void screen() {
		printBallot();
		System.out.println("Who is your first choice?");
		String first = keyboard.next();
		System.out.println("Who is your second choice?");
		String second = keyboard.next();
		System.out.println("Who is your third choice?");
		String third = keyboard.next();
		try { 
			ED.processVote(first, second, third);
		} 
		catch (UnknownCandidateException uce) {
			System.out.println("You voted for an unknown candidate named " + uce.getName() + ".");
		}
		catch(DuplicateVotesException dve) {
			System.out.println("You voted for " + dve.getName() + " more than once.");
		}
	}
}
