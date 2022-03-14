XML xml;
XML extremos;
HashMap<String, XML> nodes;
HashMap<String, XML> ways;
HashMap<String, XML> relations;

float minlat;
float minlon;
float maxlat;
float maxlon;

//Variables de traslación y escalado
int x;
int y;
int scale;
float zoom;

//Paleta de colores para edificios
int ncolors = 5;
color[] colors;

//Elementos para el dibujo
PShape[] eltos;
boolean[] dibujable;

int r = 20;
Table Estaciones;
float[] lats,lons;
String[] nombres;
int nest = 0;

Table data;

ArrayList<Ruta> rutas;

int dRuta = 0;
int c = 0;


//Método necesario si size se define con parámetros
void settings() {
  //Carga del archivo descargado de OSM
  xml = loadXML("data/map.osm");

  extremos = xml.getChildren("bounds")[0];
  nodes = new HashMap<String, XML>();
  ways = new HashMap<String, XML>();
  relations = new HashMap<String, XML>();

  for (XML node : xml.getChildren("node")) nodes.put(node.getString("id"), node);
  for (XML way : xml.getChildren("way")) ways.put(way.getString("id"), way);
  for (XML relation : xml.getChildren("relations")) relations.put(relation.getString("relation"), relation);
  //Obtiene límites en latitud y ongitud del mapa
  minlat = extremos.getFloat("minlat");
  minlon = extremos.getFloat("minlon");
  maxlat = extremos.getFloat("maxlat");
  maxlon = extremos.getFloat("maxlon");
  println("Mapa con longitud (", minlon + ", " + maxlon + ") y latitud " + "(", minlat + ", " + maxlat + ")");
  println("Obtenidos " + ways.size() + " elementos");

  //Fuerzo sx píxeles de ancho de la ventana
  int sx = 1000;
  scale = (int)(sx/(maxlon - minlon));
  size(sx, (int)((maxlat - minlat) * scale), P3D);  
}

void setup() {
  stroke(255);
  rutas = new ArrayList();
  Estaciones = loadTable("data/Geolocalizaciones.csv", "header");
  lats = new float[Estaciones.getRowCount()];
  lons = new float[Estaciones.getRowCount()];
  nombres = new String[Estaciones.getRowCount()];
  //Almacenamos datos en nuestra estructura
  nest = 0;
  for (TableRow est : Estaciones.rows()) {
    nombres[nest] = est.getString("nombre");
    lats[nest] = float(est.getString("latitud"));
    lons[nest] = float(est.getString("altitud"));

    println(nombres[nest], lats[nest], lons[nest]);
    nest++;
  }

  
  //Desplazamiento y zoom
  x = 0;
  y = 0;
  zoom = 1;
  //Paleta de colores aleatorios para relleno de edificios
  colors = new color[ncolors];
  //for (int i=0;i<ncolors;i++)
  //  colors[i]=color(random(255), random(255), random(255));
  colors[0] = color(135,91,246);
  colors[1] = color(80,78,212);
  colors[2] = color(98,133,235);
  colors[3] = color(78,147,212);
  colors[4] = color(91,211,246);

  //Crea los PShape  
  creaEltos();
  leerDatos();
  
    
}



void draw() {
  background(215,215,215);
  //println("X: "+mouseX + "  Y: " + mouseY);
  

  pushMatrix();
  translate(width/2,height/2,-1);
  scale(zoom);
  translate(-(minlon+maxlon)/2 * scale + x, (minlat+maxlat)/2 * scale + y);
  //Dibuja los elementos escogidos
  for (int i=0;i<ways.size();i++){
    if (dibujable[i])
      shape(eltos[i]);
  }
   popMatrix();  
   dibujaMapayEstaciones();
   
  
   
    rutas.get(c).printRuta();
    String renX = rutas.get(c).getRen();
    String retX = rutas.get(c).getRet();  
    String startX = rutas.get(c).getStart(); 
    String endX = rutas.get(c).getEnd();
    String minX = rutas.get(c).getMin();
      

    if(renX.equals("San Telmo") && retX.equals("Cabildo de Gran Canaria")){
       dRuta = 1;
    }    
    
    if(renX.equals("Cabildo de Gran Canaria") && retX.equals("San Telmo")){
        dRuta = 2; 
    }    
    
    if(renX.equals("San Telmo") && retX.equals("Castillo de Mata (elect.)")){
        dRuta = 3; 
    }  
    
    if(renX.equals("Castillo de Mata (elect.)") && retX.equals("San Telmo")){
        dRuta = 4; 
    } 
    
    if(renX.equals("San Telmo") && retX.equals("San Bernardo")){
        dRuta = 5; 
    }  
    
    if(renX.equals("San Bernardo") && retX.equals("San Telmo")){
        dRuta = 6; 
    }  
    
    if(renX.equals("Cabildo de Gran Canaria") && retX.equals("Castillo de Mata (elect.)")){
        dRuta = 7; 
    } 
    
    if(renX.equals("Castillo de Mata (elect.)") && retX.equals("Cabildo de Gran Canaria")){
        dRuta = 8; 
    } 
    
    if(renX.equals("Cabildo de Gran Canaria") && retX.equals("San Bernardo")){
        dRuta = 9; 
    } 
    
    if(renX.equals("San Bernardo") && retX.equals("Cabildo de Gran Canaria")){
        dRuta = 10; 
    } 
    
    if(renX.equals("Castillo de Mata (elect.)") && retX.equals("San Bernardo")){
        dRuta = 11; 
    } 
    
    if(renX.equals("San Bernardo") && retX.equals("Castillo de Mata (elect.)")){
        dRuta = 12; 
    } 
    
      
    text("Rental: "+renX, 780,20);
    text("Return: "+retX, 780,40);
    text("Start: " +startX, 780,60);
    text("End: "   +endX, 780,80);
    text("Minutos: "+minX, 780,100);
    switch(dRuta){
       case 1:
         ruta1();
         break;
         
       case 2:
         ruta2();
         break;
         
       case 3:
         ruta3();
         break;
         
       case 4:
         ruta4();
         break;
         
       case 5:
         ruta5();
         break;
         
       case 6:
         ruta6();
         break;
         
       case 7:
         ruta7();
         break;
         
       case 8:
         ruta8();
         break;
         
       case 9:
         ruta9();
         break;
         
       case 10:
         ruta10();
         break;
         
       case 11:
         ruta11();
         break;
         
       case 12:
         ruta12();
         break;
    }
     
    
    if(c == rutas.size()-1) c = -1;
    c++;   
    
    
   
}




