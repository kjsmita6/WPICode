public class EventGuests {
	ISet guests;
	
	public EventGuests(ISet guests) {
		this.guests = guests;
	}
	
	public void addGuest(String newGuestName) {
		guests = guests.addElt(newGuestName);
	}
	
	public boolean isComing(String name) {
		return guests.hasElt(name);
	}
	
	public int numGuests() {
		return guests.size();
	}
}
