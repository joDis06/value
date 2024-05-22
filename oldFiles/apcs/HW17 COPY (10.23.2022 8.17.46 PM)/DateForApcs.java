/**
Jo Disomma
hw18
worked with nobody
advised by nobody
*/

/*
  Represent a date
 */

public class DateForApcs {
  public short year;
  public byte  month_0_11;
  public byte  day_1_31;

   public static String iso8601 ( int year, int month_0_11, int day_1_31) {
    return year + "-" + month_0_11 + "-" + day_1_31;
   }

   public static String isLeapYear ( int year ) {
    if ( ( (year%4 == 0) && (year%100 != 0)) || (year%400 == 0)) {
      return "Yes";
    }
    else {
      return "No";
    }
   }

   public /*non static*/ String preJuly16() {
    if ((month_0_11 <= 6) && (day_1_31 < 16)) {
      return "preJuly16 : Yes"; }
    else {
      return "preJuly16 : No";
    }
    }

//hw019
///
public static boolean isLeapYear2(short year) {
  return year%4 == 0 && year%100 != 0 || year%400 == 0;
}

   }
