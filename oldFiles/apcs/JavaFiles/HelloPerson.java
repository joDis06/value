/***********************************************
 *  Add a method to the previous HelloWorld
 **********************************************/

public class HelloPerson {

    public static void main(String[] commandLine) {
        System.out.println( greet( "Professor", "Kernighan"));
        System.out.println( greet("Lord", "Farquaad"));
        System.out.println( greet("Doctor", "Greenwald"));
    }

    private static String greet( String honorific, String lastName) {
        return "hello, " + honorific + " " + lastName + ". " + "How you doon?";
    }
}
