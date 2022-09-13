#include <iostream>
#include <stdio.h>
#include <queue>
using namespace std;
struct position {
    char p1;
    int p2;
    int n;
}a,b;
queue<position> f;
int in(position c)
{
    int i;
    const int x[8] = { 1,2,2,1,-1,-2,-2,-1 };
    const int y[8] = { 2,1,-1,-2,-2,-1,1,2 };
    position d[8];
    for (i = 0; i < 8; i++)
    {
        d[i].p1 = c.p1 + x[i];
        d[i].p2 = c.p2 + y[i];
        d[i].n = c.n + 1;
        if (d[i].p1 == b.p1 && d[i].p2 == b.p2)
            return d[i].n;
        //棋子不能跳出棋盘所以要限定范围
        else if (d[i].p1 > 96 && d[i].p1 < 105 && d[i].p2>0 && d[i].p2 < 9)
            f.push(d[i]);
    }
    return 0;
}
int main()
{
    a.n = 0; b.n = 0;
    int num;
    while (scanf("%1s%d %1s%d", &a.p1, &a.p2, &b.p1, &b.p2)!=EOF)
    {
        num=0;
        if((a.p1!=b.p1||a.p2!=b.p2)&&f.empty())
        {
            f.push(a);
            while (num == 0)
            {
                num = in(f.front());
                f.pop();
            }
            while (!f.empty())//清空队列
                f.pop();
        }
        cout << "To get from " << a.p1 << a.p2 << " to " 
            << b.p1 << b.p2 << " takes " << num << " knight moves." << endl;
        f.empty();
    }
    return 0;
}

