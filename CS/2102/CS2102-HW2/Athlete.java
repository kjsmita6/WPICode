public class Athlete {
	ShootingResult shootResult;
	SkiingResult skiResult;
	String name;
	
	public Athlete(ShootingResult shootResult, SkiingResult skiResult, String name) 
	{
		this.shootResult = shootResult;
		this.skiResult = skiResult;
		this.name = name;
	}
	
	/**
	 * Determines if the current <code>Athlete</code> is a better skier than the other <code>Athlete</code>
	 * @param other The other Athlete
	 * @return True if current is better, false otherwise
	 */
	public Athlete betterSkiier(Athlete other) 
	{
		return (this.skiResult.pointsEarned() < other.skiResult.pointsEarned() ? this : other);
	}
	
	/**
	 * Determines if the current <code>Athlete</code> has beaten the other <code>Athlete</code>
	 * @param other The other <code>Athlete</code>
	 * @return <code>true</code> if current is better, <code>false</code> otherwise
	 */
	public boolean hasBeaten(Athlete other) {
		return (this.skiResult.pointsEarned() < other.skiResult.pointsEarned()) ||
				(this.shootResult.pointsEarned() > other.shootResult.pointsEarned());
	}
}
