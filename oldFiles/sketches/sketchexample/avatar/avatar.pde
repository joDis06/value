int x,y;
int animation = 1;
void setup() {
 size(800,800, P3D);
 background(#CDEAF5);

}

void animation() {
   if (animation == 1) {
  resetting();
 }
 else if (animation == 2) {
   //
 }
 else if (animation == 3) {
   //
 }
 else if (animation == 4) {
   //
 }
}

void draw() {
   background(#CDEAF5);
  avatar();
  mousePos();
  animation();
  
}

void avatar() {
 Head();
 Eyes();
 Arms();
 Feet();
 EyeDetail();
 blush();
}
void Head() {
  fill(#efb6d4);
  noStroke();
  lights();
  spotLight(255, 255, 255, 450, 470, 0, -1, 0, 0, PI/2, 2);
  translate(x+400,y+400,0);
  sphereDetail(32);
  sphere(112);
}

void Eyes() {
  fill(0);
  noStroke();
  translate(x-20,y-25,200);
  ellipse(10,25,20,50);
  ellipse(50,25,20,50);
}

void Arms() {
  fill(#efb6d4);
  noStroke();
  lights();
  translate(-70,55,-130);
  sphereDetail(16);
  sphere(30);
  
  fill(#efb6d4);
  noStroke();
  lights();
  translate(190,5,-60);
  sphereDetail(16);
  sphere(30);
}

void Feet() {
  fill(#C65465);
  noStroke();
  lights();
  translate(-140,60,30);
  sphereDetail(16);
  sphere(35);
  
  fill(#C65465);
  noStroke();
  lights();
  translate(90,0,-10);
  sphereDetail(16);
  sphere(35);
  
  
}

void EyeDetail() {
  fill(#131243);
  translate(-60,-90,200);
  ellipse(0,0,15,30);
  
  fill(#131243);
  translate(38,0,0);
  ellipse(0,0,15,30);
  
  fill(#F5F5FA);
  translate(0,-16,10);
  ellipse(0,0,8,16);
  
  fill(#F5F5FA);
  translate(-36,0,10);
  ellipse(0,0,8,16);
}

void blush() {
 fill(#DE6E8A); 
 translate(-14,32,100);
 ellipse(0,0,20,5);
 
 fill(#DE6E8A); 
 translate(57,0,0);
 ellipse(0,0,20,5);
  
} 

void mousePos() {
  frameRate(60);
  x = mouseX/20-10;
  y = mouseY/20-20;
}

void resetting() {
 if ( y != 400 ) {
   y++;
 } else {
   y = -400;
 }
}
