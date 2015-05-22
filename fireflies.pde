import java.util.Iterator;
ArrayList<ParticleSystem> particleSystems;
//Repeller rep;

PVector gravity = new PVector(0, 0.0);
PVector wind = new PVector(0.0, 0);

PVector psLocation;
color psColor;

int particleCount = 0;

int r = 128, g = 128, b = 128;
int flutterAmount = 0;

String s;

void setup(){
  background(0); 
  size(displayWidth,displayHeight);
  noStroke();

  particleSystems = new ArrayList<ParticleSystem>();
  psLocation = new PVector(width/2, height/2);
  psColor = color(r,g,b);
}

void draw(){
  fill(0,100);
  rect(0,0,width,height);

  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
  psColor = color(r,g,b);

  flutterAmount = constrain(flutterAmount,0,5);

  //Repeller rep = new Repeller(new PVector(mouseX,mouseY), (height-mouseY)/5);
  //rep.display();

  Iterator<ParticleSystem> it = particleSystems.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = (ParticleSystem) it.next();
    ps.run();
    particleCount = particleCount + ps.psParticleCount;
  }

  drawGUI();

  if(mousePressed && (mouseButton == LEFT)) {
    psLocation.set(mouseX,mouseY);  
    addNewPS(psLocation, psColor);
  }

  if(mousePressed && (mouseButton == RIGHT)) {
    psLocation.set(mouseX,mouseY);
    removePS(psLocation);
  }


}

void addNewPS(PVector loc, color col) {
  color c = col;
  PVector l = loc.get();
  //l.add(random(-width/2+200,width/2-200), random(-height/2+100,height/2-100) ,0);
  particleSystems.add(new ParticleSystem(l,c,"square"));
}

void removePS(PVector loc) {
  Iterator<ParticleSystem> it = particleSystems.iterator();
  while (it.hasNext()) {
    ParticleSystem ps = (ParticleSystem) it.next();
    if(PVector.dist(loc,ps.origin) < 10){
      it.remove();
    }
  }
  
  
}

void drawGUI(){

  stroke(255);
  fill(255);

  text("Particles: " + str(particleCount), 10, 10, 500, 50);
  particleCount = 0;
  text("Left mouse - New sprinkler", 10, 25, 500, 50);
  text("Right mouse - Remove sprinkler", 10, 40, 500, 50);

  text("Gravity: " + nf(gravity.y, 1, 2), 10, 60, 500, 50);
  text("G - Increase gravity", 10, 75, 500, 50);
  text("g - Decrease gravity", 10, 90, 500, 50);

  text("Wind: " + nf(wind.x,1,2), 10, 112, 500, 50);
  text("H - Increase wind", 10, 127, 500, 50);
  text("h - Decrease wind", 10, 142, 500, 50);

  text("Flutter: " + flutterAmount, 10, 163, 500, 50);
  text("F - Increase flutter", 10, 180, 500, 50);
  text("f - Decrease flutter", 10, 195, 500, 50);

  fill(r,g,b);
  rect(10,height-103,30,30);
  fill(255);
  text("Red [q/w]: " + str(r), 47, height-107, 500, 50);
  text("Green [a/s]: " + str(g), 47, height-92, 500, 50);
  text("Blue [z/x]: " + str(b), 47, height-76, 500, 50);
  text("C - Reset color", 10, height-60, 500, 50);

  noStroke();

}

void keyReleased(){
  switch(key){
  case 'G':
    gravity.add(0,0.1,0);
    break;
  case 'g':
    gravity.add(0,-0.1,0);
    break;
  case 'H':
    wind.add(0.1,0,0);
    break;
  case 'h':
    wind.sub(0.1,0,0);
    break;
  case 'q':
    r--;
    break;
  case 'w':
    r++;
    break;
  case 'a':
    g--;
    break;
  case 's':
    g++;
    break;
  case 'z':
    b--;
    break;
  case 'x':
    b++;
    break;
  case 'F':
    flutterAmount++;
    break;
  case 'f':
    flutterAmount--;
    break;
  case 'c':
    r=128;
    g=128;
    b=128;
    break;
    
  }
}
