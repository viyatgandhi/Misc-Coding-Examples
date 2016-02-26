import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/*
 * Part of Instructure coding challenge - 2016
 * Print nested Hashmap dynamically when added as value of other Hashmap
 * Recursion is key to get the answer
 */

public class printNestedHashMapDynamically {

	public static void main(String[] args) {

		HashMap<Integer, Object> hmap = new HashMap<Integer, Object>();

		HashMap<Integer, Object> nestHmap1 = new HashMap<Integer, Object>();
		HashMap<Integer, Object> nestHmap2 = new HashMap<Integer, Object>();

		// original map
		hmap.put(0, "a");
		hmap.put(1, "b");

		// insert into nestHmap1
		nestHmap1.put(3, "c");
		nestHmap1.put(4, "d");
		nestHmap1.put(5, "e");

		// put map as an object in hmap
		hmap.put(2, nestHmap1);

		// insert into nestHmap2
		nestHmap2.put(7, "aa");
		nestHmap2.put(8, "bb");
		nestHmap2.put(9, "cc");

		// put map as an object in nestHmap1
		nestHmap1.put(6, nestHmap2);

		// put value in original map
		hmap.put(10, "z");

		printdata(hmap);

	}

	@SuppressWarnings("unchecked")
	public static void printdata(HashMap<Integer, Object> printmap) {

		Set<?> set = printmap.entrySet();
		Iterator<?> iterator = set.iterator();
		while (iterator.hasNext()) {
			@SuppressWarnings("rawtypes")
			Map.Entry mentry = (Map.Entry) iterator.next();
			System.out.println("key is: " + mentry.getKey() + " & Value is: ");
			if (mentry.getValue().getClass().getName() == "java.util.HashMap") {
				System.out.println("\nInside other HashMap");
				printdata((HashMap<Integer, Object>) mentry.getValue());
			} else {
				System.out.println(mentry.getValue());
			}
		}
	}
}
