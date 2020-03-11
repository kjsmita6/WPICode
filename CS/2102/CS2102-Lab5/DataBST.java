public class DataBST implements IBST {
	String data;
	IBST left;
	IBST right;

	DataBST(String data, IBST left, IBST right) {
		this.data = data;
		this.left = left;
		this.right = right;
	}

	DataBST(String data) {
		this.data = data;
		this.left = new EmptyBST();
		this.right = new EmptyBST();
	}
	
	@Override
	public IBST addElt(String elt) {
		if (elt.equals(this.data)) {
			return this;
		}
		else if (elt.compareTo(this.data) < 0) {
			return new DataBST (this.data,
					this.left.addElt(elt),
					this.right);
		}
		else {
			return new DataBST (this.data,
					this.left,
					this.right.addElt(elt));
		}
	}

	@Override
	public int size() {
		return 1 + this.left.size() + this.right.size();
	}

	@Override
	public boolean hasElt(String elt) {
		if (elt.equals(this.data)) {
			return true; 
		}
		else if (elt.compareTo(this.data) < 0) {
			return this.left.hasElt(elt);
		}
		else {
			return this.right.hasElt(elt);
		}
	}
	
	@Override
	public boolean equals(Object other)
	{
		if(!(other instanceof DataBST)) {
			return false;
		}
		DataBST o = (DataBST)other;
		return equal(this, o);
	}
	
	public boolean equal(ISet h1, ISet h2) {
		if(h1 instanceof EmptyBST && h2 instanceof EmptyBST) {
			return true;
		}
		else if(!(h1 instanceof DataBST) || !(h2 instanceof DataBST)) {
			return false;
		}
		
		DataBST dh1 = (DataBST)h1;
		DataBST dh2 = (DataBST)h2;
		
		if(dh1.data != dh2.data) {
			return false;
		}
		return equal(dh1.left, dh2.left) && equal(dh1.right, dh2.right);
	}


}
