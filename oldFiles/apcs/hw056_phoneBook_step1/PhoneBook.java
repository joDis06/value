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
      return getPhone(name, 0, entries.length);
    }

    public/* instance */ String getPhone( String name, int lowLimit, int highLimit) {
      
      int pageCheck = ((lowLimit + highLimit)/2);

      if (lowLimit == highLimit) {
        return null;
      }

      if (name.compareTo( entries[pageCheck].getName()) == 0) {
        return entries[pageCheck].getPhone();
      }
      else {
        if (entries[pageCheck].getName().compareTo( name) > 0) {
          if (pageCheck == lowLimit) {
            return null;
          }
          else {
            return getPhone( name, lowLimit, pageCheck);
          }
        }



        if (entries[pageCheck].getName().compareTo( name) < 0)
         {

          if (pageCheck == highLimit - 1) {
            return null;
          }
          else {
            return getPhone( name, pageCheck, highLimit);
          }
        }
        else {
          return null;
        }
      }
    
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
