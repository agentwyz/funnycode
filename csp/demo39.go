package csp

func test() {
	num := 10
	sign := make(chan struct{}, num)

	for i := 0; i < num; i += 1 {
		go func() {
			fmt.Println(i)
			sign<-struct{}{}
		}()
	}

	for j := 0; j <= num; j += 1 {
		<-sign
	}
}