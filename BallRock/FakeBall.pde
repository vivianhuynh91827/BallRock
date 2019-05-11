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
    m = floor(random(4));
  }
  
  void display() {
    /* KAYLA */
    //rect(x, y, 34, 34);
    if (m == 0) {
      fill(r, g, b);
      ellipse(x, y, 49, 49);
      fill(0);
      textSize(10);
      text("F", x - 4, y + 4);
    } 
    else if (m == 1) {
      
    }
    else if (m == 2) {
      
    }
    else {
      image(fi, x, y, 50, 50);
    }
  }
}
