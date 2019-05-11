class Rock extends Thing implements Collideable {
  PImage img;

  Rock(float x, float y) {
    super(x, y);
    img = ROCK_IMGS[floor(random(2))];
  }
  
  boolean isTouching(Thing other) {
<<<<<<< HEAD
    if(this.x == other.x && this.y == other.y){
      return true;
    }else return false;
=======
    return false;
>>>>>>> b23a117f4d021a2ef11c1c31c5a7fbc5e09e1bde
  }

  void display() {
    //fill(220, 220, 220);
    //rect(x, y, 10.0, 10.0);
    //rect(x, y, 20.0, 20.0, 5);
    image(img, x, y, 50, 50);
  }
}
