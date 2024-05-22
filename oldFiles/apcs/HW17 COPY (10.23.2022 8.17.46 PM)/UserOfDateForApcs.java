/* 
Jo Disomma
hw18
worked with nobody
advised by nobody
*/

/**
  Exercise the DateForApcs class
 */
public class UserOfDateForApcs {


public static void main(String[] args) {

  DateForApcs dateOne = new DateForApcs();
  dateOne.year = 1969;
  dateOne.month_0_11 = 7;
  dateOne.day_1_31 = 20;

  DateForApcs dateTwo = new DateForApcs();
  dateTwo.year = 2038;
  dateTwo.month_0_11 = 6;
  dateTwo.day_1_31 = 4;

  DateForApcs dateThree = new DateForApcs();
  dateThree.year = 2022;
  dateThree.month_0_11 = 10;
  dateThree.day_1_31 = 23;

System.out.println(dateOne.preJuly16()
); // expecting "preJuly16: No"

System.out.println(dateTwo.preJuly16()
); // expecting "preJuly16: Yes"

System.out.println(dateThree.preJuly16()
); // expecting "preJuly16: No"

//------

System.out.println ( DateForApcs.iso8601(2000, 9, 04)
  ); // expecting "2009-09-04"

System.out.println ( DateForApcs.iso8601(2821, 10, 19)
  ); // expecting "2821-10-19"

System.out.println ( DateForApcs.iso8601(1992, 01, 28)
  ); // expecting "2001-10-14"

//-------

System.out.println ( DateForApcs.isLeapYear(2020)
  ); // expecting Yes

System.out.println ( DateForApcs.isLeapYear(2000)
  ); // expecting Yes

System.out.println ( DateForApcs.isLeapYear(2100)
  ); // expecting No

System.out.println ( DateForApcs.isLeapYear(2500)
  ); // expecting No

System.out.println ( DateForApcs.isLeapYear(2376)
  ); // expecting Yes

  //----------- hw 019
  // isLeapYear tests
leapTest( 1999);
leapTest( 2000);
leapTest( 2004);
leapTest( 2100); 

}

/**
  Display whether the year is a leap year.
 */
public static void leapTest( int year
                           ) {
    String notOrNothing; // string " not" or nothing
    
    if( DateForApcs.isLeapYear2((short) year))
         notOrNothing = "";
    else notOrNothing = " not";
    
    System.out.println( year + " is"
                      + notOrNothing
                      + " a leap year"
);

}

}
