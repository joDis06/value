/**
 Jo Disomma
 hw048
 worked w/ Intia Ibnah
 advised by Zidane  
  
  
   Represent a solution to the Towers of Hanoi puzzle
 */
public class ToH {

private int nDisks;
private String from_saysRequestingEntity
             , to_saysRequestingEntity
             , spare_saysRequestingEntity
             ;
private Move[] moves;
private int nMoves;  // # of moves calculated so far.
  /* Usefully, this is the offset into "moves" of the next
     slot to be populated
  */


    /**
      Construct an instance
     */
    public ToH( int nDisks
              , String from
              , String to
              , String spare
              ) {
        this.nDisks = nDisks;
        from_saysRequestingEntity = from;
        to_saysRequestingEntity = to;
        spare_saysRequestingEntity = spare;

        // create an empty array of "moves
        moves = new Move[(int)Math.pow(2, nDisks) - 1];
    }


    /**
       @return a string representation of this instance
     */
    public String toString() {
        String result;
        result =   "To move " + nDisks + " disks"
                 + " from " + from_saysRequestingEntity
                 + " to " + to_saysRequestingEntity
                 + " using " + spare_saysRequestingEntity
                 + " if necessary:" + System.lineSeparator()
                 ;
             // report the "moves", using Move.toString()
             for (Move mememe : moves ) {
              result += mememe + System.lineSeparator();
              
             }
        return result;
    }


    /**
       Populate "moves" for the given problem.
     */
    public /* instance */ void generateAllMoves() {
        generateMoves( nDisks
                     , from_saysRequestingEntity
                     , to_saysRequestingEntity
                     , spare_saysRequestingEntity
                     );
    }


    /**
       Recursively add to "moves" for a particular point
       in the problem, as specified in the parameters.
     */
    private /* instance */ void generateMoves( int nDisks
                                             , String from
                                             , String to
                                             , String spare
                                            ) {
      if (nDisks == 1) {
        moves[nMoves] = new Move(from, to);
        nMoves++;
      } else {
      generateMoves(nDisks-1, from, spare, to);
      moves[nMoves] = new Move(from, to);
      nMoves++;
      generateMoves(nDisks-1, spare, to, from);
    }

}

}