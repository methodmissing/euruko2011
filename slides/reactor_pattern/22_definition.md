!SLIDE full-page smbullets

# Reactor Pattern - Definition #

* __Ticks__ - main loop with a tick quantum
* __Notified to do work by lower level subsystems__
* Separates event detection from event processing
* Events are generated from the the execution thread the event loop runs on
* __Primarily for solving the c10k problem__

<p class="notes">
Readiness for reading, readiness for writing, readiness for accepting.

Avoids signals and thread based timer mechanisms on most platforms.

Not limited to sockets.Can observe filesystem events, spawn processes, perform work at time intervals / ticks.

We'll focus on socket I/O
</p>
