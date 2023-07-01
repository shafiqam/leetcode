// Time taken is 230ms. Passed 69 test cases on leetcode.
public class Compare_Version_Numbers {
    public int compareVersion(String version1, String version2) {
        
        // Split the two strings on "." pattern
        String[] v1 = version1.split("\\.");
        String[] v2 = version2.split("\\.");
        
        int v1_len = v1.length;
        int v2_len = v2.length;
        int minlen = Math.min(v1_len, v2_len);
        int maxlen = Math.max(v1_len, v2_len);
        int i=0;
        
        // Loop through the minimum length array, while comparing the integer values of each version.
        while(i < minlen){
            int ver1 = Integer.parseInt(v1[i]);
            int ver2 = Integer.parseInt(v2[i]);
            
            if(ver1 > ver2)
                return 1;
            else if(ver1 < ver2)
                return -1;
                
            i++;
        }
        
        // If the index and maxlen are the same, we have compared all the version numbers so return 0 (equal)
        if(i == maxlen){
            return 0;
        }
        // Else if index is same as version1 length, then we have not yet scanned the entire version2, so we 
        // we loop through the remaining version2 array and if all the remaining numbers are 0, then the two
        // version are equal else the v2 is greater returning -1.
        else if(i == v1_len){
            while(i < v2_len && Integer.parseInt(v2[i]) == 0){
                i++;
            }
            return (i == v2_len) ? 0 : -1;
        }
        // Else the index is same as version2 length and we have to scan the remaining numbers on version1 array.
        // If all the remaining numbers are 0, then the two version are equal else the v1 is greater returning 1.
        else{
            while(i < v1_len && Integer.parseInt(v1[i]) == 0){
                i++;
            }
            return (i == v1_len) ? 0 : 1;
        }
    }
}