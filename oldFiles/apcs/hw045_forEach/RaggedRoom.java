/**
   Represent a room whose file sizes vary

   meanings of...
      persons: a reference to an array of references to
               an array of integers.
      persons[3]
      persons[3][2]
 */
public class RaggedRoom {

    // person number at a particular file and rank
    private int[][] persons;
    private int roomId;


    // ---------------- toString methods ----------------
    /**
       The method allows the programmer to easily switch
       between variants.
       @return a string representation of this instance
     */
    public String toString() {
        return toString_personsOnly();
        // return toString_fileAndRankNumbers();
    }


    /**
       @return a string representation of this instance
               limited to the numbers that are the content
               of the "persons" array

       Answer these questions first, to make the programming easier.
       If you do this carefully, writing the for-each loops will be
       significantly easier.

       The value stored in the memory named "persons" is
       <your good English here>.

       The value stored in the memory at persons[2] is
       <your good English here>.

       To declare a variable named "x" that can hold
       the value stored in the memory at persons[2],
       a Java programmer writes
       <your Java code here>

       In your program, where you would be embarrassed for anyone
       to see the name "x", you will instead
       the value stored in the memory at persons[2]
       <your perspicuous name here>
     */
    public String toString_personsOnly() {
        String result;
        result =   "number of files: "
                 + persons.length + System.lineSeparator()
                 ;
        // for each file...
        for( int file = 0; file < persons.length; ++file ){
           // for each person number in this file
           for( int rank = 0; rank < persons[file].length; ++rank)
               result += persons[file][rank] + "  ";

            result += System.lineSeparator();
        }
        return result;
    }

    // /**
       // @return a string representation of this instance
               // with file and rank numbers

       // based heavily on work contributed by Zidane of pd 2,
       // in Piazza@241
     // */
    // public String toString_fileAndRankNumbers() {
        // String result;
        // result =   "number of files: "
                 // + persons.length + System.lineSeparator()
                 // + "files" + System.lineSeparator()
                 // ;
        // // show each file, with its number, ranks, and persons
        // for( int file = 0; file < persons.length; ++file ){
            // result += file + "    ranks:  ";

            // // show each rank number in this file
            // for( int rank = 0; rank < persons[file].length; ++rank)
                // result +=  rank + "  ";

           // // show each person number in this file
           // result += System.lineSeparator() + "     person: ";
           // for( int rank = 0; rank < persons[file].length; ++rank)
               // result += persons[file][rank] + "  ";

            // result += System.lineSeparator() + System.lineSeparator();
        // }
        // return result;
    // }


// -------------  accessors  -------------

    /**
       setId
       Set the room's ID
       
       code by Joseph of pd1, from Piazza@259
     */
    public /* instance */ void setId( String roomID) {
        this.roomId = Integer.parseInt(roomID);
    }

    /**
       getId
       @return the room identifier
       
       code by Joseph of pd1, from Piazza@259
     */
    public /* instance */ String getId() {
        return roomId + "";
    }


    /**
       maxPersonNumber
       @return the largest person number in the room

       courtesy of Sophia of pd2 via Piazza
     */
    public /* instance */ int maxPersonNumber() {
        int[] lastFile = persons[persons.length - 1];
        int lastPerson = lastFile[lastFile.length - 1];

        return lastPerson;
    }


    /**
       file
       @return the file that holds the "personNumber"
       contract: method to be invoked with
                 0 =< "personNumber" <= maxPersonNumber

       courtesy of Sophia of pd2 via Piazza
     */
    public /* instance */ int file( int personNumber) {
        for (int file = 0; file < persons.length; ++file)
            for (int rank = 0; rank < persons[file].length; ++rank)
                if (persons[file][rank] == personNumber) return file;
        return -1;
    }


    /**
       rank
       @return the rank that holds the "personNumber"
       contract: method to be invoked with
                 0 =< "personNumber" <= maxPersonNumber

       courtesy of Sophia of pd2 via Piazza
     */
    public /* instance */ int rank( int personNumber) {
        int file = file ( personNumber);
            for (int rank = 0; rank < persons[file].length; ++rank)
                if (persons[file][rank] == personNumber) return rank;
        return -1;
    }


// -------------  constructors -------------

    /**
      Construct an instance
      with the given "fileLengths"
     */
    public RaggedRoom( int[] fileLengths) {
        persons = new int[fileLengths.length][];

        for( int file = 0; file < fileLengths.length; ++file)
            persons[ file] = new int[ fileLengths[ file]];

        populate();
    }


    /**
      Construct an instance
      with magic numbers matching room 307. Ugh.
     */
    public RaggedRoom() {

        // original construction of a ragged array
        // persons = new int[5][];

        // persons[0] = new int[8];
        // persons[1] = new int[6];
        // persons[2] = new int[6];
        // persons[3] = new int[7];
        // persons[4] = new int[7];

        // populate();


        // /* construct an array of "fileLengths" suitable 
           // for the constructor that takes a int[] param */
        // int[] fileLengths = new int[5];
        // fileLengths[0] = 8;
        // fileLengths[1] = 6;
        // fileLengths[2] = 6;
        // fileLengths[3] = 7;
        // fileLengths[4] = 7;
        // this( fileLengths);
        // /* compiler error:
             // ./RaggedRoom.java:179: error: call to this must be first statement in constructor
                     // this( fileLengths);
        // */

        /* construct an array of "fileLengths" in an expression 
           in the first statement, as part of invoking the
           constructor that takes a int[] param */
        this(new int[]{8, 6, 6, 7, 7});
    }


    /**
      square room
     */
    public RaggedRoom( int extent) {
        this( extent, extent);
    }


    /**
      Construct an instance
      representing a rectangular room.
     */
    public RaggedRoom( int files, int ranks) {
        persons = new int[files][ranks];
        populate();
    }


    /**
       Populate the "persons" array with consecutive
       person numbers, starting at 0.

       courtesy of Zidane of pd 2, in Piazza@241
     */
    private  /* instance */ void populate() {
        int personNumber = 0;
        for( int file = 0; file < persons.length; ++file )
            for( int rank = 0; rank < persons[file].length; ++rank)
                persons[file][rank] = personNumber++;
    }
}