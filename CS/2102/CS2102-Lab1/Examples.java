import static org.junit.Assert.*;
import org.junit.Test;

public class Examples {

    public Examples(){}
    
    /*
    // This shows what a test case looks like
    @Test 
    public void simpleCheck() {
	assertEquals(4, 4);
    }
    */
    Song HapBD = new Song("Happy Birthday", 18);
  
    @Test
    public void checkHBLen() {
    	assertEquals(18, HapBD.lenInSeconds);
    }
    
    @Test
    public void checkHBLenBad() {
    	assertEquals(19, HapBD.lenInSeconds);
    }
}
