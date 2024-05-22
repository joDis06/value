/**
   Represent an entry in a PhoneBook

   Exercise the ?? class
 */
public class Entry {
    private String name
                 , phone
                 ;
                 
    /**
       @return standard compareTo values for the comparison of
               this Entry's name vs.
               the String argument "name"
     */
    public   /* class or instance? */  int compareTo( String name) {
        
      return this.getName().compareTo(name);
    }


    /**
      Construct an instance from Strings
     */
    public Entry( String name, String phone) {
        this.name = name;
        this.phone = phone;
    }

     /**
       @return the "phone" from this Entry
     */
    public /* instance */ String getPhone() {
        return phone;
    }

     /**
       @return the "name" from this Entry
     */
    public /* instance */ String getName() {
        return name;
    }
}
