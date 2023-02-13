package main

type Options struct {
	x int
	y int
}

func a(x int, z ...) {

}

func main() {
	a(1,2, 3)
}