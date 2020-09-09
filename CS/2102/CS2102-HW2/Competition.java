import java.util.LinkedList;

public class Competition {
	LinkedList<Athlete> list;
	int rounds;
	
	public Competition(int rounds, LinkedList<Athlete> list) 
	{
		this.rounds = rounds;
		this.list = list;
	}
	
	/**
	 * Returns a list of all the <code>Athlete</code>s who did not finish (have a lower amount of rounds than <code>int rounds</code>
	 * @return <code>LinkedList</code> of all <code>Athlete</code>s who did not finish
	 */
	public LinkedList<String> shootingDNF() {
		LinkedList<String> dnf = new LinkedList<String>();
		for(Athlete a : list) {
			if(a.shootResult.rounds.size() < rounds) {
				dnf.add(a.name);
			}
		}
		return dnf;
	}
	
	/**
	 * Calculates the skiing score for the <code>Athlete</code> by looking up their <code>name</code>
	 * @param name Name of the <code>Athlete</code>
	 * @return The <code>Athlete</code>'s skiing score
	 */
	public double skiingScoreForAthlete(String name) {
		for(Athlete a : list) {
			if(a.name.equals(name)) {
				return a.skiResult.pointsEarned();
			}
		}
		return 0;
	}
	
	/**
	 * Determines whether any <code>Athlete</code> in <code>this</code> <code>Competition</code> show any improvement from the passed-in <code>Competition</code>
	 * @param c The other <code>Competition</code>
	 * @return <code>true</code> if there was any improvement, <code>false</code> otherwise
	 */
	public boolean anySkiingImprovement(Competition c) {
		for(Athlete a : list) {
			for(Athlete other : c.list) {
				if(a.name.equals(other.name)) {
					if(a.skiResult.pointsEarned() < other.skiResult.pointsEarned()) {
						return true;
					}	
				}
			}
		}
		return false;
	}
	
	/*
	 * No. We do not see any way in which a helper method would enhance the code in a meaningful way. 
	 * There is no way to shorten an enhanced for loop nor an if statement. 
	 */
}
