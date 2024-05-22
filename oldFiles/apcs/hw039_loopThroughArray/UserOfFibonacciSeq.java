/**
   Exercise the FibonacciSeq class
 */
public class UserOfFibonacciSeq {
    public static void main( String[] commandLine) {

        // first 8 Fibonacci numbers, starting a at 1
        FibonacciSeq thruF8 = new FibonacciSeq();
        thruF8.gimme8();

        // first 8 Fibonacci numbers, starting a at 1
        FibonacciSeq againThruF8 = new FibonacciSeq();
        againThruF8.gimme8();

        FibonacciSeq thruF8Arb = new FibonacciSeq();
        thruF8Arb.gimme8Arb(47);


        System.out.println(
            System.lineSeparator()
          + "----- first 8 Fibonacci numbers -----"
          + System.lineSeparator()
          + thruF8
          + System.lineSeparator()
          + againThruF8
          + System.lineSeparator()
          + thruF8Arb
          );
    }
}
