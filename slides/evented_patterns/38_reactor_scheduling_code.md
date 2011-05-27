!SLIDE full-page code

    @@@ruby
    # call from reactor thread
    EM.defer do
      # block called async on a thread pool
    end

    # call from thread pool
    EM.schedule do
      # block called on the reactor thread
    end

<p class="notes">
We don't know to which thread work has been deferred.
</p>