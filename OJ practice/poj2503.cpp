#include <iostream>
#include <cstring>
#include <stdio.h>
using namespace std;
struct Dictionary
{
    char word1[12];
    char word2[12];
}d[100001];//字典
char f[12];//要找的词
/*快速排序  从a到z*/
void quick_sort(int begin, int end)//参数为数组下标
{
    //终止条件
    if (begin >= end)return;
    //一般情况
    Dictionary p = d[begin];//基准值
    int i = begin;
    int j = end;
    while (j > i)
    {
        //从右往左寻找比基准值小的值
        while (strcmp(d[j].word2,p.word2)>0 && j > i)
            j--;
        //从左往右寻找比基准值大的值，此处出现=
        while (strcmp(d[i].word2, p.word2) <= 0 && j > i)
            i++;
        if (j > i)
        {
            Dictionary temp=d[i];
            d[i] = d[j];
            d[j] = temp;//使用结构体的好处：可直接置换，不必使用strcpy
        }
    }
    d[begin] = d[i];
    d[i] = p;
    //进行下一步递归
    quick_sort( begin, i - 1);
    quick_sort( i + 1, end);
}
/*二分查找  返回数组下标*/
int quick_search(int low, int high)//参数为数组下标
{
    int mid;
    while (low <= high)
    {
        mid = (low + high) / 2;
        int cmp = strcmp(f, d[mid].word2);
        if (cmp == 0)return mid;
        else if (cmp < 0)//说明f比b[mid]小，在左边
            high = mid - 1;
        else//说明f比b[mid]大，在右边
            low = mid + 1;
    }
    //如果找不到
    return -1;
}
int main()
{
    int num=0;
    char line[255];
    /*cin.getline(字符数组名，字符长度）*/
    cin.getline(line, 255);//将字符长度从12改为255就ac了，也不清楚为什么
    while (strcmp(line, "") != 0)
    {
        int i;
        for (i = 0; line[i] != ' '; i++)
            d[num].word1[i] = line[i];
        d[num].word1[i] = '\0';
        i++;
        int j;
        for (j = 0; line[i] != '\0'; j++, i++)
        {
            d[num].word2[j] = line[i];
        }
        d[num].word2[j] = '\0';
        num++;
        cin.getline(line, 255);
    }
    quick_sort(0, num-1);
    while (scanf("%s", &f) != EOF)
    {
        int position = quick_search(0, num-1);
        if (position != -1)
            printf("%s\n", &d[position].word1);
        else printf("eh\n");
    }
    return 0;
}
