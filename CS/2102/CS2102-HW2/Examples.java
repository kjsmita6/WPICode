import static org.junit.Assert.*;
import java.util.Arrays;
import java.util.LinkedList;
import org.junit.Test;

/**CS2102 Homework 2
 * 
 * @author Kyle Smith  kjsmith@wpi.edu
 * @author Wonjae Jang wjang@wpi.edu
 *
 */
public class Examples 
{
    double EPSILON = 1e-14;
    
    ShootingRound a1r1 = new ShootingRound(3);
    ShootingRound a1r2 = new ShootingRound(5);
    ShootingRound a1r3 = new ShootingRound(2);
    ShootingRound a1r4 = new ShootingRound(4);
    
    ShootingRound a2r1 = new ShootingRound(4);
    ShootingRound a2r2 = new ShootingRound(1);
    ShootingRound a2r3 = new ShootingRound(2);
    ShootingRound a2r4 = new ShootingRound(4);
    
    ShootingRound a3r1 = new ShootingRound(1);
    ShootingRound a3r2 = new ShootingRound(2);
    ShootingRound a3r3 = new ShootingRound(3);
    
    LinkedList<ShootingRound> linkList1 = new LinkedList<ShootingRound>();
    LinkedList<ShootingRound> linkList2 = new LinkedList<ShootingRound>();
    LinkedList<ShootingRound> linkList3 = new LinkedList<ShootingRound>();
    
    LinkedList<String> DNFlist = new LinkedList<String>();

    public Examples() 
    {
    	linkList1.add(a1r1);
    	linkList1.add(a1r2);
    	linkList1.add(a1r3);
    	linkList1.add(a1r4);
    	
    	linkList2.add(a2r1);
    	linkList2.add(a2r2);
    	linkList2.add(a2r3);
    	linkList2.add(a2r4);
    	
    	linkList3.add(a3r1);
    	linkList3.add(a3r2);
    	linkList3.add(a3r3);
    	
    	athleteList1.add(a1);
    	athleteList1.add(a2);
    	
    	athleteList2.add(a3);
    	athleteList2.add(a4);
    	athleteList2.add(a5); 
    	
    	athleteList3.add(a4);
    	athleteList3.add(a5);
    	athleteList3.add(a6);
    	
    	athleteList4.add(a4);
    	athleteList4.add(a5);
    	athleteList4.add(a7);
    	
    	DNFlist.add("Ben");
    	
    	c1 = new Competition(4,athleteList1);
        c2 = new Competition(4,athleteList2);
        c3 = new Competition(4,athleteList3);
        c4 = new Competition(4,athleteList4);
        
        skiScore = c2.skiingScoreForAthlete("Ben"); 
    }
    
    ShootingResult a1shootResult = new ShootingResult(linkList1);
    ShootingResult a2shootResult = new ShootingResult(linkList2);
    ShootingResult a3shootResult = new ShootingResult(linkList3);

    SkiingResult a1skiResult = new SkiingResult(3.2, 3, a1shootResult);
    SkiingResult a2skiResult = new SkiingResult(4.6, 2, a2shootResult);
    SkiingResult a3skiResult = new SkiingResult(10.7,4, a3shootResult);
    SkiingResult a4skiResult = new SkiingResult(1,1, a3shootResult);

    Athlete a1 = new Athlete(a1shootResult, a1skiResult,"Kyle");
    Athlete a2 = new Athlete(a2shootResult, a2skiResult,"Wonjae");
    Athlete a3 = new Athlete(a1shootResult, a2skiResult,"Achooo");
    Athlete a4 = new Athlete(a2shootResult, a1skiResult,"Pahad");
    Athlete a5 = new Athlete(a3shootResult, a3skiResult, "Ben"); 
    Athlete a6 = new Athlete(a3shootResult, a3skiResult, "Kyle");
    Athlete a7 = new Athlete(a1shootResult, a4skiResult, "Kyle");

    LinkedList<Athlete> athleteList1 = new LinkedList<Athlete>();
    LinkedList<Athlete> athleteList2 = new LinkedList<Athlete>();
    LinkedList<Athlete> athleteList3 = new LinkedList<Athlete>();
    LinkedList<Athlete> athleteList4 = new LinkedList<Athlete>();
    
    Competition c1, c2, c3, c4;
    double skiScore;
    /*methods that need to be tested 
     *(q5) 1. ShootingResult -> PointsEarned 
     *(q6) 2. ShootingResult -> bestRound ******IMPORTANT*******
     *(q7) 3. Competition    -> ShootingDNF
     *(q8) 4. Competition    -> SkiingScoreForAthlete
     *(q9) 4. Competition    -> anySkiingImprovement
     */
    
    @Test
    public void testPointsEarned()
    {
    	assertEquals(a1shootResult.pointsEarned(),14,EPSILON);
    	assertEquals(a2shootResult.pointsEarned(),11,EPSILON);
    }
    
    @Test
    public void testBestRound()
    {
    	assertTrue(a1.shootResult.bestRound().equals(a1r2));
    	assertTrue(a2.shootResult.bestRound().equals(a2r1));
    }
    
    @Test
    public void testShootingDNF()
    {
    	assertTrue(DNFlist.equals(c2.shootingDNF()));
    }
    
    @Test
    public void testSkiingScoreForAthlete()
    {
    	assertEquals(290.7, skiScore, EPSILON);
    }
    
    @Test
    public void testAnySkiingImprovement()
    {	
    	assertTrue(c4.anySkiingImprovement(c3));
    	assertFalse(c3.anySkiingImprovement(c1));
    }
   
}