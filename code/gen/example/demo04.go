package example

type MySlice[T int | float32] []T

func (s MySlice[T]) sum() T {
	var sum T

	for _, value := range s {
		sum += value
	}

	return sum
}


type Queue[T any] struct {
	elements []T
}
