package main

import (
	"fmt"
	"sync"
)

func coordinateWaitGroup() {
	var wg sync.WaitGroup
	wg.Add(2)

	num := int32(0)
	fmt.Printf("The number: %d [with sync.WaitGroup]\n", num);

	max := int32(10)

	go addNum(&num, 1, max, func(){
		//其它阻塞
		sign<-struct{}{}
	})

	go addNum(&num, 2, max, func(){
		sign<-struct{}{}
	})

	<-sign
	<-sign
}

func main() {

}