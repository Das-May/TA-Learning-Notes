/*堆栈*/
#include <iostream>
#include <cstring>
#include <stack>
using namespace std;
int main()
{
    stack<int> s;
    int num, start, i, A, B;
    bool judge;
    int train[1010];
    while (cin>>num&&num)
    {
        memset(train, 0, sizeof(train));
        while (cin >> train[1] && train[1])//数组下标从1开始
        {
            A = B = 1, judge = 1;
            for (i = 2; i <= num; i++)
                cin >> train[i];
            while (B <= num)//限制条件
            {
                //①123正序出站
                //此时数组与数组递增的下标匹配，不必push堆栈              
                if (A == train[B])
                {
                    A++;
                    B++;
                }
                //③321倒序出站,此时数组与堆栈匹配
                else if (!s.empty() && train[B] == s.top())
                {
                    s.pop();
                    B++;
                }
                //②如果不满足正序，则先把123…train[1]压入堆栈，直到找到A == train[B]
                //当A大于num时，就不能push了
                else if (A <= num)
                {
                    s.push(A);
                    A++;
                }
                else
                {
                    judge = 0;
                    break;
                }
            }
            if (judge)
                cout << "Yes" << endl;
            else
                cout << "No" << endl;
        }
        cout << endl;
    }
    return 0;
}
