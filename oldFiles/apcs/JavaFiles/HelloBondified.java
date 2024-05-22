/***********************************************
    Nest method invocations

    Jo Disomma
    hw009
    worked with N/A
    advised by N/A

 **********************************************/

public class HelloBondified {

    public static void main( String[] commandLine) {
        System.out.println( dialog( "James", "Bond"));
        System.out.println( dialog( "David", "Holmes"));
        System.out.println( dialog("Joshua", "Wong"));
    }

/*
    method dialog
    returns the 2-person dialog for one name
*/
    private static String dialog( String firstName
                                , String lastName) {
        return introduction(bondify(firstName, lastName)) + 
                greeting(bondify(firstName, lastName)) +
                correction(bondify(firstName, lastName), firstName, lastName) +
                greetPostCorrect(firstName, lastName);
    }

/*
    method bondify
    returns a phrase in the form
        Bond, James Bond
*/
    private static String bondify( String firstName
                                 , String lastName) {
        return lastName + ", " + firstName + " " + lastName + ".";
    }

/*
    method introduction
    returns an introduction with a phrase in the form
        My name is Bond, James Bond
*/
    private static String introduction( String bondifiedString )
                              {
         return "My name is " + bondifiedString ;
    }

/*
    method greeting
    returns greeting by second person in dialog in the form
        Hello, Bond, James Bond. How you doon?
 */
   private static String greeting( String bondifiedString) {
    return "\nHello, " + bondifiedString + " " + "How you doon?";
   }

/*
   method correction
   returns a correction of the first person's name in form 
        Not "Bond, James Bond." Just "James Bond."
  
 */
   private static String correction( String bondifiedString, String firstName, String lastName) {
    return "\nNot " + "\"" + bondifiedString + "\" " + "Just " + "\"" + firstName + " " + lastName + ".\"";
   }

/*
  method greetPostCorrect  
  returns a greeting following the correction in form
        Hello, James Bond. How you doon?
 */
   private static String greetPostCorrect(String firstName, 
                                          String lastName) {
    return "\nHello, " + firstName + " " + lastName + ". " + "How you doon?\n"; 
                                          }

 }
