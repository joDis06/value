/**
   Represent a Fibonacci sequence

Jo Disomma
hw038
worked with nobody
advised by nobody
 */
public class FibonacciSeq { 
    // Create a private instance field to eventually
    // hold a reference to an array of int values.
    
    private int[] refToIntArray = new int[8];


    /**
       Initialize this object with an array of the
       first 8 Fibonacci numbers, starting at 1.
     */
    public void gimme8() {
      refToIntArray[0] = 1;
      refToIntArray[1] = 1;
      refToIntArray[2] = refToIntArray[1]+refToIntArray[0];
      refToIntArray[3] = refToIntArray[2]+refToIntArray[1];
      refToIntArray[4] = refToIntArray[3]+refToIntArray[2];
      refToIntArray[5] = refToIntArray[4]+refToIntArray[3];
      refToIntArray[6] = refToIntArray[5]+refToIntArray[4];
      refToIntArray[7] = refToIntArray[6]+refToIntArray[5];
    }


    /**
       @return a string representation of this instance
     */
    public String toString() {
        String result;
        result = "the sequence: "
                 + refToIntArray[0] + " "
                 + refToIntArray[1] + " "
                 + refToIntArray[2] + " "
                 + refToIntArray[3] + " "
                 + refToIntArray[4] + " "
                 + refToIntArray[5] + " "
                 + refToIntArray[6] + " "
                 + refToIntArray[7]
              + "\nNumber of array entries available:\n" 
              + refToIntArray.length;
        return result;
    }

}
