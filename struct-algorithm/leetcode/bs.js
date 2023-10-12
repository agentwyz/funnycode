function bs(arr, target) {
    
    let left = 0;
    let right = arr.length-1;
    
    while (left < right) {
        let mid = (left + right) / 2;

        if (arr[mid] >= target) {
            right = mid;
        } else {
            left = mid - 1;
        }
    }

    if (arr[left] == target) {
        return left
    } else {
        return null
    }
}