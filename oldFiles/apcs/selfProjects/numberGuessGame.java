import javax.swing.JOptionPane;

public class numberGuessGame {
    
    public static void main(String[] args) {

//  //||:
        int compNum = (int)(Math.random()*100 + 1);

        int userAns = 0;

    System.out.println("The correct answer is:" + compNum);

    int count = 1;

    //full copy(?)

    while (userAns != compNum) {

        String resp = JOptionPane.showInputDialog(null, 
        "Enter a number between 1 and 100", "Number Guessing Game", 5);





    }



    }

}
