!SLIDE full-page smbullets

# I/O Buffering #

* File descriptors have buffers for reading and writing
* Application (User Space) buffer and a Kernel buffer
* __Decouples__ I/O layers
* __Throttles__ transfer rates
* Avoid data corruption
* __Performance__: reduce context switches and concurrent read or write to buffers

<p class="notes">
Nothing's going to happen if the Kernel's buffers aren't being drained / filled.

Addresses speed mismatches between producer and consumer (fast network, slow disk).

Guards against application changes and swapping (double buffering).

Unbuffered input would switch for each transferred byte.We want an optimal balance between filling/draining buffers
and the cost of context switches.
</p>