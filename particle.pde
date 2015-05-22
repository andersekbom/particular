class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector(0,0);

  float size = random(5,20);
  float mass; 
  color c;

  int lifespan = (int) random(100,500);
  
  Particle(PVector loc, PVector vel, color c_){
    location = loc.get();
    velocity = vel.get();
    mass = size;
    c = c_;
  }
 
  void run(){
    move();
    display();
    lifeCycle();
  }

 void move(){
   applyForce(wind);
   applyForce(gravity);
   flutter();
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   lifeCycle();
 }
   
  void display(){
    fill(c);
    ellipse(location.x, location.y, size, size);
  }
 
 void applyForce(PVector force){
   PVector f = force.get();
   f.div(mass);
   acceleration.add(f);
 }

  void lifeCycle(){
   lifespan--;
   if(frameCount % 20 == 0 && size > 0){
     size--; // Actually shrink
   }
  }

  void flutter(){
   PVector flutter = PVector.random2D();
   flutter.mult(flutterAmount);
   applyForce(flutter);   
  }

  boolean isDead(){
    if(lifespan < 0 || location.x < 0 || location.x > width || location.y < 0 || location.y > height){
      return true;
    }else if(lifespan < 3 && lifespan > 0){
      die();
      return false;
    }else{
      return false;
    }
  }

  void die(){ // Pop!
    size = size+5;
    c = color(255);
  }


}
