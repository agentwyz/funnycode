#include <iostream>

using namespace std;

class Point {
    public:
    int x, y;
    //如果使用默认参数就会隐式的构造对象
    Point(int x=0, int y=0) : x(x), y(y) {}

};

void test(const Point& a)
{
    cout << a.x << a.y << endl;
}


int main() {
    //编译通过了
    test(1);
}