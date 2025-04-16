#include <stack>
#include <iostream>

void displayReversed(std::stack<int> s) {
    std::stack<int> temp;

    // Transfer elements to the temporary stack to reverse the order
    while (!s.empty()) {
        temp.push(s.top());
        s.pop();
    }

    // Display reversed elements
    while (!temp.empty()) {
        std::cout << temp.top() << std::endl;
        temp.pop();
    }
}

    // Optional: Push the element back if we want to restore the stack
    s.push(top);
}