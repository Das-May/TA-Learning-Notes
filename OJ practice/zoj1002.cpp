//啊感谢老师的建议，AC了

#include <iostream>
#include <stdio.h>
using namespace std;
//对于题目的数据要求，我们一般不用[4][4]来说明数据的规模，而是把空间容量稍微开大一点
char a[6][6];
int m;//最多可以放置的房子数
int square;
/*判断能不能放*/
bool caninput(int x, int y)
{
    //既然算法是每个位置都要做出发点进行搜索处理，只需要检查该位置左方以及上方即可。
    /*上*/
    for (int i = 0; i < square; i++)
    {
        if (a[x][y - i] == 'o' && y - i >= 0)return 0;
        if (a[x][y - i] == 'X' && y - i >= 0)break;
    }
    /*左*/
    for (int i = 0; i < square; i++)
    {
        if (a[x - i][y] == 'o' && x - i >= 0)return 0;
        if (a[x - i][y] == 'X' && x - i >= 0)break;
    }
    return 1;//如果能放，则返回1
}
/*一遍遍尝试  递归算法*/
void put(int k, int sum)
{
    if(sum>m)m = sum;
    //如果已经超界了，就结束
    //超界的情况是k=square*square,因为下标是从0开始处理的
    if (k >= square * square)return;
    else
    {
        int x = k / square;
        int y = k% square;
        if (a[x][y]=='.'&&caninput(x,y))//如果还能放
        {
            a[x][y] = 'o';//放个房子
            put(k+1, sum + 1);
            a[x][y] = '.';//记得拿掉
        }
        put(k+1, sum);
    }
}
int main()
{
    int i, j;
    while (scanf("%d", &square) != EOF&& square !=0)
    {
        for (i = 0; i < square; i++)//行数
            for (j = 0; j < square; j++)//列数
                scanf("%c", &a[i][j]);//用scanf控制字符数
        //其实可以buyong%1s,用%c
        put(0, 0);
        cout << m << endl;
        m = 0;
    }
    return 0;
}
