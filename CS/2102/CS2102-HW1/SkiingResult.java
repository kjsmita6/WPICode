public class SkiingResult implements IEvent {
	double time;
	int place;
	ShootingResult shootResult;
	
	public SkiingResult(double time, int place, ShootingResult result) {
		this.time = time;
		this.place = place;
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
		if(place == 1) {
			newTime -= 10;
		}
		else if(place == 2) {
			newTime -= 7;
		}
		else if(place == 3) {
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
		double result = time;
		for(int i = 0; i < 20 - sr.pointsEarned(); i++) {
			result += 20;
		}
		return result;
	}
}
