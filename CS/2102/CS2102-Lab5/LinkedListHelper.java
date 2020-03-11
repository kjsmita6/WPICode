import java.util.LinkedList;

public class LinkedListHelper implements ISet {
	LinkedList<String> list;
	
	public LinkedListHelper() {
		list = new LinkedList<String>();
	}
	
	public LinkedListHelper(LinkedList<String> list) {
		this.list = list;
	}
	
	@Override
	public ISet addElt(String e) {
		list.add(e);
		return new LinkedListHelper(list);
	}

	@Override
	public int size() {
		return list.size();
	}

	@Override
	public boolean hasElt(String e) {
		return list.contains(e);
	}
	
	public boolean equals(Object other) {
		if(!(other instanceof LinkedListHelper)) {
			return false;
		}
		LinkedListHelper o = (LinkedListHelper)other;
		return o.list.equals(list);
	}

}
