package algo

func quick_sort(q []int, l int, r int) {
	if l > r {
		return
	}

	i, j, x := l, r, q[0]

	for i < j {

		for q[i] >= x {
			i ++
		}

		for q[j] <= x {
			j --
		}
		
		if i < j {
			q[i], q[j] = q[j], q[i]
		}
	}

	quick_sort(q, l, j)
	quick_sort(q, j+1, r)
}