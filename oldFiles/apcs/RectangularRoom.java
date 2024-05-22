/**
  YOUR HEADER HERE

  Calculcate files, ranks, and person-numbers
 */

public class RectangularRoom {

    public static void main(String[] commandLine) {
        fileAndRank( "First person"
                   , 0
                   , "file ?? rank ??"
                   );
        fileAndRank( "another front person"
                   , -1  // invalid value as stub
                   , "file ?? rank ??"
                   );
        fileAndRank( "a back-of-file person"
                   , -1  // invalid value as stub
                   , "file ?? rank ??"
                   );
        fileAndRank( "a typical person"
                   , -1  // invalid value as stub
                   , "file ?? rank ??"
                   );

        // test calculating person numbers
        personTest( "The first person"
                  , 0, 0   // file and rank
                  , 0      // expected person number
                  );
        personTest( "Another front person"
                  , -1, -1   // file and rank
                  , -1      // expected person number
                  );
        personTest( "A back-of-file person"
                  , -1, -1   // file and rank
                  , -1      // expected person number
                  );
        personTest( "A typical person"
                  , -1, -1   // file and rank
                  , -1      // expected person number
                  );
    }

    /**
      run one test of calculating file and rank
     */
    private static void fileAndRank( String description
                                   , int person
                                   , String expect
                                   ) {
        System.out.println( description);
        System.out.println( "Person " + person
                          + " belongs in " + expect
                          + " and is calculated to sit in"
                          + " file " + file( person)
                          + " rank " + rank( person)
                          + System.lineSeparator());
    }

    private static int file( int person) {
        return -1;  // wrong answer as stub
    }

    private static int rank( int person) {
        return -1;  // wrong answer as stub
    }


    /**
      run one test of calculating a person number
     */
    private static void personTest( String description
                                  , int file
                                  , int rank
                                  , int expect
                                  ) {
        System.out.println( description);
        System.out.println( " sits at"
                          + " file " + file
                          + " rank " + rank
                          + " where one expects to find person " + expect
                          + ". We calculated finding person "
                          + person( file, rank)
                          );
    }

    private static int person( int file, int rank) {
        return -1;  // wrong answer as stub
    }
}

