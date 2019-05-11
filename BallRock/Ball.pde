class Ball extends Thing implements Moveable {
  //int n;
  //String movement;
  int col;
  PImage i ;
  int randMove;
  float speedY, speedX;
  float prevX, prevY;

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
    speedY = random(-5,5);
    speedX = random(-5,5);
    while (speedX == 0) speedX = random(-5,5);
    while (speedY == 0) speedY = random(-5,5);
    prevX = x - speedX;
    prevY = y - speedY;
  }

  void display() {
    /* KAYLA */
    //rect(x, y, 34, 34);
    if (mode == 0) {
      fill(r, g, b);
      ellipse(x, y, 10, 10);
    } else {
      image(i, x, y, 50, 50);
    }
  }

  void move() {
    /* VIVIAN */
    prevX = x;
    prevY = y;
    x += speedX;
    y += speedY;
    touchWall();
  }
  
  void touchWall() {
    if ((x > MAX_WIDTH-30 && prevX < MAX_WIDTH-30) || (x < 20 && prevX > 20)) {
      speedX *= -1;
      if (x > MAX_WIDTH-30 && prevX < MAX_WIDTH-30) x = MAX_WIDTH-30;
      else x = 20;
    }
    if ((y > MAX_HEIGHT-30 && prevY < MAX_HEIGHT-30) || ( y < 20 && prevY > 20)) {
      speedY *= -1;
      if (y > MAX_HEIGHT-30 && prevY < MAX_HEIGHT-30) y = MAX_HEIGHT-30;
      else y = 20;
    }
  }
}
