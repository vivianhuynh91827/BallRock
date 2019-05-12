class Rock extends Thing implements Collideable {
  PImage img;

  Rock(float x, float y) {
    super(x, y);
    img = ROCK_IMGS[floor(random(2))];
  }

  boolean isTouching(Thing other) {
    if ((Math.abs(this.x - other.x) < 40) && (Math.abs(this.y - other.y) < 40)) {
      return true;
    } else return false;
  }

  void display() {
    //fill(220, 220, 220);
    //rect(x, y, 10.0, 10.0);
    //rect(x, y, 20.0, 20.0, 5);
    image(img, x, y, 50, 50);
  }
}
