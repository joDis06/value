/**
  Exercise the StringLooper class
  
  Bill Withers
  hw034
  worked with no one
  advised by no one
 */

public class UserOfStringLooper {
    public static void main( String[] commandLine) {
        StringLooper s0 = new StringLooper();

        // toVariablesFormat
        System.out.println( System.lineSeparator()
                          + "----- toVariablesFormat -----");
        s0.source = "A_SNAKE_CASE_NAME";
        System.out.println( s0.toVariablesFormat());


        // toConstantsFormat
        System.out.println( System.lineSeparator()
                          + "----- toConstantsFormat -----");
        s0.source = "aCamelCaseName";
        System.out.println( s0.toConstantsFormat());

        // System.out.println( System.lineSeparator()
                          // + "----- verticalize -----");
        // s0.source = "Go!";
        // System.out.println( s0.verticalize() );
    }
}