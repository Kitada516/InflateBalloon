import ddf.minim.*;

Minim minim;
AudioInput in;
float volumeIn;
float volumeTemp;
float size;

PImage balloon;
PImage explosion;

void setup() {
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
  fill(200,0,0);
  balloon = loadImage("husen.png");
  explosion = loadImage("husen2.png");
  size = 50;
}

void draw() {
  background(0);
  volumeIn = map(in.left.level(), 0, 0.5, 0, 10);
  
  if (size < height*0.95) {
    if (volumeIn>5){
      size = size + 10;
    }else {
      if (size > 20) {
        size = size - 0;
      }
    }
    image(balloon, width/2-size/2+random(-5, 5), height/2-size/2+random(-5, 5), size, size);
  }else {
    image(explosion, width/2-size/2+random(-5, 5), height/2-size/2+random(-5, 5), size, size);
  }
}

void stop(){
  in.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
       size = 50;
    }
  }
}