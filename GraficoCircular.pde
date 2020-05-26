
public class GraficoCircular{
  
  private ArrayList<String> valores = null;
  private String directorioValores = "";
  private HashMap<String, Float> mapaRepeticiones;
  private color[] colores;
  private boolean creado = false;
  private DataLoader dataLoader = new DataLoader();
  
  
  GraficoCircular(ArrayList<String> valores){
    this.valores = valores;
  }
  
  GraficoCircular(String directorioValores){
     this.directorioValores = directorioValores;
  }
  
  void display(){
    if(!creado){
      
      if(valores != null){
        mapaRepeticiones = contarPorcentajes(valores);      
      }else{
        valores = dataLoader.cargarDatos(directorioValores);
        mapaRepeticiones = dataLoader.contarPorcentajes(valores);
      }
      
      colores = new color[mapaRepeticiones.size()];

      float[] angulos = dataLoader.cargarAngulos(mapaRepeticiones);
      
      crearLeyenda();
      pieChart(700, angulos);
      creado = true;
    }
  }
  
  
  void pieChart(float diametro, float[] data) {
    float ultimoAngulo = 0;
    for (int i = 0; i < data.length; i++) {
      //float gray = map(i, 0, data.length, 0, 255);
      fill(colores[i]);
      //anadirValor();
      arc(width/2.5, height/2, diametro, diametro, ultimoAngulo, ultimoAngulo+radians(data[i]));
      ultimoAngulo += radians(data[i]);
    }
  }
  
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
  
  //<>//
  
  void crearLeyenda(){
    
     int inicioX = (width/3)*2;
     fill(220);
     rect(inicioX,50,600,960);
     
     textSize(28);
     fill(0);
     text("LEYENDA", inicioX+250, 80);
     line(inicioX,90, inicioX+600, 90);

    // Introducir datos en la leyenda
    int size = mapaRepeticiones.size();
    float desplazamientoY = 900 / size;
    float tempY = 90;
    
    int colorCounter = 0;
    for(String s: mapaRepeticiones.keySet()){
      color randomColor = randomColor();
      fill(randomColor);
      anadirColor(randomColor, colorCounter);
      colorCounter++;
      strokeWeight(1);    
      rect(inicioX + 100, tempY+(desplazamientoY/2), 20, 20);
      
      fill(0);
      text(s, inicioX + 300, tempY + (desplazamientoY/2)+20);
      text(((mapaRepeticiones.get(s)*100)/360) + "%", inicioX + 400, tempY + (desplazamientoY/2)+20);

      tempY += desplazamientoY;
    }
  }
  
 
  color randomColor(){
    return color(random(255), random(255), random(255));
  }
  
  void anadirColor(color tempColor, int iterator){
    this.colores[iterator] = tempColor;
  }
}
