
public class Pareja<I,V> {
  
  public final I index;
  public final V value;
  
  public Pareja(I index,V value) {
    this.index =index;
    this.value = value;
  }
  
  public I getIndex() {
    return index;
  }
  
  public V getValue() {
    return value;
  }
  
}
