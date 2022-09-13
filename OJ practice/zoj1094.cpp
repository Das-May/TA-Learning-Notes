//求最大值，采用深度优先搜索
#include <iostream>
#include <stack>
#include <stdio.h>
using namespace std;
struct matrix
{
    int r, c;
}m[26];
stack <matrix> s;
int n;
int calculate(matrix a, matrix b)
{
    if (a.c == b.r)
    {
        matrix c = { a.r ,b.c };
        s.push(c);
        return a.r * a.c * b.c;
    }
    else return -1;
}
int main()
{
    cin >> n;
    int i;
    char c;
    for (i = 0; i < n; i++)
        cin >>c>> m[i].r >> m[i].c;
    char in[100];
    int num = 0;
    int sum = 0;
    while (scanf("%s",&in)!=EOF)
    {
        while (!s.empty())
            s.pop();
        num = 0;
        sum = 0;
        if (in[0] == '(')
        {
            for (i = 1; in[i] != '\0'; i++)
            {
                if (in[i] >= 'A' && in[i] <= 'Z')
                    s.push(m[in[i] - 'A']);
                else if (in[i] == ')')
                {
                    matrix a = s.top();
                    s.pop();
                    matrix b = s.top();
                    s.pop();
                    num = calculate(b, a);
                    if (num == -1)break;
                    sum += num;
                }
            }
            if (num == -1)   cout << "error" << endl;
            else cout << sum << endl;
        }
        else cout << "0" << endl;
    }
    return 0;
}
