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
    m1 = floor(random(5));
  }
  void display() {
    /* KAYLA */
    float prevX = x;
    float prevY = y;

    //rect(x, y, 34, 34);
    if (m1 == 0) {
      fill(r, g, b);
      ellipse(x, y, 10, 10);
    } else {
      image(ri, x, y, 50, 50);
    }
    //for (int a = 0; a < n; a++) {
    //  line(prevX, prevY, );
    //}
  }
}
