package main

import "fmt"

/*
如果你经常要分别为不同的类型写完全相同逻辑的代码，
那么使用泛型将是最合适的选择
*/

//定义泛型集合
type Slice[T int|float32|float64] []T

type MyMap[Key int|string, Value float32|float64] map[Key]Value

type MyStruct[T int | string] struct {
	Name string
	Data T
}

type IPrintData[T int|float32|string] interface {
	Print(data T)
}

type MyChan[T int | string] chan T


//定义泛型函数
func Add[T int|float64](a T, b T) T {
	return a + b
}


func main() {
	
	var a = Add(1, 2)
	var b = Add(1.2, 1.3)
	var c Slice[int] = []int {1, 2, 3, 4}
	var d Slice[float64]

}

