/**
   Exercise the RaggedRoom class

 Jo Disomma 
 Hw044
 worked with no one
 advised by no one 


 */
public class UserOfRaggedRoom {


  public String roomId ;
    public static void main( String[] commandLine) {

      


        // default room
        RaggedRoom room307 = new RaggedRoom();
        System.out.println(
                System.lineSeparator()
              + "----- room 307, the default room configuration -----"
              + System.lineSeparator()
              + room307
              + System.lineSeparator()
              + "------------ tests for getter and setter -----------"
              + System.lineSeparator()
              + "Get Id of room 307: " + room307.getId()
              );
              room307.setId("709");
              System.out.println(
              "Get Id of room 307 after Id changed to 709: " + room307.getId()
              );
              


        // // test converting the command line to an array of ints
        // int[] junk = intArrayify( commandLine);
        // System.out.println( "count: " + junk.length);
        // for( int index = 0; index < junk.length; ++index)
            // System.out.println( junk[ index]
                              // + 0  // make sure its an int, not a String
                              // );


        // // see a room with file lengths from command line
        // RaggedRoom aRoom = new RaggedRoom( intArrayify( commandLine));
        // System.out.println(
        //         System.lineSeparator()
        //       + "----- room with file lengths from command line -----"
        //       + System.lineSeparator()
        //       + aRoom
        //       );


        // // test accessor methods
        // int maxPersonNumber = aRoom.maxPersonNumber();
        // System.out.println(
                // "----- test accessor methods -----"
              // + System.lineSeparator()
              // + "maxPersonNumber: " + maxPersonNumber + System.lineSeparator()
              // + "file for person 0: " + aRoom.file( 0) + System.lineSeparator()
              // + "file for person 7: " + aRoom.file( 7) + System.lineSeparator()
              // + "file for last person: " + aRoom.file( maxPersonNumber)
              // + System.lineSeparator() + System.lineSeparator()
              // + "rank for person 0: " + aRoom.rank( 0) + System.lineSeparator()
              // + "rank for person 7: " + aRoom.rank( 7) + System.lineSeparator()
              // + "rank for last person: " + aRoom.rank( maxPersonNumber)
              // + System.lineSeparator()
              // // + ": " + aRoom.?? + System.lineSeparator()
              // );


         // // create and display a square room
        // System.out.println(
                // System.lineSeparator()
              // + "----- see a square room -----"
              // + System.lineSeparator()
              // + new RaggedRoom( 2)
              // );


         // // create and display a rectangular room
        // System.out.println(
                // System.lineSeparator()
              // + "----- see a rectangular room -----"
              // + System.lineSeparator()
              // + new RaggedRoom( 4, 3)
              // );
        }


    /**
       intArrayify
       @return a bunch of ints, converted from
               String representations of integers
     */
    private static int[] intArrayify( String[] strings) {
        int[] ints = new int[ strings.length];
        for( int index = 0; index < strings.length; ++index)
            ints[ index] =
              Integer.parseInt( strings[ index]);
        return ints;
    }
}
