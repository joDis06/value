/**
     Jo Disomma
     Hw042
     worked with n/a
     advised by n/a
 

   Exercise the RaggedRoom class
 */
public class UserOfRaggedRoom {
    public static void main( String[] commandLine) {

        RaggedRoom room307 = new RaggedRoom();
        int files = 0;
        int ranks = 0;

        if (commandLine.length < 2) {
          //
        } else {
          files = Integer.parseInt(commandLine[0]);
          ranks = Integer.parseInt(commandLine[1]);
        }
          

        System.out.println(
                System.lineSeparator()
              + "----- see room 307, with its ragged seating -----"
              + System.lineSeparator()
              + room307
              );
         /* Expecting, eventually, to see a filled-in version of...
               number of files: 5
               files
               0    ranks:  0 1 2 3 4 5 6 7
                    person: 0 1 2 ...     7

               1    ranks:  0 1 2 3 4 5
                    person: 8 9 ...   13

               2    ranks:  0 1 2 3 4 5
                    person: 14 ...    21

               3    ranks:  0 1 2 3 4 5 6
                    person:

               4    ranks:  0 1 2 3 4 5 6
                    person:     ...     33
         */


         // create and display a rectangular room
        System.out.println(
                System.lineSeparator()
              + "----- see a rectangular room -----"
              + System.lineSeparator()
              + new RaggedRoom(4, 3)
              + System.lineSeparator()
              + "----- see a rectangular room ----- (breaks w/o exception to 0)"
              + System.lineSeparator()
              + new RaggedRoom(files,ranks)
              + System.lineSeparator()
              + "----- see a ragged room ----- (does not break on 0)"
              + System.lineSeparator() 
              + new RaggedRoom(commandLine)
              );
        }
}
