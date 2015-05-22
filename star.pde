class Star extends Particle {

  PImage image;
  
  Star(PVector loc, PVector vel, color c_) {
    super(loc, vel, c_);
    image = loadImage("star.png");
  }
  
  void display(){
    imageMode(CENTER);
    image(image,location.x,location.y);

  }

}
