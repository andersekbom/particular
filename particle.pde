class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector(0,0);

  float size = random(particleSize/2,particleSize*2);
  float mass; 
  float particleLifespan;
  color c;
  
  Particle(PVector loc, PVector vel, color c_){
    location = loc.get();
    velocity = vel.get();
    mass = size;
    c = c_;
    particleLifespan = random(100,500) * lifespan;
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
   particleLifespan--;
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
    if(particleLifespan < 0 || location.x < 0 || location.x > width || location.y < 0 || location.y > height){
      return true;
    }else if(particleLifespan < 3 && particleLifespan > 0){
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
