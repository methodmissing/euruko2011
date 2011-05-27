!SLIDE full-page code

    @@@c
    int
    rb_thread_select(max, read, write, except, timeout)
        int max;
        fd_set *read, *write, *except;
        struct timeval *timeout;
    {
