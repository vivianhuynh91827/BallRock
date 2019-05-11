class Ball extends Thing implements Moveable {
  //int n;
  //String movement;
  int col;
  PImage i ;
  int randMove;

  /** Mode: 0=ellipse, 1=image*/
  int mode;

  float r, g, b;

  Ball(float x, float y) {
    super(x, y);
    r = random(255);
    g = random(255);
    b = random(255);
    i = BALL_IMGS[floor(random(2))];
    mode = floor(random(5));
    randMove = floor(random(2));
  }

  void display() {
    /* KAYLA */
    float prevX = x;
    float prevY = y;

    //rect(x, y, 34, 34);
    if (mode == 0) {
      fill(r, g, b);
      ellipse(x, y, 10, 10);
    } else {
      image(i, x, y, 50, 50);
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
    if (x > MAX_WIDTH || y > MAX_HEIGHT) {
      direc *= -1;
      x = MAX_WIDTH-1;
      y = MAX_HEIGHT-1;
    }
  }
}
