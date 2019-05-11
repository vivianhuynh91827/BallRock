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
    randMove = floor(random(2));
    speedY = random(-10,10);
    speedX = random(-10,10);
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
    randMove = 2;
    if (randMove == 0) {//moving horizontally
      x += speedX;
    } else if (randMove == 1) {//moving vertically
      y += speedY;
    } else if (randMove == 2) {//moving diagonally
      x += speedX;
      y += speedY;
    }
    touchWall();
  }
  
  void touchWall() {
    if ((x > MAX_WIDTH-45 && prevX < MAX_WIDTH-45) || (x < 0 && prevX > 0)) {
      speedX *= -1;
    }
    if ((y > MAX_HEIGHT-45 && prevY < MAX_HEIGHT-45) || ( y < 0 && prevY > 0)) {
      speedY *= -1;
    }
  }
}
