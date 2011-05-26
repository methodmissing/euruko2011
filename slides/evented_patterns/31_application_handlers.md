!SLIDE full-page smbullets

# Application level handlers #

* Binds __high level events__ to handlers
* Connection read, connection accepted, disconnected etc.
* __Events occur async, but handled synchronously__
* Responsibilities: __decoding__, __perform services__, __write data back out to queue__
* Multi-method notification interface

<p class="notes">
Always called on the reactor thread - if they need to schedule to a worker thread pool, adds to the
per event processing overhead.

Method called for each supported event.

Reactor and Dispatcher has context of what occurred and can invoke the callback function directly
</p>