/**
 Jo Disomma
 Hw035
 worked with n/a
 advised by n/a 
   
  
 
  
  Exercise the StringLooper class
 */

public class UserOfStringLooper {
    public static void main( String[] commandLine) {
        StringLooper s0 = new StringLooper();

        // toVariablesFormat
        System.out.println( System.lineSeparator()
                          + "----- toVariablesFormat -----");
        s0.source = "A_SNAKE_CASE_NAME";
        System.out.println( s0.toVariablesFormat());

        s0.source = "ZEROUNDERSCORES";
        System.out.println( s0.toVariablesFormat());

        s0.source = "WHOLE_LOTTA_SNAKIN_GOIN_ON";
        System.out.println( s0.toVariablesFormat());


        // toConstantsFormat
        System.out.println( System.lineSeparator()
                          + "----- toConstantsFormat -----");
        s0.source = "aCamelCaseName";
        System.out.println( s0.toConstantsFormat());

        s0.source = "zerocaps";
        System.out.println( s0.toConstantsFormat());

        s0.source = "odd_But_Ok";
        System.out.println( s0.toConstantsFormat());


        // indexOf1 for hw035
        System.out.println( System.lineSeparator()
                          + "----- indexOf1 -----");
                                           //  01234
        System.out.println( StringLooper.indexOf1( "X", "xkXcd")); // expecting 2
        
        System.out.println( StringLooper.indexOf1( "l", "Dr.Greenwald")); // expecting 10
        
        System.out.println( StringLooper.indexOf1( "E", "ABCDEFGHI")); // expecting 4


        // indexOfSubstring for hw035
        System.out.println( System.lineSeparator()
                          + "----- indexOfSubstring -----");
                                           //  a Martin ruler here can help
        System.out.println( StringLooper.indexOfSubstring( "Xcd", "xkXcd")); // expecting 2

        System.out.println( StringLooper.indexOfSubstring( "H", "Mr.Holmes")); // expecting 3

        System.out.println( StringLooper.indexOfSubstring( "sey", "ssey")); // expecting 1


        // System.out.println( System.lineSeparator()
                          // + "----- verticalize -----");
        // s0.source = "Go!";
        // System.out.println( s0.verticalize() );
    }
}