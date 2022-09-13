//特殊情况：要报数的是第一个人
/*用双向链表实现*/
#include <iostream>
#include <stdio.h>
using namespace std;
struct kid
{
    char name[20];//名字
    kid* last;
    kid* next;
};
int main()
{
    int N, S, W;
    while (scanf("%d", &N) != EOF)
    {
        kid start;
        cin >> start.name;
        kid* head = &start, * p1 = new kid, * p2 = 0;
        head->next = p1;
        p1->last = head;
        for (int i = 2; i <= N; i++)
        {
            cin >> p1->name;
            p2 = p1;
            p1 = new kid;
            p2->next = p1;
            p1->last = p2;
        }
        p2->next = head;//每一个next操作要紧跟一个last操作
        head->last = p2;
        delete p1;
        scanf("%d,%d", &W, &S);
        kid* find = head;
        int i=1;
        while (i != W)
        {
            find = find->next;
            i++;
        }
        int sum = 0;//记录已经报出了多少个名字
        for (int j = 1; sum < N; j++ )
        {
            if ( j % S == 0)
            {
                cout << find->name << endl;
                sum++;
                find->last->next = find->next;
                find->next->last = find->last;
                //kid* d = find;
                find = find->next;
                //delete d;
            }
            else
                find = find->next;
        }
    }
    return 0;
}
