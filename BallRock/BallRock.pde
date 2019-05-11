final int MAX_WIDTH = 1000;
final int MAX_HEIGHT = 800;

interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

final PImage[] ROCK_IMGS = new PImage[] {
  loadImage("rock.png"), 
  loadImage("rock2.png"), 
};
final PImage EYE_IMG = loadImage("eyes.png");

final PImage[] BALL_IMGS = new PImage[] {
  loadImage("basketball.png"),
  loadImage("volleyball.png"),
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

int randMode = (int) random(3);
int randImg = (int) random(2);
void setup() {
  size(1000, 800);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    if (randMode == 2) {
      if (randImg == 0) {
        Ball b = new Ball(50+random(width-100), 50+random(height-100), img, 2);
        thingsToDisplay.add(b);
        thingsToMove.add(b);
      } else {
        Ball b = new Ball(50+random(width-100), 50+random(height-100), img1, 2);
        thingsToDisplay.add(b);
        thingsToMove.add(b);
      }
    } else if (randMode == 1) {
      Ball b = new Ball(50+random(width-100), 50+random(height-100), 1);
      thingsToDisplay.add(b);
      thingsToMove.add(b);
    } else {
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
