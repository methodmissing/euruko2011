!SLIDE full-page smbullets

# FIX #

* Financial Information eXchange
* Optimized streams of FIX messages: header, body, trailer
* __Simple message parsed as per spec and then converted to an object graph__
* Market data subscriptions is extremely variable
* __Requirement for interleaved processing__
* __Watch out for compact wire protocols__

<p class="notes">
Converting wire messages to complex object graphs in Ruby is not very efficient.

Large chunks of data that needs to be sliced.

GC pressure.

Fast markets batch updates result in a smaller on CPU:wall time ratio.

Wavy throughput.
</p>