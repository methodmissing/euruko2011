!SLIDE full-page smbullets

# Relation to OO Patterns #

* Like the __Observer__ pattern, but a __single mapping__ / binding between producer and consumer
* __Decoupled responsibilities__ - very simple to test
* __Open-closed principle__ - adding new event handlers don't affect existing ones

<p class="notes">
Like observers, but never a fan out

Event generation is not coupled to the dispatch event handler.We can ignore or stub them out during
testing.

Can develop an application almost entirely without transport
</p>