import java.lang.Math;

interface IBinTree {
 // determines whether element is in the tree
 boolean hasElt(int e);
 // returns number of nodes in the tree; counts duplicate elements as separate items
 int size();
 // returns depth of longest branch in the tree
 int height();
 
 // comparison Bintrees
 public boolean equals(Object other);
 
 public boolean isHeap(IBinTree tree);
 
 public boolean isValidAdd(IBinTree a, IBinTree b, int item);
 
 public boolean isValidRemove(IBinTree a, IBinTree b, int item);
 
}