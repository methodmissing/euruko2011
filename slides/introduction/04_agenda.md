!SLIDE full-page smbullets

# Agenda #

* Not covering a particular implementation, but a bias towards Eventmachine
* Back to basics
* Ruby I/O scheduling
* Reactor pattern
* Evented patterns
* Case Study - FIX

<p class="notes">
The patterns are important, not differences in semantics between projects - each have their own capabilities, optimizations etc.

We need to agree on a few basic definitions before digging in.
Modern UNIX system execution modes, resources, and how I/O

Scheduling and execution on the Ruby VM - MRI 18 specific only.No Fiber magic in this talk.

An overview of the Reactor Pattern, sweet spots, pitfalls and it's use cases in high throughput backend services.What NOT to do.

Contrast Eventmachine with Redis, a single threaded evented server with a few tricks up it's sleeve.

A brief case study from a past financial services project.
</p>