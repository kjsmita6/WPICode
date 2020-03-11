import java.util.Hashtable;
import java.util.LinkedList;
import java.util.Scanner;

class ElectionData {
	private LinkedList<String> ballot = new LinkedList<String>();
	private Scanner keyboard = new Scanner(System.in);
	private Hashtable<String, Integer> firstChoice = new Hashtable<String, Integer>();
	private Hashtable<String, Integer> secondChoice = new Hashtable<String, Integer>();
	private Hashtable<String, Integer> thirdChoice = new Hashtable<String, Integer>();

	public ElectionData() {

	}

	public void processVote(String first, String second, String third) throws UnknownCandidateException, DuplicateVotesException {
		if(!ballot.contains(first)) {
			throw new UnknownCandidateException(first);
		}
		else if(!ballot.contains(second)) {
			throw new UnknownCandidateException(second);
		}
		else if(!ballot.contains(third)) {
			throw new UnknownCandidateException(third);
		}

		if(first.equals(second)) {
			throw new DuplicateVotesException(first);
		}
		else if(second.equals(third)) {
			throw new DuplicateVotesException(second);
		}
		else if(first.equals(third)) {
			throw new DuplicateVotesException(first);
		}

		if(firstChoice.get(first) == null) {
			firstChoice.put(first, 0);
		}
		if(secondChoice.get(second) == null) {
			secondChoice.put(second, 0);
		}
		if(thirdChoice.get(third) == null) {
			thirdChoice.put(third, 0);
		}
		firstChoice.replace(first, firstChoice.get(first) + 1);
		secondChoice.replace(second, secondChoice.get(second) + 1);
		thirdChoice.replace(third, thirdChoice.get(third) + 1);
	}

	public void addCandidate(String name) throws CandidateExistsException {
		if(ballot.contains(name)) {
			throw new CandidateExistsException(name);
		}
		else {
			ballot.add(name);
		}
	}

	public String findWinnerMostFirstVotes() {
		int totalVotes = 0;
		String winner = "";
		for(int vote : firstChoice.values()) {
			totalVotes += vote;
		}
		for(String candidate : ballot) {
			if(firstChoice.containsKey(candidate)) {
				int votes = firstChoice.get(candidate);
				if(votes > 0.5 * totalVotes) {
					if(!winner.equals("")) {
						return "Runoff required";
					}
					winner = candidate;
				}
			}
		}
		if(winner.equals("")) {
			return "Runoff required";
		}
		return winner;
	}

	public String findWinnerMostPoints() {
		Hashtable<String, Integer> totalVotes = new Hashtable<String, Integer>();
		String winner = "";
		int winningVotes = 0;
		for(String candidate : ballot) {
			int firstVotes, secondVotes, thirdVotes;
			if(firstChoice.containsKey(candidate)) {
				firstVotes = firstChoice.get(candidate) * 3;
			}
			else {
				firstVotes = 0;
			}
			if(secondChoice.containsKey(candidate)) {
				secondVotes = secondChoice.get(candidate) * 2;
			}
			else {
				secondVotes = 0;
			}
			if(thirdChoice.containsKey(candidate)) {
				thirdVotes = thirdChoice.get(candidate) * 1;
			}
			else {
				thirdVotes = 0;
			}
			totalVotes.put(candidate, firstVotes + secondVotes + thirdVotes);
		}
		for(String candidate : ballot) {
			int votes = totalVotes.get(candidate);
			if(votes > winningVotes) {
				winner = candidate;
				winningVotes = votes;
			}
		}
		return winner;
	}

	public void printBallot() {
		System.out.println("The candidates are ");
		for (String s : ballot) {
			System.out.println(s);
		}
	}
}