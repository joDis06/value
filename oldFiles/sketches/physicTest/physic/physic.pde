float xDis,yDis,xAccel,yAccel,xInVel,yInVel,xFinVel,yFinVel,time;
boolean[] keys;

void setup() {
 size(1024,800);
 frameRate(60);
 //keys
 keys = new boolean[5];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
 
 //displacement
 xDis = 0;
 yDis = 0;
 //acceleration
 xAccel = 0;
 yAccel = -9.8;
 //initial velocity
 xInVel = 0;
 yInVel = 0;
 //final velocity
 xFinVel = 0;
 yFinVel = 0;
 // time
 time = 0;
 
  
  
}

void draw() {
 background(#DEE8E7);
 updateTime(); 
 gravity();
 move();
 reset();

 
 sillySq();
  
}

void sillySq() {
 fill(0,122,0);
 rect(xDis,yDis,50,50);
 
  
  
}

void updateTime() {
  time = frameCount/60; 
  System.out.println("Time is " + time);
}

void gravity() {
  if (yDis < 600) {
  yDis -= (yInVel * time) + (.5 * (yAccel * Math.pow(time,2)));
  }
  
  if (yDis == 600) {
   time = 0; 
  }
  
}

void move() {
 if (keys[0] && (keys[1] == false) 
              && (keys[2] == false) 
              && (keys[3] == false)) {
   yDis-=10; 
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == false)) {
   yDis+=10; 
  }
  
  if (keys[2] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[3] == false)) {
   xDis-=10; 
  }
  
  if (keys[3] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[2] == false)) {
   xDis+=10; 
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   yDis-=10;
   xDis-=10;
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   yDis-=10; 
   xDis+=10;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   yDis+=10; 
   xDis-=10;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   yDis+=10; 
   xDis+=10;
  } 
  
}

void reset() {
  if (keys[4]) {
 xDis=0;
 yDis=0;
 time=0;
  }
}



void keyPressed() {
      if (key=='w') //0
        keys[0]=true;
      if (key=='s') //1
        keys[1]=true;
      if (key=='a') //2
        keys[2]=true;
      if (key=='d') //3
        keys[3]=true;  
      if (key=='r') //reset
        keys[4]=true;
    }
    
void keyReleased() {
      if (key=='w')
        keys[0]=false;
      if (key=='s')
        keys[1]=false;
      if (key=='a')
        keys[2]=false;
      if (key=='d')
        keys[3]=false; 
      if (key=='r') //reset
        keys[4]=false;
   } 
