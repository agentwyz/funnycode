void* ngx_alloc(size_t size, ngx_log_t* log) 
{
    void* p;

    //分配一段内存
    p = malloc(size);
    if (p == NULL) {
        ngx_log_error();
    }

    ngx_log_debug2();

    return p;
}


void* ngx_calloc(size_t size, ngx_log_t* log)
{
    void* p;
}