/**
 Jo Disomma
 hw055
 worked with 
 advised by 
  
 
   Exercise the PhoneBook class, to be invoked like
       java UserOfPhoneBook "Costello, Lou"
 */
public class UserOfPhoneBook {
    public static void main( String[] commandLine) {

        PhoneBook phoneBook = new PhoneBook();

        // PnoneBook test
        System.out.println( 
            System.lineSeparator()
          + "----- PhoneBook test -----" + System.lineSeparator()
          + "results of invoking a stub of your PhoneBook method on "
          + commandLine[0]
          + System.lineSeparator()
          + stubPB(commandLine)
          );



    }
}
