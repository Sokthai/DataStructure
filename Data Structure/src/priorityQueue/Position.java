package priorityQueue;



public interface Position<E> { //position only Method
	E getElement() throws IllegalStateException;
}