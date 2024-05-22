/**
 Jo Disomma 
  hw061
  worked with Joshua Wong 
  advised by no one

  Test MazeWithExplorer class.
  
  Requires command line argument:
  o  the name of a file containing a maze.
  o  the position at which an explorer starts

  For example,
      java TesterOfMazeWithExplorer mazes/4cell_treasureWest.txt 0 0
      java TesterOfMazeWithExplorer mazes/1_treasure.txt  0 0
      java TesterOfMazeWithExplorer mazes/1_wall.txt      0 0
      java TesterOfMazeWithExplorer mazes/1_stepStone.txt 0 0
      
      Bigger tests, with different MazeTerminals
      java TesterOfMazeWithExplorer mazes/16x32.txt 31 15
      java TesterOfMazeWithExplorer mazes/16x32.txt 30 15
      java TesterOfMazeWithExplorer mazes/16x32.txt 31 14
 */

public class TesterOfMazeWithExplorer {
    public static void main(String[] commandLine)
       throws java.io.FileNotFoundException {
        System.out.println();

        MazeWithExplorer mazeWEx =
        new MazeWithExplorer( commandLine[0]
                            , Integer.parseInt( commandLine[1])
                            , Integer.parseInt( commandLine[2])
                            );
        System.out.println( mazeWEx);

        // test explorerIsOnA
        System.out.println( "explorer is on a "
                          + mazeWEx.explorerIsOnA()
                          + System.lineSeparator());
    }
}
