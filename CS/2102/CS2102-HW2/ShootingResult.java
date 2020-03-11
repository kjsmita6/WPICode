import java.util.LinkedList;

public class ShootingResult implements IEvent {
	LinkedList<ShootingRound> rounds;
	
	public ShootingResult(LinkedList<ShootingRound> rounds) {
		this.rounds = rounds;
	}
	/**
	 * Calculates the points earned from all 4 rounds
	 * @return The total score
	 * @see ShootingRound
	 */
	@Override
	public double pointsEarned() {
		int acc = 0;
		for(ShootingRound round : rounds) {
			acc += round.hits;
		}
		return acc;
	}
	
	/**
	 * Calculates the best round (round with highest score)
	 * @return The best round in the list <code>rounds</code>
	 */
	public ShootingRound bestRound() {
		ShootingRound max = rounds.get(0);
		for(ShootingRound round : rounds) {
			if(round.hits > max.hits) {
				max = round;
			}
		}
		return max;
	}
}
