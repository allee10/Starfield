int numof = 100;
int stx, sty, stx1, sty1;
float sizeT;
int t=0;
int t2 = 0;
boolean fired = false;
int fOpac = 255;
Particle[]obs = new Particle[numof];
void setup() {
  frameRate (70);
  size (500, 500);
  reset();
}
void draw() {
  if (fired == false) {
    fill(255, 40);
    rect(0, 0, 500, 500);
  } else {
    background(255);
  }
  tail();
  for (int i =0; i<numof; i++) {
    if (fired==true) {
        obs[i].showH();
        obs[i].move();
    }
  }
  if (fired == true) {
    t++;
  }
}
class Particle {
  double myx, myy, mya, mys, myo, myx1, myy1, mys1, myo1, myc, size1;
  float r1, g1, b1, r2, g2, b2;
  Particle() {
    myo = 255;
    myo1= 255;
    myx = stx;
    myy = sty;
    mys = (Math.random()*3);
    mys1=mys;
    mya = Math.random()*2*Math.PI;
    myc = 255;
    size1=8;
    r1 = 255;
    g1 = 153;
    b1 = 255;
    r2 = 255;
    g2 = 153;
    b2 = 255;
  }
  void move() {
    myx+= Math.cos(mya)*mys;
    myy+= Math.sin(mya)*mys;
  }
  void showH(){
    fill (r2, g2, b2, (float)myo);
    ellipse((float)myx, (float)myy, 6, 6);
    myo-=4;
    g2-=5;
    b2-=5;
  }
}
class OddballParticle extends Particle {
  float size2;
  OddballParticle() {
    myo1= 255;
    myx = stx;
    myy = sty;
    myx1 = stx;
    myy1 = sty;
    mys = (Math.random()*3);
    mys1=mys;
    mya = Math.random()*2*Math.PI;
    myc = 255;
    size1=10;
    r1 = 255;
    g1 = 200;
    b1 = 255;
    size2 = (float)(Math.random()*6)+2;
  }
  void move() {
    myx+= (Math.cos(mya)*mys)/2;
    myy+= (Math.sin(mya)*mys)/2;
  }
  void showH() {
    for (int i =0; i<11; i++) {
      size1-=0.5;
      myo1-=0.4;
      mys1-=0.002;
      myx1-= Math.cos(mya)*mys1;
      myy1-= Math.sin(mya)*mys1;
      fill(r1, g1, b1, (float)myo1);
      ellipse ((float)myx1, (float)myy1, size2, size2);
    }
    r1+=2;
    b1+=3;
  }
  
}
void mouseClicked() {
  stx = mouseX;
  stx1= mouseX;
  sty = mouseY;
  reset();
}
void reset() {
  sizeT=10;
  fOpac=255;
  sty1 = 800;
  t=0;
  background (255);
  noStroke();
  fired = false;
  for (int i =0; i<numof; i++) {
    obs[i] = new Particle();
  }
  for (int i=0; i<numof/4; i++) {
    obs[i] =  new OddballParticle();
  }
}
void tail() {
  for (int i =0; i <5; i++){
  fill(255,153,255, fOpac);
  sty1-=1.5;
  sizeT-=0.01;
  ellipse ((float)stx1-2, sty1, sizeT, sizeT);
  ellipse ((float)stx1+2, sty1, sizeT, sizeT);
  beginShape();
  vertex(stx1-sizeT+1, sty1);
  vertex(stx1+sizeT-1, sty1);
  vertex(stx1, sty1+sizeT+1);
  endShape();
  if (sty1<sty+3 && sty1>sty-3) {
    fOpac=0;
    fired = true;
  }
}
}

