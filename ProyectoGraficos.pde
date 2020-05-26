
GraficoBarras gB;
GraficoCircular gC;


void setup(){
  size(1920, 1080, P2D);
  background(255);
  ArrayList<String> listaValores = new ArrayList<String>();
  
  /*
  for(int j=0; j<=999;j++){
    if(j%2==0){
      listaValores.add("par");
    }else{
      listaValores.add("impar");    
    }
  }
  */
  
  
  for(int i=0; i<=1000000; i++){
    listaValores.add((int)random(0,30)+"");
  }
  
  
  //gB = new GraficoBarras("valoresAleatorios.csv");
  //gB = new GraficoBarras(listaValores);
  
  gC = new GraficoCircular(listaValores);
  //noLoop();
}

void draw(){
  
 // gB.display();
  

    
  gC.display();
}

void keyPressed(){
  
  switch(key){
    case('c'):
      background(255);
      gB.creado = false;
      gB.cuadricula = true;
    break;
    case('q'):
      background(255);
      gB.creado = false;
      gB.cuadricula = false;   
    break;
  }
}
