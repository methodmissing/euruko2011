# In the Loop - Euruko 2011 #

Tracing scripts, HTTP endpoints and slides for [In the Loop - Euruko 2011](http://euruko2011.org/agenda.html)

## Dependencies ##

* Gemfile should be all you need
* Patched Eventmachine - [https://github.com/methodmissing/eventmachine/tree/dtrace](https://github.com/methodmissing/eventmachine/tree/dtrace)
* Patched Redis - [https://github.com/methodmissing/redis/tree/euruko](https://github.com/methodmissing/redis/tree/euruko)
* [showoff](https://github.com/schacon/showoff) for the slides

## HOWTO ##

There's a bunch of rake tasks defined for instrumentation

    methodmissing:euruko lourens$ rake -T
    rake blocking_cpu       # Blocking on CPU
    rake blocking_cpu0      # Blocking on CPU - iterator
    rake blocking_io        # Blocking on I/O
    rake blocking_io0       # Blocking on I/O - pooled
    rake context_switch     # Kernel / user space switches
    rake non_blocking_io    # Non-Blocking I/O
    rake reactor            # Reactor events
    rake server             # Start server
    rake trace_server       # Trace server
    rake write_queue_large  # Write queue latency, large response
    rake write_queue_small  # Write queue latency, small response

Start up a HTTP server in another Terminal :

    methodmissing:euruko lourens$ rake server
    /Users/lourens/.rvm/gems/ruby-1.8.7-p334@rails3/bundler/gems/eventmachine-c455a9579106/lib/em/version.rb:2: warning: already initialized constant VERSION
    >> Thin web server (v1.2.11 codename Bat-Shit Crazy)
    >> Maximum connections set to 1024
    >> Listening on 0.0.0.0:8000, CTRL+C to stop

## Have fun! ##