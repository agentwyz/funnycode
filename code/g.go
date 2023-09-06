package code

/*
为什么golang不支持继承
*/

type A struct {
	name string
	age int
}

type B struct {
	A
	id int
}

func main()  {
	
}