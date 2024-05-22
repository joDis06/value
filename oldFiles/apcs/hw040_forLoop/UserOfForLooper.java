/*
 Jo Disomma 
 hw040
 worked with nobody 
 advised by nobody

   Exercise the methods in the ForLooper class
 */
public class UserOfForLooper {

    public static void main( String[] commandLine) {

        // commandLine, strung together
        System.out.println( System.lineSeparator()
                          + "----- commandLine, strung together -----"
                          + System.lineSeparator()
                          + ForLooper.stringify( commandLine, "Command Line")
                          );


        // // sum nnois
        // System.out.println( System.lineSeparator() + "----- sum nnois -----");
        // oneTest( 0);
        // oneTest( 10);


        // convert a String to an int
        String stringThatLooksLikeAnIntToAHuman = "3";
        String anotherOne = "4";
        System.out.println( 
            System.lineSeparator()
          + "----- convert a String to an Integer -----"
          + System.lineSeparator()
          + "concatenate Strings: "
          + stringThatLooksLikeAnIntToAHuman + anotherOne
          + "   add ints: "
          + ( Integer.parseInt( stringThatLooksLikeAnIntToAHuman)
            + Integer.parseInt( anotherOne)
            )
          );


        // // Apply oneTest to each number from a command line like
        // //    java UserOfForLooper 0 1 2 3 4 1234
        System.out.println(
            System.lineSeparator()
          + "----- Apply oneTest to each number on the command line. -----"
          );
        // a FOR loop to iterate through the command line arguments

      for ( 
        int i = 0;
        i < commandLine.length;
        i++

      ) {
        //
      }

    }


    /**
       Run one summation test, for a particular number of nnois.
       Compare the results of invoking ForLooper.sumNnios
       with the square of the nnois summed.
     */
    private static void oneTest( int numToSum) {
        int result
          , numToSum_2
          ;
        
        System.out.println( 
            "assertion: \"The sum of the first "
          + numToSum
          + " nnois is "
          + (result = ForLooper.sumNnios( numToSum) )
          + ", which matches "
          + (numToSum_2 = numToSum * numToSum)
          + "\": "
          + (result == numToSum_2)
          );
    }
}
