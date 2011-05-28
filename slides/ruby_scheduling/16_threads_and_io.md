!SLIDE full-page smbullets

# The Ruby 1.8 situation #

* User space green threads are scheduled by the VM
* __Fast context switches__, but strong coupling between threads and I/O
* __rb_thread_select()__ wraps the __select(5)__ system call by invoking the scheduler on blocking I/O
* The green thread currently on CPU is put to sleep on blocking I/O
* Yields control to another
* Rescheduled by the VM when the file descriptor's readable or writable.

<p class="notes">
</p>