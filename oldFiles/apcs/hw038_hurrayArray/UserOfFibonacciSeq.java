/**
 Jo Disomma
hw038
worked with nobody
advised by nobody 
 
  
   Exercise the FibonacciSeq class
 */
public class UserOfFibonacciSeq {
    public static void main( String[] commandLine) {

        // first 8 Fibonacci numbers, starting a at 1
        FibonacciSeq thruF8 = new FibonacciSeq();
        thruF8.gimme8();

        System.out.println(
            System.lineSeparator()
          + "----- first 8 Fibonacci numbers -----"
          + System.lineSeparator()
          + thruF8
          );
    }
}
