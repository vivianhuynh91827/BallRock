class Ball extends Thing implements Moveable {
  //int n;
  //String movement;
  int col;
  PImage i ;
  int randMove;
  
  /** Mode: 0=ellipse, 1=image (2 choices by random), 2= */
  int mode;
  
  float r, g, b;

  Ball(float x, float y) {
    super(x, y);
    randImg = (int) random(2);
    r = random(255);
    g = random (255);
    b = random (255);
  }
  Ball(float x, float y, PImage im, int m) {

    super(x, y);
    mode = m;
    i = im;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  Ball(float x, float y, int m) {
    super(x, y);
    mode = m;
    r = random(255);
    g = random (255);
    b = random (255);
  }

  void display() {
    /* KAYLA */
    float prevX = x;
    float prevY = y;

    //rect(x, y, 34, 34);
    if (mode == 1) {
      image(i, x, y, 50, 50);
    } else if (mode == 0) {
      fill(r, g, b);
      ellipse(x, y, 10, 10);
    }
    //for (int a = 0; a < n; a++) {
    //  line(prevX, prevY, );
    //}
  }

  void move() {
    /* VIVIAN */
    int direc = 1;
    if (randMove == 0) {//moving horizontally
      x += direc*2;
    } else if (randMove == 1) {//moving vertically
      y += direc*2;
    } else if (randMove == 2) { //moving diagonally
      x += direc*2;
      y += direc*2;
    }
    if (x > width|| y > height) {
      direc *= -1;
      x = width-1;
      y = height-1;
    }
  }
}
