//我做了一个上午（三个小时），AC了，我也自闭了

#include <iostream>
#include <cstring>//zoj中，不加cstring头文件不能用memset
using namespace std;
short int f[2][1001];
int i=2;
//函数定义：f(0)=1,f(1)=1,f(2)=2,f(3)=3,f(4)=5,f(5)=8
//用户定义：f(1)=1,f(2)=1,f(3)=2,f(4)=3,f(5)=5,f(6)=8
//高精加     数是倒序储存的
void add(int nb)
{
    int b = nb % 2, a = (nb - 1) % 2;//c要储存在a里
    //计算数的位数，得到的是最高位的数组位置
    int lena = 999, lenb = 999;
    while (f[a][lena] == 0) { lena--; }
    while (f[b][lenb] == 0) { lenb--; }
    //相加
    int p, maxlen;
    lena > lenb ? maxlen = lena : maxlen = lenb;
    for (p = 0; p<maxlen+2; p++)
    {
        f[a][p] += f[b][p];//针对以后为0的情况，使用+=
        //如果此位大于9，则进位
        if (f[a][p] > 9)
        {
            f[a][p+1] += f[a][p] / 10;
            f[a][p] %= 10;
        }
    }
}

int main()
{

    int n,m;
    while (cin >> m)
    {
        n = m + 1;
        memset(f, 0, sizeof(f));
        f[0][0] = 1;
        f[1][0] = 1;
        i = 2;
        for (; i < n; i++)//从已知的最高位开始，叠加叠加叠加
        {
            add(i - 1);//求c=f(i)=f(i-1)+f(i-2)=b+a
        }
        //计算目标数的长度,得到的是最高位的数组位置
        int len = 999;
        while (f[i%2][len] == 0)
            len--;
        //数是倒序储存的，所以要倒序输出
        for (; len >= 0; len--)
        {
            cout << f[i % 2][len];
        }
        cout << endl;
    }
    return 0;
}
