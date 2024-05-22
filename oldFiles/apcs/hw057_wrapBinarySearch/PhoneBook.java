/**
   Represent a phone book, as a sorted array of Entry objects
 */
public class PhoneBook{
    private Entry[] entries;

    /**
      Construct an instance from the data in hw054
     */
    public PhoneBook(){
        entries = new Entry[]
          { new Entry( "Archimedes"            , "314-159-2653")
          , new Entry( "Brubeck, Dave"         , "Take5-4")
          , new Entry( "Contreras, Eric"       , "212-312-4800")
          , new Entry( "Costello, Lou"         , "Alexander-4444")
          , new Entry( "Hopper, Grace"         , "1954")
          , new Entry( "Jepsen, Carly Rae"     , "555-6041")
          , new Entry( "Kernighan, Brian"      , "000-000-0000")
          , new Entry( "Miller, Glenn"         , "PA6-5000")
          , new Entry( "Picket, Wilson"        , "634-5789")
          , new Entry( "al-Khwārizmī, Muhammad", "1-618-021594")
          };
    }


    /**
       @return  the phone number for "name", or
                return null if "name" is absent.
       precondition: the phone book must be sorted by name
     */
    public/* instance */ String getPhone( String name) {
        // test of base case
        // return getPhone( name, 7,7);

        return getPhone( name, 0, entries.length);
    }


    /**
       @return  the phone number for "name" between offsets
                    [ "lowInclusive", "highExclusive" )
                of this phone book, or
                return null if "name" is absent from that range.
       precondition: the phone book must be sorted by name
     */
    private /* instance */ String getPhone( String name
                                          , int lowInclusive
                                          , int highExclusive
                                          ) {
        // temp for debugging
        System.out.print(
             "name: |" + name + "|"
           + "   lowInclusive: " + lowInclusive
           + "   highExclusive: " + highExclusive
           );

        if( lowInclusive == highExclusive - 1 || lowInclusive == highExclusive && entries[ lowInclusive].compareTo(name) != 0 ) {
            // base case

            // temp for debugging
            System.out.println( "   base case");

            return null;
        }
        else{  // processing for recursive cases
            int midOffset = (lowInclusive + highExclusive) / 2;

            // temp for debugging
            System.out.println( "   offset to check: "
                              + midOffset
                              );

            // Where is name with respect to midOffset?
            int midCompare = entries[ midOffset].compareTo( name);

            if( midCompare == 0)
                return entries[ midOffset].getPhone();
            else if( midCompare < 0)  // exclude first half
                return getPhone( name, midOffset + 1, highExclusive);
            else // exclude second half
                return getPhone( name, lowInclusive, midOffset);
        }  // end of processing for recursive cases
    }


    /**
       @return  while-style the phone number for "name", or
                return null if "name" is absent.
       precondition: the phone book must be sorted by name
     */
    public/* instance */ String getPhone_whileStyle( String name) {
        
        int lowInclusive = 0;
        int highExclusive = entries.length;
        int midOffset = (lowInclusive + highExclusive) / 2;
        
        // // stub values
        // lowInclusive = highExclusive = midOffset = -1;
        
        // loop through a binary search
            // temp for debugging
            System.out.println(
                 "name: |" + name + "|"
               + "   lowInclusive: " + lowInclusive
               + "   highExclusive: " + highExclusive
               + "   offset to check: " + midOffset
               );

        while ( entries[midOffset].compareTo(name ) != 0) {

          int midCompare = entries[ midOffset].compareTo( name);

          if( midCompare < 0) {  // exclude first half 
           lowInclusive = midOffset;
           midOffset = (midOffset + highExclusive) / 2;

           if ( lowInclusive == highExclusive - 1
           && entries[ lowInclusive].compareTo(name) != 0) {
            return null;
           }
          }

            else { // exclude second half
           highExclusive = midOffset;
           midOffset = (lowInclusive + midOffset) / 2;
           if ( lowInclusive == highExclusive - 1
           && entries[ lowInclusive].compareTo(name) != 0) {
            return null;
           }
        
            }
        }

        return entries[ midOffset].getPhone();
    }


    /**
       Test Entry.compareTo
     */
    public static void main( String[] commandLine) {
        PhoneBook phoneBook = new PhoneBook();

        // compareTo test
        System.out.println(
            System.lineSeparator()
          + "----- compareTo test -----"
          );
        bwkCompareTo( phoneBook, 2, "neg");
        bwkCompareTo( phoneBook, 5, "neg");
        bwkCompareTo( phoneBook, 6, "0");
        bwkCompareTo( phoneBook, 7, "pos");
        bwkCompareTo( phoneBook, 9, "pos");
    }


    /**
       Test Entry.compareTo by comparing
       "Kernighan, Brian" to the PhoneBook entry at "offset".
     */
    private static void bwkCompareTo( PhoneBook pb
                                    , int offset
                                    , String expect
                                    ) {

        System.out.println(
            "compare Entry "
          + offset + ": "
          + pb.entries[ offset].compareTo( "Kernighan, Brian")
          + " ...expecting " + expect
          );
     }
}
