class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector velocity;
  color c, cFuzzed;
  int r,g,b;
  String className;
  int psParticleCount;
  
  ParticleSystem(PVector location, color c_, String className_){
    particles = new ArrayList<Particle>();
    origin = location.get();
    c = c_;
    className = className_;
  }

  void run(){
    if(frameCount % frameFreq == 0) {
      addParticle();
    }
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead() || p.size == 0) {
        it.remove();
      }
    }
    psParticleCount = particles.size();
  } 

  void addParticle(){
    cFuzzed = fuzzyColor(c);
    velocity = new PVector(impulseX,impulseY);
  switch(particleType) {
    case 1: 
      particles.add(new Circle(origin, velocity, cFuzzed));
      break;    
    case 2:
      particles.add(new Square(origin, velocity, cFuzzed));
      break;    
    case 3: 
      particles.add(new Star(origin, velocity, cFuzzed));
      break;
    }
  }
  
  color fuzzyColor(color c) {
    float red = random(0.7,1.3) * red(c);
    float green = random(0.7,1.3) * green(c);
    float blue = random(0.7,1.3) * blue(c);
    c = color(red, green, blue);
    return c;
  }  
}
