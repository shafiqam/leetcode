// Time taken is 165ms. Passed 65 test cases on leetcode.
import java.util.HashMap;
import java.util.Stack;

public class Valid_Parentheses {
    public boolean isValid(String s) {
        char[] str = s.toCharArray();
        Stack<Character> st = new Stack<Character>();
        
        // Using a hashmap to have a 1-1 mapping of the opening parentheses to the closing parentheses.
        // Key is the opening parentheses, and the value is its corresponding closing parentheses.
        HashMap<Character, Character> hm = new HashMap<Character, Character>();
        hm.put('(', ')');
        hm.put('{', '}');
        hm.put('[', ']');
        
        // Convert the string to character array and loop through each character.
        for(char ch : str){
            
            // If the character is any of the opening parentheses, then push the element onto the stack.
            if(hm.keySet().contains(ch)){
                st.push(ch);
            }
            // Else if the character is any of the closing parentheses and the stack is not empty,
            // and the top of the stack is its corresponding opening parentheses, the pop the top of the stack.
            else if(hm.values().contains(ch) && !st.empty() && hm.get(st.peek()) == ch){
                st.pop();
            }
            // Since the string contains only parentheses, this happens if it is any of the closing parentheses,
            // and the stack is empty or the top of the stack is not its corresponding opening parentheses.
            else{
                return false;
            }
        }

        // After scanning the entire string, if the stack is not empty then the string has some unclosed parentheses.
        // If it is empty, just returns true.
        return st.empty();
    }
}