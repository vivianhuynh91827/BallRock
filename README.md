# BallRock

## Roles
### Rock
- Display: Ruoshui Mao
- Move: Tiffany Cao
### Ball
- Display: Kayla
- Move: Vivian

## Change log
### 5/6/19:
Rock

- Tiffany played around with the movements, testing different increments and directions of movements.
- Ruoshui worked on displaying the rock object in the shape of a rectangle, adjusting the sizes and locations.

Ball

- Kayla created a simple shape and added color for Display.
- Vivian made the shape move randomly.


### 5/7/19:

Rock

- Ruoshui and Tiffany worked on importing images into the code, adjusting the size of the image. Two rock images were chosen and the rock constructor can randomly pick between the two images.
- Tiffany worked on the move method and adjusted the constructor so that the rock objects choose a random movement pattern. The move method was changed to accommodate the choosing of different moving patterns.
We used some references from this website: https://processing.org/discourse/beta/num_1264000877.html to write the movement pattern for a circle.

Ball

- Kayla imported two different images and set their sizes. The balls would choose a random color, movement, and currently, image as well (This would change when we add the simple/complex).  The ball stays in bounds but can only move horizontally, vertically, and diagonally.
image: https://processing.org/reference/image_.html

### 5/8/19:

Rock

- Tiffany added some features to the move method in regards to the wrapping of the screen and what happens when the object moves out of the screen. She also fixed the circle path code that makes the objects orbit in a circle around the center.
- Tiffany and Ruoshui played around with the increment speeds, using the x and y values.

Ball

- Kayla tried to create random modes (randomly choose between simple/complex/image). Kayla also tried to code choosing random images as well.  It is still in progress.


### 5/11/19:

Ruoshui - Merge Ball and Rock branch into master and resolves many merge conflicts.

<<<<<<< HEAD
5/11/19:
Kayla - I created two subclasses: RealBall and FakeBall.  The simple shapes for each are labeled "F" and "R" to make them easier to differentiate.  Each subclass should have their own simple and complex shapes as well as two images to randomly choose from.
=======
Kayla - I created two subclasses: RealBall and FakeBall.  The simple shapes for each are labeled "F" and "R" to make them easier to differentiate.
>>>>>>> 3c16b37b9a45ce13ea7de31b8661b078380da4f5
text: https://processing.org/reference/text_.html

Vivian - I made the FakeBalls just bounce around the screen. I attempted to have the RealBalls move in a large parabolic motion but it didn't work as planned but they kind of bounce off the air(??). Make balls check for collision. When colliding, they reverse their direction.

Tiffany - I implemented Collideable for Living Rocks and made it so that everytime a Living Rock collided with another Collideable object, it would change it's moving direction and change its image. I also fixed the move method because some Living Rocks would not move at all.

Ruoshui - Minor changes to code. Make objects easier to collide. Use CENTER for image mode.
