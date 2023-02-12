package main

import "fmt"


type a struct {
	//c int = 1
	//b a = a{c: 1}
}

func new() a{
	return a{}
}

func main() {
	var a byte = 'a';
	fmt.Printf("%T", a)
}