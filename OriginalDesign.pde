Star[] stars = new Star[400];

void setup() {
  size(300, 300);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  ufo();
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}

class Star {
  float x;
  float y;
  float z;

  Star () {
    x = random(-width, width);
    y = random (-height, height);
    z= random(width);
  }

  void update() {
    z = z - 10;
    if ( z < 1) {
      z = width;
      x = random(-width, width);
      y = random (-height, height);
    }
  }

  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    float r = map(z, 0, width, 16, 0);

    ellipse(sx, sy, r, r);
  }
}

void ufo()
{
  body();
  body2();
  body3();
  head();
  light();
}

void head() {
  stroke(1);
  fill(70);
  arc(150, 150, 80, 80, PI, radians(360), PIE);
}

void body() {
  fill(197);
  beginShape();
  vertex(150, 180);
  bezierVertex(90, 180, 60, 170, 110, 140);
  endShape();
}

void body2() {
  beginShape();
  vertex(150, 180);
  bezierVertex(180, 180, 250, 180, 190, 140);
  endShape();
}

void body3() {
  noStroke();
  rect(120, 149, 60, 30);
}

void light()
{
  fill(255, 0, 0);
  ellipse(110, 163, 18, 18);
  ellipse(150, 165, 20, 20);
  ellipse(190, 165, 18, 18);
}





