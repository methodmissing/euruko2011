!SLIDE full-page smbullets

# Buffers #

* Eventable descriptors should fill/drain kernel buffers asap
* __Connection#send_data does NOT immediately send data to the remote peer__
* Outbound pages are scheduled on a write queue
* Written out sometime in the near feature
* __Vectored I/O__ with the writev(3) syscall
* Atomically writes data from multiple buffers to a single stream

<p class="notes">
Written on the current or a few ticks from now, depending on the outbound connection page size.

Vectored I/O saves allocation and memcpy() overhead
</p>