!SLIDE full-page smbullets

# Half Sync / Half Async #

* __Maximizes resource utilization__ through a dedicated thread pool for synchronous library calls
* __Works well where some of the work done in callback can be blocking__
* For C extensions that do implement rb_thread_select() correctly, but where the scheduler would get in the way
* __Sync component__: fast network I/O, manage buffers and handoff data to ...
* __Async component / thread pool__: perform blocking reads, inserts etc.

<p class="notes">
</p>