// Time taken is 188ms. Passed 59 test cases on leetcode.
public class Merge_Sorted_Array_Inplace {
    public void merge(int A[], int m, int B[], int n) {
        int i = m - 1;
        int j = n - 1;
        
        // The A array is assumed to have space enough for (m+n) elements.
        // The new array length would be (m+n), since we are merging the 2 arrays. Last index would be (m+n-1).
        int k = m + n - 1;
        while (k >= 0){
            
            // Since we are doing it in-place, we need to compare the end, add the sorted values from the end.
            // If the A's i(th) element is greater than B's j(th) element and (i) value is greater than 0 (still has values in A)
            // OR the (j) value is less than 0 (all the values in B have been added), we add A's value and decrement (i).
            // Also decrement (k) on every insert. Else we add B's value and decrement (j).
            if (j<0 || (i >= 0 && A[i] > B[j]))
                A[k--] = A[i--];
            else
                A[k--] = B[j--];
        }
    }
}
