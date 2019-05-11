class RealBall extends Ball implements Moveable {
  PImage ri;
  int m1;
  float r, g, b;

  RealBall(float x, float y) {
    super(x, y);
    r = random(255);
    g = random(255);
    b = random(255);
    ri = BALL_IMGS[floor(random(2))];
    m1 = floor(random(4));
  }
  void display() {
    /* KAYLA */
    //rect(x, y, 34, 34);
    if (m1 == 0) {
      fill(r, g, b);
      ellipse(x, y, 49, 49);
      fill(0);
      textSize(10);
      text("R", x - 4, y + 4);
    } 
    else if (m1 == 1) {
      
    }
    else if (m1 == 2) {
      
    }
    else {
      image(ri, x, y, 50, 50);
    }
  }
}
