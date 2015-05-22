class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity;
  color c, cFuzzed;
  int r,g,b;
  String className;
  
  ParticleSystem(PVector location, color c_, String className_){
    particles = new ArrayList<Particle>();
    origin = location.get();
    c = c_;
    className = className_;
  }
  
  color fuzzyColor(color c) {
    float red = random(0.7,1.3) * red(c);
    float green = random(0.7,1.3) * green(c);
    float blue = random(0.7,1.3) * blue(c);
    
    c = color(red, green, blue);
    return c;
  }
  
  void addParticle(){
    cFuzzed = fuzzyColor(c);
    velocity = new PVector(random(-2,2),random(-2,2)); // Each particle gets an individual velocity
    particles.add(new Particle(origin, velocity, cFuzzed));
  }
  
  void applyForce(PVector f){
    for(Particle p : particles){
      p.applyForce(f);
    }
  }
  
  void run(){
    addParticle();
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead() || p.size == 0) {
        it.remove();
      }
    }
  } 
}
