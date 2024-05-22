static final int SQUARE_SIZE = 100;
int [][]gridColors;
int color0 = 0;
int color1 = 255;
int sqColor = 133;

void setup() {
  size(815, 672);
  // grid size [int[width/SQUARE_SIZE]][[height/SQUARE_SIZE]]
  gridColors = new int[][] { {0, 1, 0, 1, 0, 1, 1, 0},
                             {1, 0, 1, 0, 1, 0, 1, 1},
                             {1, 1, 1, 1, 1, 1, 1, 1},
                             {0, 0, 0, 0, 0, 0, 1, 0},
                             {1, 1, 0, 0, 1, 1, 1, 0},
                             {1, 0, 1, 1, 1, 0, 1, 0}
                           };

}

void draw() {
   grid();
   mouseClicked();
}


/* Draw squares in your frame
   Add border to your squares, so it looks like a grid
   Choose two colors to fill your squares color0, color1
   If the cell in gridColors has the value 0, use the color0 for the corresponding square.
   If the cell in gridColors has the value 1, use the color1 for the corresponding square.
 */
void grid() {
  int x = 0;
  int y = 0;
  // rank 
  for ( int i = 0; i < gridColors.length; i++ ) {
    for (int j = 0; j < gridColors[i].length; j++ ) {
      if ( gridColors[i][j] == 0 ) {
        fill(color0);
        rect(x,y,SQUARE_SIZE,SQUARE_SIZE );
        x+=100;
      }
      else {
        fill(color1);
        rect(x,y,SQUARE_SIZE ,SQUARE_SIZE );
        x+=100;
      }
    }
    x=0;
    y+=100;
  }
}

/* If you click on a square is should change the color (color0  to color1 or color1 to color0)
HINT: Select the square based on the position of the mouse 
*/
void mouseClicked() {
  //
  
  
  
}
