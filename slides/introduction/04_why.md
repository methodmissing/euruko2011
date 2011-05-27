!SLIDE full-page smbullets

# Why ? #

* Popular production tooling in the Ruby ecosystem is event driven
* Nginx, Eventmachine, Redis, 0MQ, rb_thread_select()
* __Intentional__ seeking enhance throughput or better resource utilization
* __Incidental__ use through dependencies.DANGER!!!
* State of the community at large
* __Inverted flow control and scheduling is hard__

<p class="notes">
Event driven tooling has found it's way into most production Ruby deployments.
Components include Nginx, Eventmachine, Redis, 0MQ as well as the interpreter's own rb_thread_select() I/O scheduler.

We can split into two groups, intentional and incidental users.

Intentional users are seeking to enhance service throughput or realize better resource utilization.
They would understand very well the end goal, but could still be tripped up by some edge cases.

Many users are exposed to Eventmachine through a dependency tree of a library pulled into their software stack.Might have an event loop firing up in their process without even being aware of it.

There's a large signal to noise ratio in the Ruby community, especially through explosive growth during the last few years - lots with a web development background building core backend services.I'm one of them, but learn't (and am still learning) a bunch of stuff the hard way.

Blogs - it's easy to have opinions, scientific method is hard though.Too much experimentation propogate
to production systems.
</p>  