public class miscFileOne {
	static void myMethod() {
		System.out.println("My method is working!");
	}

	static void myGreeting(String name) {
		System.out.println("Hello, " + name + "!");
	}

    static void myGreeting2(String name, int age) {
        System.out.println(name + " is " + age);
    }

    static int mySum(int x, int y) {
        return x + y;
    }

    static int plusMethod(int x, int y) {
        return x + y;
    }

    static double plusMethod(double x, double y) {
        return x + y;
    }
//--------------------
	public static void main(String[] commandLine) {
		System.out.println("hello, world");
//------09.19.22------
		System.out.println("i am learning java!");

		int x = 10;
		int y = 20;
		System.out.println(x+y);

		int myNum;
		myNum = 10;
		System.out.println(myNum);

		/* Logical Operators
		 - && ; Logical and ; Returns true if both statements true 
		 - || ; Logical or ; Returns true if min. 1 statement is true
		 - ! ; Logical not; Reverses result, if false -> true 
		  
		 */

		 // https://www.w3schools.com/java/java_strings.asp good info on strings
		 // https://www.w3schools.com/java/java_math.asp math stuffs

		 if (x>y) {
			System.out.println("x is greater than y");
		 } else {
			System.out.println("y is greater than x");
		 }

		 //shorthand
		 int time = 20;
		 String result = (time < 18) ? "Good day." : "Good evening.";
		 System.out.println(result);

		 //while loop
		 int i = 0;
		 while (i < 5) {
			System.out.println(i);
			i++;
		 }

		 //for loop
		 for (int i2 = 0; i <= 5; i++) {
			System.out.println(i);
		 }

		 // start of methods https://www.w3schools.com/java/java_methods.asp

		 myMethod();
		 // Outputs "My method is working!"
		 myMethod();

		 myGreeting("Mr. Holmes");
         myGreeting("Joseph");
         myGreeting("Bart");
		 // Outputs "Hello, [name]!"

//------09.21.22------
         // Multiple Parameters 
         myGreeting2("Homer",40);
         myGreeting2("Bart", 11);

         System.out.println(mySum(5, 3));
         int z = mySum(5,3);
         System.out.println(z);

//------09.22.22------

         // Method Overloading

         int myNum1 = plusMethod(8,5);
         double myNum2 = plusMethod(4.3, 6.26);
         System.out.println("int: " + myNum1);
         System.out.println("double: " + myNum2);

         // method overloading https://www.w3schools.com/java/java_methods_overloading.asp
		 
         // Scope 
         // https://www.w3schools.com/java/java_scope.asp

//------09.28.22------		 

         // recursion https://www.w3schools.com/java/java_recursion.asp

		 


	}
}

