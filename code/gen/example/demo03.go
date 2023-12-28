package example

//一种子类型
type Wow[T int | string] int

func test() {
	//三种形式
	var a Wow[int]= 123
	var b Wow[string] = "hello"
}

/*
泛型类型的套娃
*/

type Slice[T int|string|float32|float64] []T
type FloatSlice[T float32 | float64] Slice[T]
type IntAndStringSlice[T int|string] Slice[T]


//匿名结构体不支持泛型
testCase := struct[T string|int] {
	caseName string
	got T
	want T
}[int]{
	caseName: "test OK",
	got: 100,
	want: 100
}