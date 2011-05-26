!SLIDE full-page smbullets

# Privileges and execution #

* __User Mode__: sandboxed execution without direct access to system resources, user memory only
* __Kernel Mode__: no access restrictions to resources, access to all system memory
* Processes spend the vast majority of time in User Mode (usr VS sys CPU time)
* Privileged access required to memory and IO devices
* __System calls__ - portable "protected" function calls
* __Context switch__ between User and Kernel space (expensive)

<p class="notes">
The Kernel doesn't need to validate itself

An extra layer between the application and the hardware

Easier programming - secure and portable (mostly)

System calls are much more expensive than a function call in the same process
</p>
  