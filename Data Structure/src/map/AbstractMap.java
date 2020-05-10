package map;

import java.util.Iterator;

public abstract class AbstractMap<K, V> implements MapADT<K, V> {
	public boolean isEmpty() {
		return size() == 0;
	}
	
	protected static class MapEntry<K, V> implements Entry<K, V>{
		private K key; 
		private V value;
		public MapEntry(K key, V value) {
			this.key = key;
			this.value = value;
		}
		
		@Override
		public K getKey() {
			return this.key;
		}

		@Override
		public V getValue() {
			return this.value;
		}
		
		protected void setKey(K key) {
			this.key = key;
		}
		
		protected V setValue(V value) {
			V oldValue = this.value;
			this.value = value;
			return oldValue;
		}
	}
	
	
	private class KeyIterator implements Iterator<K>{
		private Iterator<Entry<K, V>> entries = entrySet().iterator();
		
		public boolean hasNext() {
			return entries.hasNext();
		}
		
		public K next() {
			return entries.next().getKey();
		}
		
		public void remove() {
			throw new UnsupportedOperationException();
		}
		
	}
	
	private class KeyIterable implements Iterable<K>{
		public Iterator<K> iterator(){ 
			return new KeyIterator();
		}
	}

	//End Inner class---------------
	
	
	
	
	public Iterable<K> keySet(){
		return new KeyIterable();
	}
	
//	End keySet function----------------------------------------------
	
	
	
	private class ValueIterator implements Iterator<V>{
		private Iterator<Entry<K, V>> entries = entrySet().iterator();
		
		@Override
		public boolean hasNext() {
			return entries.hasNext();
		}
	
		@Override
		public V next() {
			return entries.next().getValue();
		}
		
		public void remove() {
			throw new UnsupportedOperationException();
		}
	}
	
	private class ValueIterable implements Iterable{

		@Override
		public Iterator iterator() {
			return new ValueIterator();
		}
		
	}
	
	public Iterable<V> values(){
		return new ValueIterable();
	}
	
}
