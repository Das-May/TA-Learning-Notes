#include <iostream>
#include <cstring>
using namespace std;
char a[500], b[500];//定义全局变量字符数组接收input
int c[1000][1000];
int max2(int a, int b)
{
    if (a > b) return a; return b;
}
int Count(int n, int m)
{
    if (c[n][m] >= 0) return c[n][m];//算过了，就返回
    if ((n == 0) || (m == 0)) { c[n][m] = 0; return 0; }
    //n=m=0说明到头了，没得找了
    if (a[n - 1] == b[m - 1])
        c[n ][m] = Count(n - 1, m - 1) + 1;
    else
    {
     c[n-1][m] = Count(n - 1, m);
     c[n ][m-1] = Count(n, m-1);
     c[n][m] = max2(c[n - 1][m], c[n][m - 1]);//建立二叉树的关键
    }
}
int main()
{
    memset(c, -1, sizeof(c));
    for (int i = 0; i < 500; i++) 
    {
        c[i][0] = 0;
        c[0][i] = 0;
    }
    while (cin >> a >> b)
    {
        int lena = strlen(a), lenb = strlen(b);
        cout << Count(lena, lenb) <<endl;
        memset(c, -1, sizeof(c));
        for (int i = 0; i < 500; i++)
        {
            c[i][0] = 0;
            c[0][i] = 0;
        }
    }
    return 0;
}