function find(x, q) {
    //如果集合存储的值和它的下标相等, 
    //就说明找到了根节点
    if (q[x] == x) {
        return q[x]
    }

    else {
        //如果不是根节点, 那么就是子节点
        q[x] = find(q[x], q);
        return q[x];
    }
}

function merge(q, a, b) {
    //找到根节点, 然后让根节点
    q[find(a, q)] = find(b, q);
    return q;
}