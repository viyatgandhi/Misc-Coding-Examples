import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


/*

   Part of hackerrank practice challenge

   You can find more information (I/O and problem statement) on below link :
   https://www.hackerrank.com/challenges/fibonacci-modified

Example of Dynamic Programming, Recursion, Lamda expression, Memoization and use of BigInteger


   A series is defined in the following manner:

   Given the nth and (n+1)th terms, the (n+2)th can be computed by the following relation
   Tn+2 = (Tn+1)^2 + Tn

   So, if the first two terms of the series are 0 and 1:
   the third term = 1^2 + 0 = 1
   fourth term = 1^2 + 1 = 2
   fifth term = 2^2 + 1 = 5
   ... And so on.

   Given three integers A, B and N, such that the first two terms of the series (1st and 2nd terms)
   are A and B respectively, compute the Nth term of the series.

 */

public class fibonacci_modified {

static Map<Integer, BigInteger> memo = new TreeMap<Integer, BigInteger>();

public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n0 = sc.nextInt();
        int n1 = sc.nextInt();
        int n = sc.nextInt();

        memo.put(1, BigInteger.valueOf(n0));
        memo.put(2, BigInteger.valueOf(n1));


        System.out.println(modifiedFibRec(n));
}

static BigInteger modifiedFibRec (int x){
        return memo.computeIfAbsent(x, n -> modifiedFibRec(n-1).pow(2).add(modifiedFibRec(n-2)));
}

}
