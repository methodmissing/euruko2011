!SLIDE full-page code

    @@@ruby
    while true do
      set_current_time    # update loop time
      run_timers          # trigger timers
      add_new_descriptors # attach new fds
      modify_descriptors  # update fd state
      break if terminate? # conditional loop break
    end