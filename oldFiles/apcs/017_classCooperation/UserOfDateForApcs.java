/* 
Jo Disomma
hw17
worked with nobody
advised by nobody
*/

/**
  Exercise the DateForApcs class
 */
public class UserOfDateForApcs {


public static void main(String[] args) {
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

}

}