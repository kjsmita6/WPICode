import static org.junit.Assert.*;
import org.junit.Test;

/**
 * 
 * @author Kyle Smith (kjsmith@wpi.edu), Wonjae Jang (wjang@wpi.edu)
 *
 */
public class Examples {

    public Examples() { }
    
    double EPSILON = 1e-14;
    
    ShootingRound a1r1 = new ShootingRound(3);
    ShootingRound a1r2 = new ShootingRound(5);
    ShootingRound a1r3 = new ShootingRound(2);
    ShootingRound a1r4 = new ShootingRound(4);
    
    ShootingResult a1shootResult = new ShootingResult(a1r1, a1r2, a1r3, a1r4);
    SkiingResult a1skiResult = new SkiingResult(3.2, 3, a1shootResult);
    
    Athlete a1 = new Athlete(a1shootResult, a1skiResult);
    
    ShootingRound a2r1 = new ShootingRound(4);
    ShootingRound a2r2 = new ShootingRound(5);
    ShootingRound a2r3 = new ShootingRound(2);
    ShootingRound a2r4 = new ShootingRound(4);
    
    ShootingResult a2shootResult = new ShootingResult(a2r1, a2r2, a2r3, a2r4);
    SkiingResult a2skiResult = new SkiingResult(1.3, 1, a2shootResult);
    
    Athlete a2 = new Athlete(a2shootResult, a2skiResult);
    
    @Test
    public void testCtors() {
    	assertEquals(a1r1, a1shootResult.round1);
    	assertEquals(3.2, a1skiResult.time, EPSILON);
    	assertEquals(1, a2skiResult.place);
    }
    
    @Test
    public void testBetterSkiier() {
    	assertEquals(a2, a2.betterSkiier(a1));
    }
    
    @Test
    public void testBeaten() {
    	assertTrue(a2.hasBeaten(a1));
    	assertFalse(a1.hasBeaten(a2));
    }
    
    @Test
    public void testScores() {
    	// This method tests pointsEarned(), but at the same time it also tests addShootingPenalties()
    	// because pointsEarned() calls addShootingPenalties() in order to make the calculations
    	assertEquals(15, a2shootResult.pointsEarned(), EPSILON);
    	assertEquals(14, a1shootResult.pointsEarned(), EPSILON);
    	
    	assertEquals(120.2, a1skiResult.pointsEarned(), EPSILON);
    	assertEquals(91.3, a2skiResult.pointsEarned(), EPSILON);
    }
}
