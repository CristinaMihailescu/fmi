#include <fstream>
#include <cmath>
using namespace std;
long long i,n;
struct nume{long long x,y;}v[100000001],Min,p,S;
ifstream f("antitir.in");
ofstream g("antitir.out");
int main()
{
    f>>n;
    f>>Min.x>>Min.y;
    v[1].x=Min.x; v[1].y=Min.y;
    for(i=2;i<=n;i++)
    {
        f>>v[i].x>>v[i].y;
        if(v[i].x<Min.x) Min.x=v[i].x;
        if(v[i].y<Min.y) Min.y=v[i].y;
    }
    if(Min.x<0 || Min.y<0)
    {
        for(i=1;i<=n;i++)
        {
            if(v[i].x==0 && v[i].y==0)
            {
                v[i].x=-Min.x;
                v[i].y=-Min.y;
            }
            else {if(v[i].x==0)
            {
                if(Min.y<0) {v[i].y=v[i].y-Min.y; v[i].x=v[i].x-Min.x;}
                else {v[i].y=v[i].y+Min.y; v[i].x=v[i].x+Min.x;}
            }
            else if(v[i].y==0)
            {
                if(Min.x<0) {v[i].x=v[i].x-Min.x; v[i].y=v[i].y-Min.y;}
            else {v[i].x=v[i].x+Min.x; v[i].y=v[i].y+Min.y;}
            }
            else {
            if(Min.x<0) v[i].x=v[i].x-Min.x;
            else v[i].x=v[i].x+Min.x;
            if(Min.y<0) v[i].y=v[i].y-Min.y;
            else v[i].y=v[i].y+Min.y;}}
        } //translatare
    }
    p.x=p.y=S.x=S.y=0;
    for(i=1;i<=n;i++)
    {
        p.x=p.x+v[i].x;
        p.y=p.y+v[i].y;
    }
    p.x=p.x/n;
    p.y=p.y/n; //aflu coord punctului cautat
    for(i=1;i<=n;i++)
    {
        if(v[i].x-p.x>0) S.x=S.x+v[i].x-p.x;
        else S.x=S.x-(v[i].x-p.x);
        if(v[i].y-p.y>0) S.y=S.y+v[i].y-p.y;
        else S.y=S.y-(v[i].y-p.y);
    } //translatare => p(0,0)
    g<<S.x+S.y;
    return 0;
}
