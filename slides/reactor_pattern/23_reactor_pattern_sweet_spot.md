!SLIDE full-page smbullets

# Reactor Pattern - Sweet spot #

* __Soft realtime systems, where throughput is more important than processing__ 
* __NOT about raw speed__, but handling __more concurrent consumers__
* Where __context switching overhead__ for threading implementations is very __high__
* Load profile where there's __minimal on CPU time per request__ - proxies etc.
* Most favorable compared to threaded models as the __ratio of walltime to cpu time increases__

<p class="notes">
Synchronization and context switch overhead becomes significant when we aim to improve scalability, the number of concurrent users a system can handle.

Proxy servers, which basically just relay data - cheap memcpy()

Reproxy support - avoids allocating native Strings to avoid pressure on the GC

The service access other services or infrastructure over network, but request and response processing
consume minimal CPU cycles.

I/O MUST go through the reactor thread
</p>