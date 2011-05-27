!SLIDE full-page smbullets

# Reactor Scheduling #

* __I/O only ever goes through the reactor thread__
* Aim to split work across multiple iterations of the reactor (recursive EM.next_tick)
* __EM::TickLoop__ - distributes work across reactor ticks
* __EM::Queue__ - queue abstraction on the reactor scheduler
* __EM::Iterator__ - concurrent async work
* __EM::Channel__ - pub/sub, dequeues on the reactor thread

<p class="notes">
Little / no time waiting on I/O - event detection should always amount to work being ready to go.
</p>