// center coors for circular movements
final float C_X = 500;
final float  C_Y = 400;

public class LivingRock extends Rock implements Moveable {
  float incX, incY;
  int moveV;
  float radius;

  // automatically assigned
  PImage eye = EYE_IMG;


  LivingRock(float x, float y) {
    super(x, y);
    moveV = 4; //floor(random(5));
    incX = random(20);
    incY = random(20);

    if (moveV == 4) {
      radius = sqrt(pow((x - C_X), 2) + pow((y - C_Y), 2));
    }
  }

  void move() {
    /* TIFFANY */
    /*
    this.x += random(5);
     this.y += random(5);
     */

    // bouncing behavior
    if (x >= MAX_WIDTH - 50 || x <= 0) incX *= -1;
    if (y >= MAX_HEIGHT - 50 || y <= 0) incY *= -1;

    if (moveV == 0) { //moving horizontally
      this.x += incX;
    }

    if (moveV == 1) { //moving vertically
      this.y += incY;
    }

    if (moveV == 2) { //move diagonally, bouncing
      this.x += incX;
      this.y += incY;
    }

    if (moveV == 3) { //bouncing up and down
      //x += x * incX / y;
      //y += x * incY / y;
    }

    //moving around the center of the screen
    if (moveV == 4) {
      //int radius = sqrt(centerx * centerx)
      float t = millis()/1000.0f;
      this.x = (int)(C_X+ radius * cos(t));
      this.y = (int)(C_Y+ radius * sin(t));
      //if(this.x >= 1000) this.x = -this.x;
      //if(this.y >= 800) this.y = -this.y;
    }
  }

  @Override
    void display() {
    // RUOSHUI
    super.display();
    image(eye, x + 10, y + 10, 50, 50);
  }
}
