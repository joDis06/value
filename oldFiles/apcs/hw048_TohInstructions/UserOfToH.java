/**
   Exercise the ToH class
 */
public class UserOfToH {
    /**
       Commmand line arguments are optional, but if used,
       they must appear in this order:
       0. number of disks
       1. source spike name
       2. target spike name
       3. name of spare spike

       For example,
          java UserOfToH 3 Hanoi HCMC "Da Nang"
     */
    public static void main( String[] commandLine) {

        //
        System.out.println(
            System.lineSeparator()
          + "Moves, for various problems"
          + System.lineSeparator()
          // +
          );

        // base case only
        ToH baseCaseOnly = new ToH( // stub with wrong values
                                    4
                                  , "alpha  "
                                  , "bravo  "
                                  , "charlie"
                                  );
        oneTest( "just the base case"
               , baseCaseOnly
               );

        // the smallest recursive case
        ToH smallestRecursiveCase = new ToH( // stub with wrong values
                                             2
                                           , "alpha  ", "bravo  ", "charlie"
                                           );
        oneTest( "smallest recursive case"
               , smallestRecursiveCase
               );


        // The classic 3 cities with 3 disks provides
        // a larger recursive case,
        ToH classic = new ToH( 3
                             , "Kingman"
                             , "Barstow"
                             , "Berdoo "
                             );
        oneTest("classic 3 disks", classic);
                            
        // oneTest( "classic 3 cities with 3 disks"
               // , classic
               // );

        // // Accepting problems from the command line makes it easy
        // // to play with the program.
        // if( commandLine.length > 0) {
            // ToH commanded = new ToH( Integer.parseInt( commandLine[0])
                                   // , commandLine[1]
                                   // , commandLine[2]
                                   // , commandLine[3]
                                   // );
            // oneTest( "command-line request"
                   // , commanded
                   // );
        // }
    }


    /**
       run one test
     */
    private static void oneTest( String description
                               , ToH toh
                               ) {
        System.out.println( description);
        toh.generateAllMoves();
        System.out.println( toh
                          + System.lineSeparator());
     }

}