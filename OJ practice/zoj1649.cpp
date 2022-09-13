//r不止一个，应该用a来找r
#include <iostream>
#include <cstring>
#include <stdio.h>
#include <queue>
using namespace std;
char prison[201][201];
bool havegone[201][201];//到过则为1，没到过则为0
int N, M;
struct Case{
    int n, m, t;
};
/*优先队列 减少检索*/
bool operator < (const Case& a, const Case& b)
{
    if (a.t > b.t)return true;
    else return false;
}
/*搜索函数 返回时间*/
int bfs(Case begin)
{
    priority_queue<Case> q;//将队列安排为函数的全局变量，如此每次输入则不必操作清空队列
    q.push(begin);
    while (q.empty() == 0)//当队列不为空
    {
        Case a = q.top();
        q.pop();
        //上下左右
        int x[4] = { a.m ,   a.m ,   a.m - 1,a.m + 1 };//x轴对应列
        int y[4] = { a.n - 1,a.n + 1,a.n,    a.n };//y轴对应行
        for (int i = 0; i < 4; i++)
        {
            //判断此移动是否合法
            if (y[i] < N && y[i] >= 0 && x[i] < M && x[i] >= 0 && havegone[y[i]][x[i]] == 0)
            {
                Case f;
                char p = prison[y[i]][x[i]];
                f.n = y[i];
                f.m = x[i];
                f.t = a.t;
                havegone[y[i]][x[i]] = 1;
                if (p == '.')//如果是道路
                {
                    f.t += 1;
                    q.push(f);
                }
                else if (p == 'x')//如果遇到了坏人
                {
                    f.t += 2;
                    q.push(f);
                }
                else if (p == 'r')//如果遇到了队友
                    return a.t + 1;
                //遇到墙则不做处理
            }
        }
    }
    return -1;
}
int main()
{
    Case begin;
    while (cin >> N >> M)
    {
        memset(prison, '\0', sizeof(prison));//重置数组
        memset(havegone, 0, sizeof(havegone));
        for (int i=0; i < N; i++)
            for (int j = 0; j < M; j++)
            {
                scanf("%1s", &prison[i][j]);//用%c的话会把'\n'也赋值进去
                if (prison[i][j] == 'a')
                {
                    begin.n = i;
                    begin.m = j;
                    begin.t = 0;
                }
            }
        int time=bfs(begin);
        if (time != -1)
            cout << time << endl;
        else
            cout << "Poor ANGEL has to stay in the prison all his life." << endl;
    }
    return 0;
}
