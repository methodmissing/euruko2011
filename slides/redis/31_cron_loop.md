!SLIDE full-page smbullets

# Redis server cron loop #

* Fires every 100ms
* Throttles expiry for timed out keys (master only)
* Uses 1 ms per server cron loop for rehashing keys
* Modula 50 for logging server stats
* Close timed out clients
* Background saving if enabled

<p class="notes">
</p>