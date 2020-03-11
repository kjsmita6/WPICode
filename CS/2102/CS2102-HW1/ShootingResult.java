public class ShootingResult implements IEvent {
	ShootingRound round1, round2, round3, round4;

	public ShootingResult(ShootingRound r1, ShootingRound r2, ShootingRound r3, ShootingRound r4) {
		round1 = r1;
		round2 = r2;
		round3 = r3;
		round4 = r4;
	}
	
	/**
	 * Calculates the points earned from all 4 rounds
	 * @return The total score
	 * @see ShootingRound
	 */
	@Override
	public double pointsEarned() {
		return round1.hits + round2.hits + round3.hits + round4.hits;
	}	
}
