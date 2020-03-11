public abstract class AbsAnimal implements IAnimal {
	int length ;
	  
	  AbsAnimal (int length) {
	    this.length = length ;
	  }  

	  // determines whether this.length lies between given bounds
	  boolean isLenWithin(int low, int high) {
	    return low <= this.length && this.length <= high ;
	  }
	  
	  /*
	   * Alternate solution
	   * 
	  boolean isDangerToPeople() {
		  if(this instanceof Boa) {
			  return ((Boa)this).eats.equals("people");
		  }
		  else if(this instanceof Shark) {
			  return ((Shark)this).attacks >= 1;
		  }
		  return false;
	  }
	  */
	  boolean isDangerToPeople() {
		  return false;
	  }
}
