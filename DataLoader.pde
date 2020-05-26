public class DataLoader{
  
  public ArrayList<String> cargarDatos(String directorioValores){
  ArrayList<String> listaValores = new ArrayList<String>();
       String[] lines = loadStrings(directorioValores);
      for(int i=0; i < lines.length;i++){
        String[] valores = lines[i].split(";");
        for(int j=0; j< valores.length; j++){
          listaValores.add(valores[j]);
        }
      }
      return listaValores; 
  }
  
  public float[] cargarAngulos(HashMap<String, Float> mapa){
    float[] angulos = new float[mapa.size()];
      int i=0;
      for(float f:mapa.values()){
        angulos[i] = f;
        i++;
      }
      return angulos;
  }
  
  public HashMap<String, Integer> contarRepeticiones(ArrayList<String> valores) {
    
    HashMap<String, Integer > mapaNumeros = new HashMap<String, Integer>();
    for(String valor : valores) {    
      
      if(mapaNumeros.isEmpty()) {
        mapaNumeros.put(valor, 1);
      }else {
        boolean existe = false;
        for (String valorTemp : mapaNumeros.keySet()) {      
          if(valor.equals(valorTemp)) { 
            int cantidad = mapaNumeros.get(valor);
            cantidad++;
            mapaNumeros.replace(valor, cantidad);
            existe = true;
            break;
          }
        }
        if(!existe) {
          mapaNumeros.put(valor,1);
        }
      }
    }  
    return mapaNumeros;
    
  }


 public HashMap<String, Float> contarPorcentajes(ArrayList<String> valores) {
    
    HashMap<String, Float > mapaNumeros = new HashMap<String, Float>();
    
    for(String valor : valores) {    
      if(mapaNumeros.isEmpty()) {  
        mapaNumeros.put(valor, 1.0);
      }else { 
        
        boolean existe = false;
        for (String valorTemp : mapaNumeros.keySet()) {      
          if(valor.equals(valorTemp)) { 
            float cantidad = mapaNumeros.get(valor);
            cantidad++;
            mapaNumeros.replace(valor, cantidad);
            existe = true;
            break;
          }
        }
        if(!existe) {
          mapaNumeros.put(valor,1.0);
        } 
        
      }    
    }
    
    float total=0;
    for(float i: mapaNumeros.values()){
      total += i;
    } 
    
    float valorPorcentaje = 0;
    for(String s: mapaNumeros.keySet()){
      float temp = mapaNumeros.get(s);
      valorPorcentaje = (temp/total)*360;
      mapaNumeros.replace(s, valorPorcentaje);
      System.out.println(s + " --> " + valorPorcentaje);
    }
    
    return mapaNumeros;   
 }
} 
