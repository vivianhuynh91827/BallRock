final int MAX_WIDTH = 1000;
final int MAX_HEIGHT = 800;

interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}



class Rock extends Thing {
  PImage img;

  final PImage[] ROCK_IMGS = new PImage[] {
    loadImage("rock.png"), 
    loadImage("rock2.png"), 
  };
  final PImage EYE_IMG = loadImage("eyes.png");

  Rock(float x, float y) {
    super(x, y);
    img = ROCK_IMGS[floor(random(2))];
  }


  void display() {
    //fill(220, 220, 220);
    //rect(x, y, 10.0, 10.0);
    //rect(x, y, 20.0, 20.0, 5);
    image(img, x, y, 50, 50);
  }
}

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
    /* ONE PERSON WRITE THIS */
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
    super.display();
    image(eye, x + 10, y + 10, 50, 50);
  }
}


class Ball extends Thing implements Moveable {
  //int n;
  //String movement;
  int col;
  PImage i ;
  int randMove;
  int mode;
  float r;
  float b;
  float g;

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
    g = random (255);
    b = random (255);

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
    }
    else if (mode == 0) {
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
    }
    else if (randMove == 1) {//moving vertically
      y += direc*2;
    }
    else if (randMove == 2) { //moving diagonally
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

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
PImage img;
PImage img1;
int randMode = (int) random(3);
int randImg = (int) random(2);
void setup() {
  size(1000, 800);
  img = loadImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/220px-Basketball.png");
  img1 = loadImage("https://mikasasports.com/wp-content/uploads/2015/04/MVA2001.png");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    if (randMode == 2) {
      if (randImg == 0) {
        Ball b = new Ball(50+random(width-100), 50+random(height-100), img, 2);
        thingsToDisplay.add(b);
        thingsToMove.add(b);
      }
      else {
        Ball b = new Ball(50+random(width-100), 50+random(height-100), img1, 2);
        thingsToDisplay.add(b);
        thingsToMove.add(b);
      }
    }
    else if (randMode == 1) {
      Ball b = new Ball(50+random(width-100), 50+random(height-100), 1);
      thingsToDisplay.add(b);
      thingsToMove.add(b);
    }
    else {
      Ball b = new Ball(50+random(width-100), 50+random(height-100), 0);
      thingsToDisplay.add(b);
      thingsToMove.add(b);
    }
    //Ball b = new Ball(50+random(width-100), 50+random(height-100));

    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}
