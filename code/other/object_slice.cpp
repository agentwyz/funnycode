#include <iostream>

using namespace std;

enum class shape_type {
    circle,
    triangle,
    rectangle,
};

class shape {
    public:
    shape() {
        puts("this is shape");
    }
};

class circle : public shape {
    public:
    int a = 1;
    circle() {
        puts("this is a circle");
    }
};

class triangle : public shape {
    public:
    triangle() {
        puts("this is a trangle");
    }
};

class rectangle : public shape {
    public:
    rectangle() {
        puts("this is a rectangle");
    }
};

shape* create_shape(shape_type type)
{
    switch (type) {
    case shape_type::circle:
        return new circle();
    case shape_type::triangle:
        return new triangle();
    case shape_type::rectangle:
        return new rectangle();
    default:
        return new shape();
    }
}

int main() {
    
    //首先会自动调用父类构造函数创建this, 然后调用调用子类构造函数
    shape* s = create_shape(shape_type::circle);
    cout << s->a;
}