!SLIDE full-page smbullets

# Limitations #

* Inverted flow control (__callbacks__) is hard (ditto for debugging)
* __SMP__ - the event loop don't scale to multiple cores*
* __Event handlers is called synchronously__
* Half Sync / Half Async pattern could work very well, but requires careful consideration
* __Demultiplexer limitations__
* All external services accessed needs to be through __non-blocking libraries__ as well.

<p class="notes">
Most of the audience would be familiar with this from node.js fame

Not really appropriate for most web application frameworks as they tend to express business logic
synchronously.

Most implementations only support an event loop per process or core

Work done in handlers is pegged to a single core on an SMP system

Limitations of the underlying demultiplexer implementation eg. select, epoll and kqueue

Language ecosystem may not have an array of non-blocking library implementations.Watch out for "em-*" gems.
</p>