package example

type Int interface {
	int | int8 | int16
}

type Uint interface {
	uint | uint8 | uint16 
}

type Float interface {
	float32 | float64
}


type Tint interface {
	~int | ~int8 | ~int16
}

/*
~后面的类型不能为接口
~后面的类型必须为基本类型
*/

func main() {
	type Slice[T Int] []T
	
	var s1 Slice[int]
	type MyInt int

	var s2 Slice[MyInt]
}