//Del total de ways cargados, selecciona en base a tags
void creaEltos(){
    //Estructura de datos usada en draw
    eltos = new PShape[ways.size()];
    dibujable = new boolean[ways.size()];
  
    //Recorremos los elementos cargados en la estructura HashMap
    int nelto = 0;
    for (XML way : ways.values()) {
      eltos[nelto] = createShape();
      dibujable[nelto] = false;
  
      //Selecciono algunos tags de interés paar mostrar elementos que los tienen
      //Relación de tags de OSM https://wiki.openstreetmap.org/wiki/Tags
      boolean edificio = false;
      boolean calle = false;
      boolean bici = false;
      boolean autopista = false;
      for (XML tag : way.getChildren("tag")) {
        String tipok = tag.getString("k");
        String tipov = tag.getString("v");
        if (tipok.equals("building")){
          edificio = true;
        }
        if (tipok.equals("highway")){
          calle = true;
        }
        if (tipok.equals("lanes")){
           autopista = true;
        }
        
        if (tipok.equals("bicycle") || tipov.equals("cycleway")){
          bici = true;
        }
        
      }
      //Si es de interés, configuro pincel y relleno y creo los vértices
      if (edificio || calle  || bici || autopista ){
        dibujable[nelto] = true;
        //Creación de forma con sus características de color
        eltos[nelto].beginShape();
        if (edificio){
          eltos[nelto].noStroke();
          eltos[nelto].fill(colors[nelto % ncolors]);
        }else{
          eltos[nelto].noFill();
          if (bici)
            eltos[nelto].stroke(255);
          else if(autopista){
            eltos[nelto].stroke(245, 127, 97);
          }else{
            eltos[nelto].stroke(152, 230, 142 );
            eltos[nelto].fill(152, 230, 142 );
          }
        }
        eltos[nelto].strokeWeight(2);
  
        //Los vértices
        for (XML nd : way.getChildren("nd")) {
          XML node = nodes.get(nd.getString("ref"));
  
          float lat = node.getFloat("lat");
          float lon = node.getFloat("lon");        
          eltos[nelto].vertex(lon * scale, -lat * scale);
        }            
        eltos[nelto].endShape();      
      }   
    
      nelto++;
    }
}



void dibujaMapayEstaciones(){
    //Círculo y etiqueta de cada estación según latitud y longitud
    for (int i=0;i<nest;i++){
      float mlon = map(lons[i], minlon, maxlon, 0, width);
      float mlat = map(lats[i], maxlat, minlat, 0, height);
  
      stroke(0);
      strokeWeight (2);
      fill(16,44,84);
      ellipse(mlon, mlat, r, r);    
      textSize(14);
      fill(255);
      rect(mlon-45, mlat-35, (nombres[i].length())*7+5, 20);    
      fill(0,0,0);
      text(nombres[i], mlon-40,mlat-20);
    }   
}


void leerDatos(){
     data = loadTable("data/Sitycleta-2021.csv", "header");
     boolean añadir = false;
     String ren = ""; 
     String ret = ""; 
     
     String start = "";
     String end = "";
     String minutos = "";
     
     
     for (TableRow est : data.rows()) {
        ren = est.getString("Rental place");
        añadir = false;
        if(ren.equals("San Telmo") || ren.equals("Cabildo de Gran Canaria") || ren.equals("Castillo de Mata (elect.)") || ren.equals("San Bernardo") ){
            ret = est.getString("Return place");
            if(ret.equals("San Telmo") || ret.equals("Cabildo de Gran Canaria") || ret.equals("Castillo de Mata (elect.)") || ret.equals("San Bernardo") ){
                if(!ren.equals(ret)) añadir = true;        
             }           
        }
        
        if(añadir){
          start = est.getString("Start");
          end = est.getString("End");
          minutos = est.getString("Minutos");
          Ruta x = new Ruta(ren,ret,start,end,minutos);
          rutas.add(x);
        }
        
    }

}
