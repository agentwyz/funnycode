package main

import (
	"container/list"
	"fmt"
)



func main() {
	l := list.New()
	l.PushBack("cons")
	l.PushBack(67)

	fmt.Println(l.Front().Value)
}