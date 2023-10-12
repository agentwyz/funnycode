function sort(arr, left, right) {
    if (left >= right) {
        return
    }

    let i = 0, j = arr.length; 
    
    while (i < j) {

        do {
            i++;
        } while(q[i] < x);

        do {
            j--;
        } while(q[i] > x);

    }

    sort(arr, left, j);
    sort(arr, j+1, right);
}