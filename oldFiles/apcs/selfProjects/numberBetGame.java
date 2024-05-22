
public class numberBetGame {

//f....
int baseNum = 100;
double baseMulti = 1.00;
double newNum;
static Strign retnewNum;

String userInput0 = UserOfNBG.myObj;


public int gameThingy(String userInput0) {
if (userInput0 == "Yes") {

    newNum = baseNum * (baseMulti + (Math.random(.02)));
    retnewNum = String(newNum);
    return retnewNum;
    
    
} 
else {
    return 0;
}
}




} 