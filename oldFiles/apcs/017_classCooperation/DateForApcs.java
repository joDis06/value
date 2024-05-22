/**
Jo Disomma
hw17
worked with nobody
advised by nobody
*/

/*
  Represent a date
 */

/*
Hw017 needs no fields. This stub code is just for reference
on the datatypes and names we aim to use.
    short year
    byte  month_0_11
    byte  day_1_31
*/

public class DateForApcs {
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
}
