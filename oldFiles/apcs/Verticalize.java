/**
 Jo Disomma 
 Hw031
 worked with nobody
 assisted by nobody
  
 Loop through the characters in a string, introducing
 line separators
 */

public class Verticalize {

    /**
      First cut, expecting
          V
          e
          r
          t
          i
          c
          a
          l
          i
          z
          e

          m
          e
          !
     */
    public static void main( String[] commandLine) {
        String input = "Verticalize me!";
        int lengthInput = input.length();
        int vLocation = 0;
    while ( vLocation < lengthInput ) {

        System.out.println( input.substring(vLocation,vLocation+1) );
        vLocation += 1;
    }

}

}
