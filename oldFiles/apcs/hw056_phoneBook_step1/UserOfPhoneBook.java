/**
 Jo Disomma
 hw056
 worked with 
 advised by Joshua (his knowledge helped) 
  
 
  
  
   Exercise the PhoneBook class

   Tests:
   java UserOfPhoneBook "Kernighan, Brian" # expecting 000-000-0000
   java UserOfPhoneBook Archimedes         # expecting 314-159-2653
   java UserOfPhoneBook Bach               # expecting null
 */
public class UserOfPhoneBook {
    public static void main( String[] commandLine) {

        PhoneBook phoneBook = new PhoneBook();

        // PnoneBook test
        System.out.println( 
            System.lineSeparator()
          + "----- PhoneBook test -----" + System.lineSeparator()
          + "name: " + commandLine[0]
          + "   phone number: "
          // + phoneBook.getPhone( commandLine[0])
          + phoneBook.getPhone(commandLine[0])
          + System.lineSeparator()
          + "name: " + "Kernighan, Brian"
          + "   phone number: "
          + phoneBook.getPhone("Kernighan, Brian", 0, 10)
          + System.lineSeparator()
          + "name: " + "Archimedes"
          + "   phone number: "
          + phoneBook.getPhone("Archimedes", 0, 10)
          + System.lineSeparator()
          + "name: " + "Bach"
          + "   phone number: "
          + phoneBook.getPhone("Bach", 0, 10)
          
          );
    }
}
