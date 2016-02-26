import java.math.BigInteger;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

/*
 * Java 8
 * Calculate factorial of very large values using big integer and memoization
 * largest value I have tested is 999999 on below program which took around 8 minutes to compute
 * and contained around 4000+ digits - FYI run on CLI rather than on any IDE
 */

public class factorialBigInteger {

	static int count=0;

	static Map<Integer, BigInteger> memo = new TreeMap<Integer, BigInteger>();

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int n = in.nextInt();
		int n0 = 1;

		memo.put(1, BigInteger.valueOf(n0));

		//System.out.println(modifiedFact(1000));
		//System.out.println(modifiedFact(1493));
		System.out.println(factorial(BigInteger.valueOf(n)));
	}

	static BigInteger modifiedFact(int x) {

		 return memo.computeIfAbsent(x, n -> BigInteger.valueOf(n).multiply(modifiedFact(n-1)));

	}

	public static BigInteger factorial(BigInteger n) {
	    BigInteger result = BigInteger.ONE;

	    while (!n.equals(BigInteger.ZERO)) {
	        result = result.multiply(n);
	        n = n.subtract(BigInteger.ONE);
	    }

	    return result;
	}

}
