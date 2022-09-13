#include <iostream>
#include <stdio.h>
using namespace std;
int main()
{
    int i, a[32], n[10], o,j,j1;
    cin >> i;
    for (o = 0;o < i;o++)
        cin >> n[o];
    for(o = 0;o < i;o++)
    {
        for (j = 0;j < 32;j++)
            a[j] = 0;
        for (j = 0;;j++)
        {
            a[j] = n[o] % 2;
            n[o] = n[o] / 2;
            if (n[o] == 0)break;
        }
        for (j1=0;j1<=j;j1++)
        {
            if (a[j1] == 1) {
                cout << j1;
                if (j1 != j)cout << " ";
            }
        }
        if(o!=i-1)cout << endl;
    }
    return 0;
}

