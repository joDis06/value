/**
 Jo Disomma 
 Hw060
 worked with Joshua Wong, Gabriel Hyun
 advised by --
  
  Test Maze class.
  
  Requires command line argument:
  o  the name of a file containing a maze.

  For example,
      java UserOfMaze mazes/4cell_treasureWest.txt
 */

public class UserOfMaze {
    public static void main(String[] commandLine)
       throws java.io.FileNotFoundException {
        System.out.println();

        Maze maze = new Maze( commandLine[0]
                            );
        System.out.println( maze + System.lineSeparator());
    }
}
