!SLIDE full-page smbullets

# Complexity #

* Base resources : __CPU__, __memory__ and __I/O devices__
* __Modern systems are complex__
* No black box deployments, but the cloud and datacenters
* __Network__: the above __resources, elsewhere__
* Exposing / consuming APIs over network introduces additional __complexity in both the service and client__
* We want a software stack that's resilient to variance and resource contention - __everything can and will degrade__

<p class="notes">
Even the smallest of products and projects have huge full-system critical paths.

Most often production deployments are not limited by any single resource, but by interactions between resources and the complex software that ties it all together.

Micro benchmarks on individual subsystems OR single boxes is useless.

Those with cloud deployments are familiar with variable QOS.

Clients aren't always well behaved and not all services are designed for scale.
</p>  