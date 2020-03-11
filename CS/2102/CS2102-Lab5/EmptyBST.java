public class EmptyBST implements IBST {

	EmptyBST() { }
	
	@Override
	public IBST addElt(String elt) {
		return new DataBST(elt, new EmptyBST(), new EmptyBST());
	}

	@Override
	public int size() {
		return 0;
	}

	@Override
	public boolean hasElt(String elt) {
		return false;
	}

}
