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

public static enum LvRockType {
  LN, // Line
  CIRCLE, // circle
}

public class LivingRock extends Rock implements Moveable {
  float x_inc, y_inc;
  
  // automatically assigned
  PImage eye = EYE_IMG;
  
  LvRockType mvType;
  
  
  
  LivingRock(float x, float y) {
    super(x, y);
    x_inc = random(5);
    y_inc = random(10);
    mvType = LvRockType.LN;//LvRockType.values()[floor(random(LvRockType.values().length))];
  }
  void move() {
    /* ONE PERSON WRITE THIS */
    /*
    this.x += random(5);
    this.y += random(5);
    */
    
    // bouncing behavior
    if(x >= MAX_WIDTH - 50 || x <= 0) x_inc *= -1;
    if(y >= MAX_HEIGHT - 50 || y <= 0) y_inc *= -1;
        
    switch (mvType) {
      case LN: //straight path
      x += x_inc;
      y += y_inc;
      break;
    
      case CIRCLE: //moving in an arc
      float centerx, centery;
      centerx = this.x + 10;
      centery = this.y + 10;
      float radius = 10.0;
      float t = millis()/1000.0f;
      this.x = (int)(centerx+radius*cos(t));
      this.y = (int)(centery+radius*sin(t));
      break;
    }
  }
  @Override
  void display() {
    super.display();
    image(eye, x + 10, y + 10, 50, 50);
  }
  
      
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
  }

  void move() {
    /* ONE PERSON WRITE THIS */
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
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
