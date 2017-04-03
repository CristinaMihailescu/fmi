#include <fstream>
using namespace std;
ifstream f("secv.in");
ofstream g("secv.out");

int main()
{
    int n, i;
    f>>n;
    int x[n+1];
    for(i=1; i<=n; i++)
        f>>x[i];
    g<<n;
    return 0;
}
