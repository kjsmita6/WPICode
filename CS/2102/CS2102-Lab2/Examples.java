import static org.junit.Assert.*;
import org.junit.Test;

/**
 * 
 * @author Kyle Smith, BX11
 *
 */
public class Examples {
	public static void main(String[] args) { }
	
	Boa safeBoa = new Boa("Abby", 4, "mice");
	Boa dangerBoa = new Boa("Brian", 9, "people");
	Dillo bigDead = new Dillo(65, true);
	Dillo smallAlive = new Dillo(2, false);
	Shark safeShark = new Shark(5, 0);
	Shark dangerShark = new Shark(15, 2);
	
	@Test
	public void testDanger() {
		assertFalse(safeBoa.isDangerToPeople());
		assertTrue(dangerBoa.isDangerToPeople());
		assertFalse(safeShark.isDangerToPeople());
		assertTrue(dangerShark.isDangerToPeople());
	}
	
	@Test
	public void testDillo() {
		assertTrue(bigDead.canShelter());
		assertFalse(smallAlive.canShelter());
	}
	
	@Test
	public void testSize() {
		assertFalse(safeBoa.isNormalSize());
		assertTrue(dangerBoa.isNormalSize());
		assertFalse(safeShark.isNormalSize());
		assertTrue(dangerShark.isNormalSize());
		assertFalse(bigDead.isNormalSize());
		assertTrue(smallAlive.isNormalSize());
	}
}
