class Square extends Particle {

  Square(PVector loc, PVector vel, color c_) {
    super(loc, vel, c_);
  }
  
  void display(){
    fill(c);
    rect(location.x, location.y, size, size);
  }

}
