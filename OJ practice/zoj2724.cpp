//Message queue is the basic fundamental of windows system.For each process, 
//the system maintains a message queue.If something happens to this process, 
//such as mouse click, text change, the system will add a message to the queue.
//Meanwhile, the process will do a loop for getting message from the queue according 
//to the priority value if it is not empty.Note that the less priority value means 
//the higher priority.In this problem, you are asked to simulate the message queue 
//for putting messages toand getting message from the message queue.
//
//Sample Input
//
//GET
//PUT msg1 10 5
//PUT msg2 10 4
//GET
//GET
//GET
//Sample Output
//
//EMPTY QUEUE!
//msg2 10
//msg1 10
//EMPTY QUEUE!

//题目是优先输出最小值
#include <iostream>
#include <stdio.h>
#include <queue>
#include <cstring>
using namespace std;
struct d
{
    char s[5];//记录是第几个msg
    int n;
    int val;//记录数值
};
bool operator<(const d& a, const d& b)//重新定义优先关系，最小值优先
{
    if (a.val > b.val)return true;
    else return false;
}
int main()
{
    priority_queue <d> msg;//定义massage优先队列
    char order[3];
    d example;
    int i;
    while (scanf("%s", order) != EOF)
    {
        if (strcmp(order, "GET") == 0)
        {
            if (!msg.empty())
            {
                printf("%s %d\n", msg.top().s, msg.top().n);
                msg.pop();
            }
            else
                printf("EMPTY QUEUE!\n");
        }
        else if (strcmp(order, "PUT") == 0)
        {
            scanf("%s %d %d", &example.s, &example.n, &example.val);
            msg.push(example);
        }
    }
    return 0;
}