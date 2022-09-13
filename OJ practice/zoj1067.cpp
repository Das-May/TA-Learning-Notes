//这是一道检索题
//输入16组参考颜色，接着输入映射颜色，输入-1 -1 -1代表截止输入
//输出 距离 映射颜色 “最近的” 16组参考颜色之一

#include <iostream>
#include <stdio.h>
#include <cmath>//开根号sqrt必须加上cmath头文件，否则编译错误
//原来vs是自动给我们带上了camth，然而在别的编译器不加是不行的
using namespace std;
int main()
{
    int a[16][3];
    int i;
    for (i = 0;i < 16;i++)
    {
        cin >> a[i][0] >> a[i][1] >> a[i][2];
    }
    int b[3];
    while (scanf("%d %d %d", &b[0], &b[1], &b[2]) != 0)
    {
        if (b[0] == -1 && b[1] == -1 && b[2] == -1)
            return 0;
        else
        {
            double d, min = 255 * 1.73;
            int p = 0;
            for (i = 0;i < 16;i++)
            {
                d=sqrt((a[i][0]-b[0])* (a[i][0] - b[0])+
                    (a[i][1] - b[1]) * (a[i][1] - b[1])+
                    (a[i][2] - b[2]) * (a[i][2] - b[2]));
                if (d < min) {
                    p = i;
                    min = d;
                }
            }
            cout << "(" << b[0] << "," << b[1] << "," << b[2] << ") maps to ("
                << a[p][0] << "," << a[p][1] << "," << a[p][2] << ")"<<endl;
        }
    }
    return 0;
}
