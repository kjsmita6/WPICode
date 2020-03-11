public class MassStartResult extends Result implements IEvent {
	
	public MassStartResult(double time, int position) {
		super(time, position);
	}

	@Override
	public double pointsEarned() {
		return time;
	}
}
