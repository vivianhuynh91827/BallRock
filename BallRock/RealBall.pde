class RealBall extends Ball implements Moveable {
  PImage ri;
  int m1;
  float r, g, b;
  float parabHeight, parabWidth, xTravelled;


  RealBall(float x, float y) {
    super(x, y);
    speedX = random(2, 3);
    parabHeight = y; //parabola = x^2 - parabHeight // dydt = -2x(dxdt) // dxdt = speedX
    parabWidth = 2* sqrt(800-y);
    xTravelled = parabWidth *.5;
    r = random(255);
    g = random(255);
    b = random(255);
    ri = BALL_IMGS[floor(random(2))];
    m1 = floor(random(3));
  }
  
  @Override
  void display() {
    /* KAYLA */
    //rect(x, y, 34, 34);
    if (timeRed > 0) {
      fill(255,0,0);
      ellipse(x,y,49,49);
      timeRed-=1;
    }
    else if (m1 == 0) {
      fill(r, g, b);
      ellipse(x, y, 49, 49);
      fill(0);
      textSize(10);
      text("R", x - 4, y + 4);
    } 
    else if (m1 == 1) {
      fill(r, g, b);
      ellipse(x, y, 49, 49);
      fill(0, 0, 0);
      ellipse(x - 7, y - 2, 5, 5);
      fill(0, 0, 0);
      ellipse(x + 8, y - 2, 5, 5);
      fill(0, 0, 0);
      ellipse(x, y + 9, 5, 5);
    }
    else {
      image(ri, x, y, 50, 50);
    }
  }

  @Override
  void move() {
    /* VIVIAN */
    prevX = x;
    prevY = y;
    speedY = ((xTravelled-(.5*parabWidth)) * speedX * 2)/10;
    x += speedX;
    y -= speedY;
    touchWall();
    xTravelled += abs(speedX);
    if (xTravelled >=parabWidth) {
      xTravelled = 0; //reset parabola
    }
    for (Collideable c : ListOfCollideables) {
      if (c.isTouching(this)) {
        speedX *= -1;
        speedY *= -1;
        timeRed = 20;
      }
    }
    //touchWall();
  }
}
