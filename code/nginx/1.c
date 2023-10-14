/*
nginx内存池数据结构
*/
typedef struct ngx_pool_s{
    ngx_pool_data_t d;              /*内存池的数据区域*/
    size_t max;                    /*最大每次分配内存*/
    ngx_pool_t* current;          /*指向当前内存池指针地址, ngx_pool_t链表上最后一个缓存池*/
    ngx_chain_t* chain;           /*缓冲区链表*/
    ngx_pool_large_t* large;      /*存储大数据的链表*/
    ngx_pool_cleanup_t* cleanup;  /*可自定义回调函数, 清除内存块分配的内存*/
    ngx_log_t* log;               /*日志文件*/
} ngx_pool_t;

/*
数据区域结构
*/
typedef struct {
    u_char* last;                   /*内存池中未使用内存的开始节点*/
    u_char* end;                    /*内存池的结束地址*/
    ngx_pool_t* next;               /*指向下一个内存池*/
    ngx_uint_t failed;              /*失败次数*/
} ngx_pool_data_t;

/*
大数据块结构
*/
typedef struct ngx_pool_large_s {
    ngx_pool_large_t* next;     /*指向下一个存储地址*/
    void* alloc;                /*数据块指针地址*/
} ngx_pool_large_t;



typedef struct ngx_pool_cleanup_s {
    ngx_pool_cleanup_pt handler;   /*清理的回调函数*/
    void* data;                    /*清理存储的数据地址*/
    ngx_pool_cleanup_t* next;     /*下一个ngx_pool_cleanup_t*/               
} ngx_pool_cleanup_t;