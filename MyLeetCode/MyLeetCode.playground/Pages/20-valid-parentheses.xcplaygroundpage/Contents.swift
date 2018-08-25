import Foundation

/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 
 */

func isValid(_ s: String) -> Bool {
    var stack: [Character] = []
    
    for c in s.characters {
        switch String(c) {
        case ")":
            if (stack.popLast() != Character("(")) {
                return false
            }
        case "]":
            if (stack.popLast() != Character("[")) {
                return false
            }
        case "}":
            if (stack.popLast() != Character("{")) {
                return false
            }
        default:
            stack.append(c)
        }
    }
    
    return stack.isEmpty
}
