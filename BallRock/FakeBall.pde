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
    if (timeRed > 0) {
      fill(255,0,0);
      ellipse(x,y,49,49);
      timeRed-=1;
    }
    else if (m == 0) {
      fill(r, g, b);
      ellipse(x, y, 49, 49);
      fill(0);
      textSize(10);
      text("F", x - 4, y + 4);
    } 
    else if (m == 1) {
      fill(255, 179, 98);
      ellipse(x, y, 49, 49);
      fill(r, g, b);
      ellipse(x, y, 37, 37);
      fill(255, 255, 255);
      ellipse(x, y, 10, 10);
      fill(0, 0, 0);
      ellipse(x - 9, y + 9, 5, 5);
      fill(0, 0, 0);
      ellipse(x + 9, y + 9, 5, 5);
      fill(0, 0, 0);
      line(x - 3, y + 10, x + 3, y + 10);
    }
    else if (m == 2) {
      //arc(x, y, 50, 50, 0, 2 * PI/3 ); 
      fill(255, 255, 0);
      arc(x, y, 50, 50, 0, 2*PI/3 ); 
      fill(0, 255, 0);
      arc(x, y, 50, 50, 2*PI/3 , 4 * PI/3 ); 
      fill(255, 0, 0);
      arc(x, y, 50, 50, 4 * PI/3 , PI * 2); 
      fill(255);
      ellipse(x, y, 25, 25);
      fill(22, 133, 183);
      ellipse(x, y, 18, 18);
    }
    else {
      image(fi, x, y, 50, 50);
    }
  }
  
  void move() {
    /* VIVIAN */
    prevX = x;
    prevY = y;
    x += speedX;
    y += speedY;
    touchWall();
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
