!SLIDE full-page smbullets

# Blocking I/O #

* Sequential I/O
* __May block the requesting thread depending on kernel buffer state__
* __read(8, 500)__ - Kernel read buffer < 500, or timeout
* __write(8, 500)__ - Kernel write buffer free space < 500, or timeout

<p class="notes">
For the rest of this talk, we're doing event driven non-blocking I/O
</p>