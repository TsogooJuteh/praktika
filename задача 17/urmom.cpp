#include <iostream>
using namespace std;
int recursive_sum(int n) {
    if (n == 0) return 0;
    return n + recursive_sum(n-1);
}


int main() {
    int n;
    cin >> n;
    int sum = 0;
    for(int i = 0; i <= n; i++) {
        sum += i;
    }
    cout << sum;
    cout<< recursive_sum(n);
}