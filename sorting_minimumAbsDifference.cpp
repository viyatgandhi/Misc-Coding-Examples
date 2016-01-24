#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

/*

   Part of hackerrank 30 Days Of Code contests

   You can find more information (I/O and problem statement) on below link :
   https://www.hackerrank.com/contests/30-days-of-code/challenges/day-16-closest-numbers

   Solved in O(n) to get best and efficient solution.

   Input Format:
   The first line contains a single integer N, denoting the length of list A.
   The second line contains N space-separated integers, a0,a1,…,aN−1, representing the elements in A.

   Output Format:
   Print the space-separated pair of elements having the minimum absolute difference in ascending order.
   If more than one pair meets this criterion, print them consecutively, separated by a space,
   in ascending order on a single line.
   Because we are printing space-separated pairs, some elements may appear more than once in your output.

   Sample Input 1:
   10
   -20 -3916237 -357920 -3620601 7374819 -7330761 30 6246457 -6461594 266854

   Sample Output 1:
   -20 30

   Explanation
   The minimum absolute difference is 50 (ABS(30−(−20))=50).
   The only pair having this difference is (−20,30).

 */


int main() {

        int n;
        cin >> n;
        vector<int> arr(n);
        for(int arr_i = 0; arr_i < n; arr_i++) {
                cin >> arr[arr_i];
        }

        sort(arr.begin(), arr.end());

        int small=abs(arr[1]-arr[0]);
        for(int i=2; i<n; i++) {
                small=min(small,abs(arr[i]-arr[i-1]));
        }

        int i = 0;
        int j = 1;

        while (i<n && j<n)
        {
                if (i != j && abs(arr[j]-arr[i]) == small)
                {
                        cout << arr[i] << " ";
                        cout << arr[j] << " ";
                }
                j++;
                i++;
        }
        return 0;
}
