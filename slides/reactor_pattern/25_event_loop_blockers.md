!SLIDE full-page smbullets

# Event loop blockers #

* __CPU bound code / hot loops__
* Connects
* Hostname lookups (crappy DNS)
* __Synchronous blocking I/O__
* Involuntarily context switches (Ruby VM, interrupts etc.)
* Page faults
* __Garbage Collection__

<p class="notes">
</p>