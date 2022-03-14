class Ruta{
    
    String ren;
    String ret;
    String start;
    String end;
    String min;
    
    Ruta(String ren, String ret, String start, String end, String min){
        this.ren = ren;
        this.ret = ret;
        this.start = start;
        this.end = end;
        this.min = min;
    }
    
    String getRen(){
      return ren;
    }
    
    String getRet(){
      return ret;
    }
    
    String getStart(){
      return start;
    }
    
    String getEnd(){
      return end;
    }
    
    String getMin(){
      return min;
    }
    
    void printRuta(){
        println("Rental: "+ren+ "  Return: "+ret+ "  Start: "+start+"  End: "+end+"  Minutos: "+min);
        //text("Rental: "+ren+ "  Return: "+ret, 100,100);
        //text("Start: "+start+"  End: "+end+"  Minutos: "+min, 100,200);
    }
   
   

}
