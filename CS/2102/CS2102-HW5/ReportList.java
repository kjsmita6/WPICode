import java.util.Iterator;
import java.util.LinkedList;
import java.util.Arrays;

public class ReportList<E> implements ICollection<E> {
	LinkedList<E> list = new LinkedList<E>();
	
	@Override
	public void add(E item) {
		list.add(item);
	}

	@Override
	public Iterator<E> iterator() {
		return list.iterator();
	}
	
	public ReportList(E[] array) {
		list = new LinkedList<E>(Arrays.asList(array));
	}
	
	@Override
	public boolean equals(Object other) {
		if(!(other instanceof ReportList<?>)) {
			return false;
		}
		ReportList<E> o = (ReportList<E>)other;
		if(list.size() != o.list.size()) { 
			return false;
		}
		else {
			for(int i = 0; i < list.size(); i ++) {
				if(list.get(i) != o.list.get(i)) {
					return false;
				}
			}
		}
		return true;
	}
	
	@Override
	public int size() {
		return list.size();
	}
	
	@Override
	public E get(int i) {
		return list.get(i);
	}
}