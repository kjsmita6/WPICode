public class Shark extends Fish {
	int attacks;
	
	Shark(int length, int attacks) {
		super(length, 3.75);
		this.attacks = attacks;
	}
	
	public boolean isNormalSize() {
		return this.length >= 6;
	}
	
	public boolean isDangerToPeople() {
		return attacks >= 1;
	}
}
