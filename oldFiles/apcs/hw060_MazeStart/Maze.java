/**
  Represent a Maze
  
  A "MazeTerminal" is...
    o  a wall element; or
    o  a treasure; or
    o  a stepping stone.
  
  A "Maze" is...
    o  a MazeTerminal; or
    o  a stepping stone with a Maze as any of its 4 neighbors
 */
import java.util.Scanner;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MaximizeAction;

public class Maze {

    // MazeTerminal named constants
    public final static int TREASURE = 3;
    public final static int WALL = 1;
    public final static int STEPPING_STONE = 0;
    
    // directions that can be searched
    public final static int EAST =  1;
    public final static int NORTH = 2;
    public final static int WEST =  4;
    public final static int SOUTH = 8;
       /* Values are pretty arbitrary. Values of 2^n might be useful
          in the unlikely event that we ever want to add north-west, etc.:
          2+4 --> 6  */
    
    private int[][] maze;
    private final static int MAX_RANKS = 64;
    private int rankCount;  // number of ranks in a constructed Maze

    /**
      Construct an instance from the contents of a file.
     */
    public Maze( String sourceFilename
               ) throws java.io.FileNotFoundException {

        // Construct the maze array one rank at a time
        maze = new int[ MAX_RANKS][];

        for( int filler = 0; filler < MAX_RANKS; filler++)
          maze[ filler] = new int[] {-1};


        Scanner sc = new Scanner( new java.io.File( sourceFilename));
        sc.useDelimiter("");  // Whitespaces are data, not delimiters.

        // process the maze file
        while( sc.hasNextLine() ) {
            int rank = rankCount++;
            /* So rankCount == last rank +1, as usual.
               That is, rankCount is one larger than the number of
               the last-used rank.
             */
            String line = sc.nextLine();
            System.out.println( "line, for debugging |" + line + "|");
            
            maze[ rank] = new int[ line.length()];

            // Convert the input line into maze elements.
            for( int file = 0; file < line.length(); file++ ) {
                 if (line.substring(file, file + 1).equals("0")) {
                  maze[rank][file] = TREASURE;

                 }
                 else if (line.substring(file, file + 1).equals("*")) {
                  maze[rank][file] = STEPPING_STONE;

                 }
                 else if (line.substring(file, file + 1).equals(" ")) {
                  maze[rank][file] = WALL;
                 }
                }
            }
        }
    


    /**
      @return a string representing of this instance
     */
    public String toString() {

      int toCheck = 0;
      for( int currRank = 0; currRank < maze.length; currRank++) {
          System.out.println( maze[currRank][0]);
          if( maze[currRank][0] >= 0)
              toCheck += 1;
          else
              break;
      }


        // build string for top and bottom separators
        String aboveAndBelow = "";
        for (int mazeLength = 0; mazeLength < maze[0].length + 2; mazeLength++) {
          aboveAndBelow += "-";
        }
        
        String result = aboveAndBelow + System.lineSeparator();
        
        // process maze[][]
        for (int rank = 0; rank < toCheck; rank++) {
          result += "|" ;

          for ( int file = 0; file < maze[rank].length; file++) {
            // System.out.println(maze[0][3]);
            result += maze[rank][file] ;

          }

          result += "|" + System.lineSeparator();
        }

        return   result + aboveAndBelow;
    }
}
