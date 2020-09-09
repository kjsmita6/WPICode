public class Reading {
	Time time;
	int temperature;
	
	public Reading(Time t, int temp) {
		time = t;
		temperature = temp;
	}
	
	@Override
	public boolean equals(Object other) {
		if(!(other instanceof Reading)) {
			return false;
		}
		Reading o = (Reading)other;
		return temperature == o.temperature;
	}
}
