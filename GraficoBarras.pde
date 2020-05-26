
 
public class GraficoBarras{

  private ArrayList<String> valores = null;
  private String directorioValores = "";
  private HashMap<String, Integer> mapaRepeticiones;
  private boolean creado = false;
  private boolean cuadricula = false;
  private DataLoader dataLoader = new DataLoader();
  

  
  GraficoBarras(ArrayList<String> valores){
     this.valores = valores;
     this.cuadricula = false;
  }
  
  GraficoBarras(String directorioValores){
     this.directorioValores = directorioValores;
  }
  
  void display(){
    if(!creado){   
      if(valores != null){
        mapaRepeticiones = dataLoader.contarRepeticiones(valores);
      }else{
        valores = dataLoader.cargarDatos(directorioValores);
        mapaRepeticiones = dataLoader.contarRepeticiones(valores);
      }
      
      for(String s: mapaRepeticiones.keySet()){
        System.out.println(s + " --> " + mapaRepeticiones.get(s));
      }
      crearBarraY(cuadricula);
      creado = true;
    }
    
  }
  
  
  void crearBarraY(boolean cuadricula){
    
    // 1- Buscar el valor con mas repeticiones
    int maxTemp = 0;
    for(Integer cantidad: mapaRepeticiones.values()){
      if(cantidad > maxTemp){
        maxTemp = cantidad;
      }
    }
    
    // 2- Introducir rangos Y
    float tempY = 10;
    
    if(maxTemp > 10000){
      introducirValoresY(100000);
      crearBarraX(0.01);
    }else if(maxTemp > 1000){
      introducirValoresY(10000);
      crearBarraX(0.1);
    }else if (maxTemp > 100){
      introducirValoresY(1000);
      crearBarraX(1);
    }else if(maxTemp > 10){
      introducirValoresY(100);
      crearBarraX(10);
    }else{
      introducirValoresY(10);
      crearBarraX(100);

    }
    
    // 3- Lineas rangos Y
    if(cuadricula){ //<>//
      tempY = 10; 
      strokeWeight(2);
      line(60, tempY, 60, 1010);
      do{
        fill(211,211,211);
        strokeWeight(2);
        line(50, tempY, 1860, tempY);
        for(int i=0; i<=8; i++){
          tempY +=10;
          strokeWeight(1);
          line(55, tempY, 1860, tempY);
        }
        tempY +=10;
      }while(tempY < 1010);
    }else{
      tempY = 10; 
      strokeWeight(2);
      line(60, tempY, 60, 1010);
      do{
        strokeWeight(2);
        line(50, tempY, 70, tempY);
        for(int i=0; i<=8; i++){
          tempY +=10;
          strokeWeight(1);
          line(55, tempY, 65, tempY);
        }
        tempY +=10;
      }while(tempY < 1010);
    }
    
  }
  
  
  void crearBarraX(float espacio){

     line(60,1010,1860,1010); //<>//

    // Introducir labels objetos en X
    int size = mapaRepeticiones.size();
    float desplazamientoX = 1800 / size;
    float tempDesplazamiento = 60 + desplazamientoX/2;
    float tempX = 60;
    float sizeY;
    
    for(String s: mapaRepeticiones.keySet()){ //<>//
      sizeY = mapaRepeticiones.get(s);
      fill(random(1,255),random(1,255),random(1,255));
      strokeWeight(3);
      rect(tempX, 1010-(sizeY*espacio), desplazamientoX, sizeY*espacio);
      tempX += desplazamientoX;
      fill(0);
      text(s, tempDesplazamiento, 1025);
      tempDesplazamiento += desplazamientoX;
    }

  }
      
  
  

  void introducirValoresY(int valorMaximo){
    int rango = valorMaximo/10;
    int tempY = 10;
    for(int i = 0; i<=10; i++){  
        fill(0);
        text(valorMaximo+"", 25, tempY+5);
        textAlign(CENTER);
        valorMaximo -= rango;
        tempY += 100;
    }
  }
  
}
