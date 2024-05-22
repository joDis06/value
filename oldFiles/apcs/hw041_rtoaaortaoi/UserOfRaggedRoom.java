/**
   Exercise the RaggedRoom class
 */
public class UserOfRaggedRoom {
    public static void main( String[] commandLine) {

        RaggedRoom room307 = new RaggedRoom();
        
        room307.populate();

        System.out.println(
                System.lineSeparator()
              + "----- see the room -----" + System.lineSeparator()
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
        }
}
