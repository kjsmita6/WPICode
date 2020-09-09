import java.util.LinkedList;
public class CompileCheck {

	public static void main(String[] args) 
	{
		MassStartResult dummyRun = new MassStartResult(55.2, 2);

		LinkedList<ShootingRound> rounds = new LinkedList<>();
		ShootingRound b1 = new ShootingRound(0);
		ShootingRound b2 = new ShootingRound(4);
		ShootingRound b3 = new ShootingRound(5);
		ShootingRound b4 = new ShootingRound(2);
		ShootingRound b5 = new ShootingRound(5);

		rounds.add(b1);
		rounds.add(b2);
		rounds.add(b3);
		rounds.add(b4);
		rounds.add(b5);

		LinkedList<ShootingRound> rounds2 = new LinkedList<>();
		ShootingRound b6 = new ShootingRound(0);
		ShootingRound b7 = new ShootingRound(4);
		ShootingRound b8 = new ShootingRound(5);
		ShootingRound b9 = new ShootingRound(2);

		rounds2.add(b6);
		rounds2.add(b7);
		rounds2.add(b8);
		rounds2.add(b9);

		ShootingResult result1 = new ShootingResult(rounds);
		ShootingResult result2 = new ShootingResult(rounds2);

		SkiingResult dummySkiResult = new SkiingResult(105.0, 6, result1);

		Athlete a1 = new Athlete(result1, dummySkiResult, "Athlete1");
		Athlete a2 = new Athlete(result2, dummySkiResult, "Athlete2");

		LinkedList<Athlete> athletes = new LinkedList<>();
		athletes.add(a1);
		athletes.add(a2);

		Competition comp = new Competition(5, athletes);

		LinkedList<String> test1 = comp.shootingDNF();
		boolean test2 = comp.anySkiingImprovement(comp);
		double test3 = result1.pointsEarned();
		ShootingRound test4 = result1.bestRound();
		double test5 = comp.skiingScoreForAthlete("Athlete1");
		
        System.out.println("Congrats! Your program compiled and ran!");
	}
}
