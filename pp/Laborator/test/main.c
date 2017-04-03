#include<graphics.h>
#include<conio.h>
#include<stdio.h>

void main(void)
{
    int driver=DETECT, mode;
    int xc1=320, yc1=240;


       initgraph(&driver, &mode, "c:\\TC\\bgi" );
         setcolor(7);                     //edge color
         setfillstyle(SOLID_FILL,GREEN);  // fill inside the circle
         circle(xc1,yc1,100);             // create a circle
         floodfill(xc1,yc1,7);            // flood color
     getch();
    closegraph();
}
