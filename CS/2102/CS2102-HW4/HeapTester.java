
public class HeapTester 
{
	
	
	/**
	 * checks if the heap + the integer = given binary tree
	 */
	
	public boolean addEltTester(IHeap heap, int i, IBinTree binTree) {
		return binTree.isValidAdd(heap, heap.addElt(i), i);
	}
	
	public boolean remMinEltTester(IHeap heap, IBinTree binTree, int item) {
		return binTree.isValidRemove(heap, heap.remMinElt(), item);
	}
}
