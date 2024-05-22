/**
   Represent a Fibonacci sequence
 */
public class FibonacciSeq {

    // Create a private instance field to hold a
    // reference to an array of int values.
    private int[] seq;


    /**
       Initialize this object with an array of the
       first 8 Fibonacci numbers, starting at 1.
     */
    public void gimme8() {
        seq = new int[8];
        seq[0] = seq[1] = 1;
        seq[2] = seq[1] + seq[0];
        seq[3] = seq[2] + seq[1];
        seq[4] = seq[3] + seq[2];
        seq[5] = seq[4] + seq[3];
        seq[6] = seq[5] + seq[4];
        seq[7] = seq[6] + seq[5];
        // seq[8] = seq[7] + seq[6];
        /*
        Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 8
                at FibonacciSeq.gimme8(FibonacciSeq.java:24)
                at UserOfFibonacciSeq.main(UserOfFibonacciSeq.java:9) 
        */
    }

    public void gimme8Arb(int size) {
      seq = new int[size];
      int counter = 0;

          while (counter < size ) {
            if (counter < 2) {
              seq[counter] = 1;
              
            } else    {

             seq[counter] = ( seq[counter - 1] + seq[counter - 2] );
             
          
            }
            counter++;
            System.out.println(counter);
          }

    }


    /**
       @return a string representation of this instance
     */
    public String toString() {
        String result;
        result = "the sequence: "
                 + seq[0] + " "
                 + seq[1] + " "
                 + seq[2] + " "
                 + seq[3] + " "
                 + seq[4] + " "
                 + seq[5] + " "
                 + seq[6] + " "
                 + seq[7] + " "

                 + System.lineSeparator()
                 + "Number of array entries available: "
                 + seq.length
                 ;
        return result;
    }

}
