//最开始的设计
function Car(name, age) {
    this.name = name;
    this.age = age;
}

var car = new Car();


//基于原型链的设计
function Device() {
    this.xxx = "xxx";
}

//基于原型链实现的继承
Car.prototype = new Device();

console.log(car instanceof Device);

class B {
    constructor() {

    }
    add() {

    }
}

class A extends B {
    constructor() {
        super();

    }
    static add() {
        super.add()
    }
}