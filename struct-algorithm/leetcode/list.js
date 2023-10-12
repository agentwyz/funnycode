class List {
    constructor() {
        this.head = -1;
        this.e = [];
        this.ne = [];
        this.idx = 0;
    }

    addHead(x) {
        let idx = this.idx;
        this.e[idx] = x;
        this.ne[idx] = this.head;
        this.head = idx;
        this.idx++;
    }

    add(k, x) {
        let idx = this.idx;
        this.e[idx] = x;
        this.ne[idx] = this.ne[k];
        this.ne[k] = idx;
        this.idx++ 
    }

    //删除的是k后面的
    remove(k) {
        this.ne[k] = this.ne[this.ne[k]]
    }
}

var lst = new List();
lst.addHead(1)