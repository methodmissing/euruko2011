!SLIDE full-page smbullets

# Non-blocking I/O #

* Sequential I/O - __NOT ASYNC__- read or write happens in user space
* __Only initiates the I/O operation if it won't block the requesting thread__
* Notified of partial or no initiation
* __O_NONBLOCK___ flag changes fd behavior
* __read(2)__ and __write(2)__ returns __EAGAIN__ or __EWOULDBLOCK__ if not able to read/write data

<p class="notes">
</p>