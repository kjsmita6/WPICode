public class LabMouse extends LabAnimal {
	int treadmillWorkout;
	int workoutTime;
	
	public LabMouse(String food, int amount, int treadmillWorkout, int workoutTime) {
		super(food, amount);
		this.treadmillWorkout = treadmillWorkout;
		this.workoutTime = workoutTime;
	}
}
