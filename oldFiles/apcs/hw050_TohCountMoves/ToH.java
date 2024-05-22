/**
   Represent a solution to the Towers of Hanoi puzzle
 */
public class ToH {

private int nDisks;
private String source_saysRequestingEntity
             , target_saysRequestingEntity
             , spare_saysRequestingEntity
             ;
private Move[] moves;
private int nMoves;  // # of moves calculated so far.
  /* Usefully, this is the offset into "moves" of the next
     slot to be populated
  */

private static final int MAX_MOVES = 65536;

    /**
      Construct an instance
     */
    public ToH( int nDisks
              , String source
              , String target
              , String spare
              ) {
        this.nDisks = nDisks;
        source_saysRequestingEntity = source;
        target_saysRequestingEntity = target;
        spare_saysRequestingEntity = spare;

        // create an empty array of "moves"
        moves = new Move[ MAX_MOVES];
    }


    /**
       @return a string representation of this instance
     */
    public String toString() {
        String result;
        result =   "To move " + nDisks + " disks"
                 + " source " + source_saysRequestingEntity.stripTrailing()
                 + " to " + target_saysRequestingEntity.stripTrailing()
                 + " using " + spare_saysRequestingEntity.stripTrailing()
                 + " if necessary:" + System.lineSeparator()
                 ;
             // report the "moves", using Move.toString()
             for( int offset = 0; offset <  nMoves; ++offset)
                 result +=   moves[ offset]
                           + System.lineSeparator();
        return result;
    }


    /**
       Populate "moves" for the given problem.
     */
    public /* instance */ void generateMoves() {
        generateMoves_recursiveAbstraction( 
            nDisks
          , source_saysRequestingEntity
          , target_saysRequestingEntity
          , spare_saysRequestingEntity
          );
    }


    /**
       Recursively add to "moves" for a particular point
       in the problem, as specified in the parameters.
     */
    private /* instance */ void generateMoves_recursiveAbstraction(
        int nDisks
      , String source
      , String target
      , String spare
      ) {
        if( nDisks == 1)
            moves[ nMoves++] = new Move( source, target);
        else {
            // moves to park the nDisks -1 smaller disks out of the way
            generateMoves_recursiveAbstraction( nDisks-1, source, spare, target);
            
            moves[ nMoves++] = new Move( source, target);
            
            // moves to un-park the smaller nDisks-1 disks onto the
            // largest disk that was to be moved
            generateMoves_recursiveAbstraction( nDisks-1, spare, target, source);
        }
    }

}