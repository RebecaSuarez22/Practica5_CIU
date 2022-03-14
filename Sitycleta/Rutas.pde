int wait = 3500;


//San telmo, Cabildo
void ruta1(){
     int m = millis();
     int fin = m+wait;
     while(millis()<fin){
       stroke(249, 231, 159);
       strokeWeight (5);
       line (496,145,274,233);
       line (274,233,200,131);
     }
}


//Cabildo, San telmo
void ruta2(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(255, 113, 143 );
      strokeWeight (5);
      line (496,145,274,233);
      line (274,233,200,131);
    }
}

//San telmo, Castillo de Mata
void ruta3(){
    int m = millis();
     int fin = m+wait;
     while(millis()<fin){
        stroke(26, 188, 156);
        strokeWeight (5);
        line (496,145,274,233);
        line (274,233,227,169);
        line (227,169,150,192);
        line (150,192,132,169);
        line (132,169,112,169);
     }
}

// Castillo de Mata, San Telmo
void ruta4(){
     int m = millis();
     int fin = m+wait;
     while(millis()<fin){
        stroke(240, 10, 10);
        strokeWeight (5);
        line (496,145,274,233);
        line (274,233,227,169);
        line (227,169,150,192);
        line (150,192,132,169);
        line (132,169,112,169);
     }
}

// San Telmo, San bernando
void ruta5(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(247, 93, 93);
      strokeWeight (5);
      line (496,145,274,233);
      line (274,233,376,368);
      line (376,368,292,405);
      line (292,405,328,452);
    }
}

//San bernando,  San Telmo
void ruta6(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(0,156, 76 );
      strokeWeight (5);
      line (496,145,274,233);
      line (274,233,376,368);
      line (376,368,292,405);
      line (292,405,328,452);
    }
}

//Cabildo, Castillo de Mata
void ruta7(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(128, 0, 128);
      strokeWeight (5);
      line (202,137,225,168);
      line (225,168,152,193);
      line (152,193,129,169);
      line (129,169,112,168);
    }
}

//Castillo de Mata, Cabildo, 
void ruta8(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(0, 255, 255);
      strokeWeight (5);
      line (202,137,225,168);
      line (225,168,152,193);
      line (152,193,129,169);
      line (129,169,112,168);
    }
}

// Cabildo, San bernando
void ruta9(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(255, 255, 0);
      strokeWeight (5);
      line (202,137,225,168);
      line (225,168,152,193);
      line (152,193,327,451);
    }
}

// San bernando, Cabildo, 
void ruta10(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(255, 255, 0);
      strokeWeight (5);
      line (202,137,225,168);
      line (225,168,152,193);
      line (152,193,327,451);
    }
}

// Castillo de Mata, San bernando
void ruta11(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(255, 160, 122);
      strokeWeight (5);
      line (112,170,132,170);
      line (132,170,327,451);
    }
}

// San bernando, Castillo de Mata
void ruta12(){
    int m = millis();
    int fin = m+wait;
    while(millis()<fin){
      stroke(130, 150, 225);
      strokeWeight (5);
      line (112,170,132,170);
      line (132,170,327,451);
    }
}
