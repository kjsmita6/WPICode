public class SkiingResult extends Result implements IEvent {
	ShootingResult shootResult;
	
	public SkiingResult(double time, int place, ShootingResult result) {
		super(time, place);
		shootResult = result;
	}
	
	/**
	 * Calculates the points earned from all four rounds
	 * @return The total score + the penalties
	 * @see ShootingResult
	 * @see addShootingPenalties
	 */
	@Override
	public double pointsEarned() {
		double newTime = addShootingPenalties(shootResult);
		if(position == 1) {
			newTime -= 10;
		}
		else if(position == 2) {
			newTime -= 7;
		}
		else if(position == 3) {
			newTime -= 3;
		}
		return newTime;
	}
	
	/**
	 * Adds the penalties for missing shots to the score (time)
	 * @param sr The <code>ShootingResult</code>
	 * @return The new score including the penalties
	 */
	public double addShootingPenalties(ShootingResult sr) {
		return time + (20 * (20 - sr.pointsEarned()));
	}
}
