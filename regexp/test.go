package main

import (
	"fmt"
	"container/list"
)

type obj struct {
	value int
}

func (this *obj) eq(ob interface{}) {
	if this == ob {
		//fmt.Println(ob.(*obj))
		fmt.Println("is same")
	} else {
		fmt.Println("not same")
	}

	token := ob.(*obj)
	fmt.Println(token.value)
}



func main() {
	a := obj{value: 1}
	b := obj{value: 1}
	a.eq(&a)
	a.eq(&b)
	//fmt.Printf("%p\n", &a)
	//fmt.Printf("%p\n", &b)
	//fmt.Println(a == b)


}

