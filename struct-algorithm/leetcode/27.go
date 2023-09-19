package lc

func removeElement(nums []int, val int) int {
	var size = len(nums)
	for i := 0; i < size; i += 1 {
	  //如果等于就更新一下
	  if nums[i] == val {
		//从当前位置一直向后进行更新
		for j := i + 1; j < size; j += 1 {
		  nums[j - 1] = nums[j]
		}
		i--
		size--
	  }
	}
	return size
}

func removeElement(nums []int, val int) int {
  var slowindex = 0
  for fastindex := 0; fastindex < len(nums); fastindex += 1 {
	//只在当前位置更新
	if val != nums[fastindex] {
      nums[slowindex] = nums[fastindex];
      slowindex += 1
    }
  }
  
  //slowindex 更新的次数就是最终的次数
  return slowindex
}