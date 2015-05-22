class Repeller {
 
  PVector location;
  float size;
 
   Repeller(PVector loc, float size_){     
     location = loc.get();
     size = size_;
   }
  
  void display(){
    if(mousePressed){
      fill(255);
    }else{
      fill(128);
    }
    ellipse(location.x, location.y, size, size);
  }

  PVector attract(Particle p){  
    PVector attraction = PVector.sub(location, p.location);
    attraction.normalize();
    attraction.mult(size/1000);
    return attraction;
  }

}
