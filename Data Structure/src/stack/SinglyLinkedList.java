package stack;

//import Assignment3.SLLNode;

public class SinglyLinkedList<E> {
	private int size = 0;
	private SLLNode<E> head;
	private SLLNode<E> tail;
	
	public int size(){		
		return size;
	};

	// is the stack empty?
	public boolean isEmpty(){
		return head == null;
	};

	// return the first element without removing it 
	public E first() {
		if (isEmpty()) return null;
		return head.getElement();
	} 

	// return the last element without removing it 
	public E last()   {
		if (isEmpty()) return null;
		return tail.getElement();
	}

	// Add an element to the front of the list
	public  void  insertFirst(E obj){
		SLLNode<E> newNode = new SLLNode<>(obj, head);
		if (isEmpty()) tail = head;
		head = newNode;	
		size++;
	}

	// Add an element to the end of the list
	public  void  insertLast(E obj) {
		assert (obj != null): "object ";
		SLLNode<E> newTail = new SLLNode<> (obj, null);
		if (isEmpty()){
			head = newTail;		
		}else{
			tail.setNextNode(newTail);
		}
		tail = newTail;
		size++;	
	}

	// Remove an element from the front of the list
	public E removeFirst()   {
		return remove(head);
	}

	// Remove an element from the end of the list  
	public E removeLast()   {
		return remove(tail);
	}

	// a method that can be used to get a string of the whole list
	public String toString() {
		if (isEmpty()){return "The list looks like this: EMPTY";};
		SLLNode<E> current = head;
		String msg = "";
		while (current != null){
			msg += current.getElement() + " ";
			current = current.getNextNode();
		}
		return "The list looks like this: " + msg;
	}
	
	/**
     * getTheIndexOf:
     * Precondition: ensure the index is not negative
     * Postcondition: return the node of the give index
     * @param e
     */
	
	protected int getTheIndexOf(E e){
		assert (e != null): "element cannot be null";
		int index = 0;
		if (isEmpty()){return -1; } //if no node, return -1
		
		SLLNode<E> current = head;
		
		if (current.getElement().equals(e)){return index; }//if e is head, just return index 0
	
		while (!current.getElement().equals(e)){	
			index++;
			if (current.getNextNode() == null){	return -1;} //if nothing found
				
			current = current.getNextNode();
		}
		
		return index;
	}
	
	
	protected SLLNode<E> head(){
		return head;
	}
	
	
	/**
     * insertAt:
     * Precondition: ensure the index is not negative
     * Postcondition: add a node and increase the size
     * @param newNode , p
     */
	
	
	
	protected void insertAt(SLLNode<E> newNode, SLLNode<E> p){
		assert (newNode != null && p != null) : "parameters cannot be null";
		SLLNode<E> current = head;
		SLLNode<E> previous = null;
		while(current != p){
			previous = current;
			current = current.getNextNode();
		}
		previous.setNextNode(newNode);
		size++;
	}
	
	
	
	/**
     * remove:
     * Precondition: ensure the parameter p is not null
     * Postcondition: return the given node element if found
     * @param p
     */
	
	protected E remove(SLLNode<E> p){ //remove any nodes
		assert (p != null):  "the node cannot be null";
		E oldElement = p.getElement();
		
		if (size == 1) {//if only 1 node left, simply set everything to null
			head = null;
			tail = null;
			size--;
			return oldElement;
		}
			
		SLLNode<E> current = head;
		SLLNode<E> previous = null;
		while (current != p){ //find the current p
			previous = current;
			current = current.getNextNode();
		}
		
		if (p == head){ //if head
			head = head.getNextNode();
		}else if(p == tail){ //if tail
			previous.setNextNode(null);
			tail = previous;
		}else{ //if anything else
			previous.setNextNode(current.getNextNode());
		}
		
		size--;			
		return oldElement;
	
		
	}
		
		//inner class
		
		 class SLLNode<A>
		{
			private A element;
			private SLLNode <A>  nextNode;

			//constructor: requires object to store, reference to next node
			public  SLLNode(A e, SLLNode <A>  n){
				element = e;
				nextNode = n;
			}

			// provide the object that was stored in the node
			public A getElement(){return element;}

			// provide the link to the next node
			public SLLNode <A>  getNextNode(){return nextNode;}

			// Change the object stored in the node
			public void setElement(A e){element = e;}

			// Change the reference to the next node
			public void setNextNode(SLLNode <A>  n){nextNode = n;}
		   
		            public String toString () {return element.toString();}

		}
	
	
}
