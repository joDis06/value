public class IntAndDoubleTwo {

    public static void main(String[] commandLine) {
        System.out.println(SumUpTo(4));
        System.out.println(Fibbo(7));
        System.out.println(7%2);
    }

    private static int SumUpTo(int n) {
        return (n*(n+1))/2;
    }

    private static double Fibbo(int n) {
        return ( (Math.pow( (1+Math.sqrt(5)),n )) -
               ( Math.pow( (1-Math.sqrt(5)),n)) ) /
               ( Math.pow(2,n) * Math.sqrt(5)) ;
    }

}