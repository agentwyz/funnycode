package example

import "fmt"

func Add[T int | float32 | float64](a T, b T) T {
	return a + b
}

func sub(a T, b T) T {
	return a + b
}

func test() {
	Add[int](1, 2)
	Add[float32](1.0, 1.2)

	fmt.Print(sub(1, 2))
}


//方法上的泛型
type A struct {
	name string
}

//方法不支持泛型
func (a *A[T]) add(a T, b T) T {
	
}