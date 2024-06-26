/**
   Exercise the RaggedRoom class
 */
public class UserOfRaggedRoom {
    public static void main( String[] commandLine) {


        // test converting the command line to an array of ints
        System.out.println(
                System.lineSeparator()
              + "----- command line arguments -----"
              );
        int[] junk = intArrayify( commandLine);
        System.out.println( "count: " + junk.length);
        for( int index : junk)
            System.out.println( junk[ index]
                              + 0  // make sure its an int, not a String
                              );


        // default room
        RaggedRoom room307 = new RaggedRoom();
        room307.setId("307");
        System.out.println(
                System.lineSeparator()
              + "----- room " + room307.getId()
              + ", the default room configuration -----"
              + System.lineSeparator()
              + room307
              );


        // // see a room with file lengths from command line
        // RaggedRoom aRoom = new RaggedRoom( intArrayify( commandLine));
        // System.out.println(
                // System.lineSeparator()
              // + "----- room with file lengths from command line -----"
              // + System.lineSeparator()
              // + aRoom
              // );


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
        for( int offset : ints)
            ints[ offset] =
              Integer.parseInt( strings[ offset]);
        return ints;
    }
}
/*
 private static int[] intArrayify( String[] strings) {
        int[] ints = new int[ strings.length];
        for( int i : ints) ints[i] = Integer.parseInt( strings[i]);
        return ints;
    } 
 
  
 
  
 */