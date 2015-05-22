import java.util.Iterator;
ArrayList<ParticleSystem> particleSystems;
//Repeller rep;

PVector gravity = new PVector(0, 0.1);
PVector wind = new PVector(0.0, 0);

PVector psLocation;
color psColor;

int particleCount = 0;

void setup(){
  background(0); 
  size(displayWidth-50,displayHeight-100);
  noStroke();

  particleSystems = new ArrayList<ParticleSystem>();

  psLocation = new PVector(width/2, height/2);
  psColor = color(0,random(70,150),random(180,255));

  for (int i=0; i < 1; i++){
    addNewPS(psLocation, psColor);
  }
}

void draw(){
  fill(0,100);
  rect(0,0,width,height);

  if(keyPressed){
    switch(key){
    case 'n':
      addNewPS(psLocation, psColor);
      break;
    case 'r':
      removeLast();
      break;
    }
  }

  //Repeller rep = new Repeller(new PVector(mouseX,mouseY), (height-mouseY)/5);
  //rep.display();

  Iterator<ParticleSystem> it = particleSystems.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = (ParticleSystem) it.next();
    ps.run();
    particleCount = particleCount + ps.psParticleCount;
  }

  fill(255);
  text(str(particleCount), 10, 10, 70, 80);
  particleCount = 0;
}

void addNewPS(PVector loc, color col) {
  color c = col;
  PVector l = loc.get();
  l.add(random(-width/2+200,width/2-200), random(-height/2+100,height/2-100) ,0);
  particleSystems.add(new ParticleSystem(l,c,"square"));
}

void removeLast() {
  if (particleSystems.size() > 1) {
    particleSystems.remove(particleSystems.size()-1);
  }
}
