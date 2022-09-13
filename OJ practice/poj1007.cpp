// 1007.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//AC了太开心了

#include <iostream>
#include <cstring>
#include <stdio.h>
using namespace std;
struct DNA
{
    char s[50];
    int measure;
}d[100];
int n, m;
/*计算*/
int calculate(char *dna)
{
    int sum = 0,i=0;
    for (; i < n; i++)
    {
        if (dna[i] != 'A')
            for (int j = i + 1; j < n; j++)
                if (dna[j] < dna[i])sum++;
    }
    return sum;
}
/*快速排序算法 小在前，大在后*/
void quick_sort(int begin, int end)
{
    //终止条件
    if (begin >= end)return;
    //一般情况
    DNA p = d[begin];//基准值
    int i = begin;
    int j = end;
    while (j > i)
    {
        //从右往左寻找比基准值小的值
        while (d[j].measure>p.measure && j > i)
            j--;
        //从左往右寻找比基准值大的值
        while (d[i].measure<=p.measure && j > i)
            i++;
        if (j > i)
        {
            DNA temp = d[i];
            d[i] = d[j];
            d[j] = temp;//使用结构体的好处：可直接置换，不必使用strcpy
        }
    }
    d[begin] = d[i];
    d[i] = p;
    //进行下一步递归
    quick_sort(begin, i - 1);
    quick_sort(i + 1, end);
}
int main()
{
    cin >> n >> m;
    for (int i = 0; i < m; i++)
    {
        cin >> d[i].s;
        d[i].measure=calculate(d[i].s);
    }
    quick_sort(0, m - 1);
    for (int i = 0; i < m; i++)
        cout << d[i].s << endl;
    return 0;
}
