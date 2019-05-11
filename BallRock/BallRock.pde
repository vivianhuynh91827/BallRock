
final int MAX_WIDTH = 1000;
final int MAX_HEIGHT = 800;

interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

PImage[] ROCK_IMGS;
PImage EYE_IMG;
PImage[] BALL_IMGS;

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);
  
  // Init Images. No way around this.
  BALL_IMGS = new PImage[] {
    loadImage("basketball.png"), 
    loadImage("volleyball.png"), 
    loadImage("orange.png"), 
    loadImage("emoji.png"), 
  };
  ROCK_IMGS = new PImage[] {
    loadImage("rock.png"), 
    loadImage("rock2.png"), 
  };
  EYE_IMG = loadImage("eyes.png");
  
  
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 7; i++) {
    FakeBall fb = new FakeBall(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(fb);
    thingsToMove.add(fb);

    RealBall rb = new RealBall(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(rb);
    thingsToMove.add(rb);
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
