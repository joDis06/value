/**
 * SNAKE GAME
 * Rules:
 *     Eat the food
 *     Do not bite your own tail
 *     Do not hit a wall
 * Specifications:
 *     The snake grows when eat food
 *     The speed increases when the snake grows
 *     Food is displayed randomly
 */

// global variables
ArrayList<PVector> snake = new ArrayList<PVector>(); // snake body (not included the head)
PVector pos; // snake position (position of the head)
StringList mode_list = new StringList(new String[] {"border", "no_border"}); // if you implement both functionalities
int mode_pos = 1; // mode 1 by default - if hits wall wraps around
String actual_mode = mode_list.get(mode_pos); // current mode name
PVector food; // food position

PVector dir = new PVector(0, 0); // snake direction (up, down, left right)

int size = 40; // snake and food square size
int w, h; // how many snakes can be allocated

int spd = 16; // reverse speed (smaller spd will make the snake move faster)
int len = 0; // snake body

void setup() {
  size(1080, 720);
  w = width/size;
  h = height/size;

  pos = new PVector(w,h); // Initial snake position
  newFood(); // create 2D vector

  //noStroke();
  fill(0);
}

void draw() {
  background(#EEFAED);
  drawSnake();
  drawFood();


  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if (frameCount % spd == 0) {
    updateSnake();
  }
  
  //while (len >= 4 && len % 4 == 0 && spd >=1) {
  //  spd-=1;
  //  len+=1;
  //  break;
  //}
}

// draw the food item (square) which size is tha variable size
void drawFood() {
  fill(255, 0, 0);
  rect(food.x, food.y, size, size);
}

// declare a new pVector (random) for food
void newFood() {
  food = new PVector(random(1040), random(680));
}

// draw snake, consider the snake array size (each square of size size) + square of the current pos
void drawSnake() {
  fill(#278953);
  rect(pos.x, pos.y, size, size);
  //int posx = int(pos.x);
  //int posy = int(pos.y);
  for (int i = 0; i < snake.size(); i++) {
    rect(snake.get(i).x, snake.get(i).y, size, size);
  }
  
  
}

void updateSnake() {
  //Add current position to snake ArrayList
  
  snake.add(new PVector(pos.x,pos.y));
  System.out.println(snake.get(0));
  //Check the size of snake. Remove some items from snake ArrayList if needed
  while (len < snake.size()) {
    snake.remove(0);
  }

  //Calculate new position of snake (head)
  pos.add(dir);
  //If snake (head) hits food, add +1 to the snake size and create a new food
  if (food.x - size < pos.x && pos.x < food.x+size &&
      food.y - size < pos.y && pos.y < food.y+size) {
    //if (food.x == pos.x && food.y == pos.y) {
    len += 1;
    newFood();
  }
  //If snake (head) eat itself, gameover, reset()
  for (int i = 0; i < snake.size(); i++) {
    if (snake.size() >= 1 && pos.x == snake.get(i).x && pos.y == snake.get(i).y) {
    reset();
  }
  }

  //If mode 'no_border', snake is out of screen, wraps around
  //If mode 'border', when snake hit a border, gameover, reset()
  // default border mode :)
  if (pos.x >= 1100 || pos.x <= -40 || pos.y >= 750 || pos.y <= -40) {
    reset();
  }
  
  
}

void reset() {
  spd = 20;
  len = 0;
  pos = new PVector(w,h);
  dir = new PVector(0, 0);
  newFood();
  snake = new ArrayList<PVector>();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reset();
  }

  if (keyCode == UP) {
    dir = new PVector(0, -800/spd);
  }

  if (keyCode == DOWN) {
    dir = new PVector(0, 800/spd);
  }

  if (keyCode == LEFT) {
    dir = new PVector(-800/spd, 0);
  }

  if (keyCode == RIGHT) {
    dir = new PVector(800/spd, 0);
  }
  
  if (key == '+' || key == '=') {
    size +=10;
    //reset();
  }
  
  if (key == '-' || key == '_') {
    size -=10;
    //reset();
  }
  
  if (key == 's' || key == 'S') {
    spd -=1;
  }

  // if UP is pressed => dir = new PVector(...)
  // same thing for DOWN, LEFT, RIGHT
  // UP (0, -1)
  // DOWN(0, 1)
  // LEFT(-1,0)
  // RIGHT(1,0)
  // if '+' is pressed, increase the size of the squares (and recalculate w and h)
  // same thing for '-'
  // when 'm' is pressed, change the mode -> ONLY IF YOU IMPLEMENT BOTH MODES
}
