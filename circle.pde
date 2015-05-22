class Circle extends Particle {

  Circle(PVector loc, PVector vel, color c_) {
    super(loc, vel, c_);
  }
  
  void display(){
    fill(c);
    ellipse(location.x, location.y, size, size);
  }

}
