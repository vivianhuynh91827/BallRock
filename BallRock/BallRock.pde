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
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    /* ONE PERSON WRITE THIS */
  }
}

class Ball extends Thing implements Moveable {
  int n;
  String movement;
  int col;
  
  Ball(float x, float y) {

    super(x, y);
  }
  
  Ball(float x, float y, int sides, String move) {
     super(x,y);
     n = sides;
     movement = move;
     col = int(random(255));
  }

  void display() {
    /* KAYLA */
    float prevX = x;
    float prevY = y;
    fill(col, col, col);
    ellipse(x, y, 10, 10);
    //rect(x, y, 34, 34);
    image(img, x, y, 50, 50);
    //for (int a = 0; a < n; a++) {
    //  line(prevX, prevY, );
    //}
    
  }

  void move() {
    /* VIVIAN */
    if ((x < width) && (y < height)) {
      x += random(2);
      y += random(2);
    }
    else {
      x -= random(8);
      y -= random(8);
    }
    
    
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
PImage img;
void setup() {
  size(1000, 800);
  img = loadImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/220px-Basketball.png");
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