/**
 Represent a facility to generate UnitIDs
 */

public class UnitID {
    
    // class field: one field for whole class
    static public int nextID = 32767;
    
    // instance field
    public String suffix;
    
    /**
      @return an ID for the firm's next unit

      One sequence for the entire program;
      not one sequence for each model line.
     */
    public String getID() {
        nextID = nextID + 1;
        return nextID
             + "-" + suffix;
    }
}
