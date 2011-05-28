!SLIDE full-page smbullets

# Scheduler pitfalls #

* __Limited context and awareness__ - OS is the best scheduler
* Works best with __O_NONBLOCK set__ on file descriptors
* Scheduler doesn't guarantee your thread would run if select() detects a readable / writeable fd
* __Extensions frequently do this wrong__: rb_thread_wait_fd(fd), rb_thread_fd_writable(fd) etc.
* mysql gem

<p class="notes">
</p>