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
        s.push(temp.top());
        temp.pop();
    }

    // Optional: Push the element back if we want to restore the stack
    std::cout << "s.size: " << s.size() << std::endl;
}

int main() {
    std::stack<int> s;
    s.push(1);
    s.push(2);
    s.push(3);
    s.push(4);
    s.push(7);
    s.push(5);
    s.push(9);
    displayReversed(s);
    return 0;
}