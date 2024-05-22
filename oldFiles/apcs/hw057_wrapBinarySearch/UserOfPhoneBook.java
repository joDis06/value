/**
 Jo Disomma
 Hw057
 worked with Joshua Wong
 advised by

   Exercise the PhoneBook class.

   Tests of recursive binary search:
   java UserOfPhoneBook Bach               # expecting null
   java UserOfPhoneBook "Kernighan, Brian" # expecting 000-000-0000
   java UserOfPhoneBook Archimedes         # expecting 314-159-2653

   A second command-line parameter allows the user to choose
   to run a recursive   binary search
   versus a while-style binary search.

   Tests of while-style binary search:
   java UserOfPhoneBook Bach               while-style
   java UserOfPhoneBook "Kernighan, Brian" while-style
   java UserOfPhoneBook Archimedes         while-style
 */
public class UserOfPhoneBook {
    public static void main( String[] commandLine) {

        PhoneBook phoneBook = new PhoneBook();

        String phone;

        // choose which binary search to run
        if(   commandLine.length > 1
            &&  // short-circuit avoids out-of-bounds exception
              commandLine[1].equals( "while-style")
           )
            phone = phoneBook.getPhone_whileStyle( commandLine[0]);
        else // use recursive binary search
            phone = phoneBook.getPhone( commandLine[0]);

        // PhoneBook test
        System.out.println(
            System.lineSeparator()
          + "----- PhoneBook test -----" + System.lineSeparator()
          + "name: " + commandLine[0]
          + "   phone number: " + phone
          );
    }
}
