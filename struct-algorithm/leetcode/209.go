package lc

func minSubArrayLen(target int, nums []int) int { 
	result := 1000000000
	sum := 0
	sublength := 0
	
	for i := 0; i < len(nums); i += 1 {
		sum = 0

		for j := i; j < len(nums); j += 1 {
			sum += nums[j]

			if sum >= target {
				sublength = j - i + 1
				result = boolexpr(result, sublength)
				break
			}
		}
	}

	if result == 1000000000 {
        return 0
    } else {
        return result
    }
}

func boolexpr(result int, sublength int)  int {
	if result < sublength {
		result = result
	} else {
		result = sublength
	}

	return result
}