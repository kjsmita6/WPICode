import java.util.LinkedList;

public class Planning {
	public static double rainfall(LinkedList<Double> data) {
		double sum = 0;
		int acc = 0;
		for(double num : data) {
			if(Math.abs(num + 999.0) < 1e-14) {
				if(acc == 0) {
					return -1;
				}
				return sum / acc;
			}
			else if(num >= 0) {
				sum += num;
				acc ++;
			}
		}
		if(acc <= data.size()) {
			return sum / acc;
		}
		return -1;
	}
}
