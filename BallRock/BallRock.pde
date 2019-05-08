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
  
  Rock(float x, float y) {
    super(x, y);
    if (floor(random(2)) == 1) {
      img = loadImage("rock2.png");
    } else {
      img = loadImage("rock.png");
    }
      
  }
  

  void display() {
    //fill(220, 220, 220);
    //rect(x, y, 10.0, 10.0);
    //rect(x, y, 20.0, 20.0, 5);
    image(img, x, y, 50, 50);
    
  }
}

public class LivingRock extends Rock implements Moveable {
  float incrementX, incrementY;
  int moveV;
  LivingRock(float x, float y) {
    super(x, y);
    moveV = (int) random(5);
    incrementX = random(10);
    incrementY = random(10);
  }
  
  void move() {
    /* ONE PERSON WRITE THIS */
    /*
    this.x += random(5);
    this.y += random(5);
    */
    
    if(moveV == 0){ //moving horizontally
      this.x += incrementX;
      if(this.x >= 1000) this.x = 0;
    }
    
    if(moveV == 1){ //moving vertically
      this.y += incrementY;
      if(this.y >= 800) this.y = 0;
    }

    if(moveV == 2){ //move diagonally, bouncing
      this.x += incrementX;
      this.y += incrementY;
      if(this.x >= 1000) incrementX *= -1;
      if(this.x <= 0) incrementX *= -1;
      if(this.y >= 800) incrementY *= -1;
      if(this.y <= 0) incrementY *= -1;
    }
    
    if(moveV == 3){ //bouncing up and down
      if(this.x >= 1000) this.x = 0;
      if(this.y >= 800){
        incrementY *= -1;
        this.x += 50;
      }
      if(this.y <= 0){
        incrementY *= -1;
        this.x += 50;
      }
      this.y += incrementY;
    }
    
    //moving around the center of the screen
    if(moveV == 4){
      float centerx, centery;
      centerx = 500;
      centery = 400;
        float t = millis()/1000.0f;
        this.x = (int)(centerx+100*cos(t));
        this.y = (int)(centery+100*sin(t));
      //if(this.x >= 1000) this.x = -this.x;
      //if(this.y >= 800) this.y = -this.y;
    }
    
    
  }
  @Override
  void diplay() {
    super.display();
    
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
