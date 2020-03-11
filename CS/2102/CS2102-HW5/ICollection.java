import java.util.Iterator;

public interface ICollection<E> extends Iterable<E> {
	void add(E item);
	Iterator<E> iterator();
	boolean equals(Object other);
	int size();
	E get(int i);
}
