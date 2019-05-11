class FakeBall extends Ball implements Moveable {
  PImage fi;
  int m;
  float r, g, b;

  FakeBall(float x, float y) {
    super(x, y);
    r = random(255);
    g = random(255);
    b = random(255);
    fi = BALL_IMGS[floor(random(2)) + 2];
    m = floor(random(5));
  }
  
  void display() {
    /* KAYLA */
    float prevX = x;
    float prevY = y;

    //rect(x, y, 34, 34);
    if (m == 0) {
      fill(r, g, b);
      ellipse(x, y, 10, 10);
    } else {
      image(fi, x, y, 50, 50);
    }
    //for (int a = 0; a < n; a++) {
    //  line(prevX, prevY, );
    //}
  }
}
