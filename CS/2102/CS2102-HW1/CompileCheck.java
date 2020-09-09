public class CompileCheck {

    public static void main(String[] args) {

        // dummy variables for assignment
        double x;
        boolean y;
        Athlete a;
        double j;

        // test making ShootingRounds
        ShootingRound shootingRound1 = new ShootingRound(1);
        ShootingRound shootingRound2 = new ShootingRound(3);
        ShootingRound shootingRound3 = new ShootingRound(2);
        ShootingRound shootingRound4 = new ShootingRound(5);

        // test making each of the Result classes
        ShootingResult shootingResult = new ShootingResult(shootingRound1, shootingRound2, shootingRound3, shootingRound4);
        SkiingResult skiingResult = new SkiingResult(2.2, 6, shootingResult);

        // test making two athlete
        Athlete athlete1 = new Athlete(shootingResult, skiingResult);
        Athlete athlete2 = new Athlete(shootingResult, skiingResult);

        // test pointsEarned method
        x = skiingResult.pointsEarned();
        x = shootingResult.pointsEarned();

        // test addShootingPenalties method
        j = skiingResult.addShootingPenalties(shootingResult);

        //test betterSkiier method
        a = athlete1.betterSkiier(athlete2);

        //test hasBeaten method
        y = athlete2.hasBeaten(athlete1);

 
        System.out.println("Congrats! Your program compiled and ran!");
    }
}
