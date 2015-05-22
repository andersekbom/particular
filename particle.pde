class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;

  float size = random(5,20);
  float mass; 
  color c;

  int lifespan = (int) random(100,500);
  
  Particle(PVector loc, PVector vel, color c_){
    location = loc.get();
    velocity = vel.get();
    acceleration = new PVector(0, 0.01);
    mass = size;
    c = c_;
  }
 
  void run(){
    move();
    display();
    //checkBoundaryCollision();
    lifespan--;
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
 
 void move(){
   applyForce(wind);
   applyForce(gravity);
   flutter();
   velocity.add(acceleration);
   location.add(velocity);
   acceleration.mult(0);
   grow();
 }

  void grow(){
   if(frameCount % 20 == 0 && size > 0){
     size--; // Actually shrink
   }
  }

  void flutter(){
   PVector flutter = PVector.random2D();
   flutter.mult(1);
   applyForce(flutter);   
  }

  boolean isDead(){
    if(lifespan < 0){
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
