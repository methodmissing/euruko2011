class Euruko::Adapters::Iterator
  WORK = %w(euruko ruby conference 2011 berlin)

  def call(env)
    timer = EM.add_periodic_timer(0.1){}

    response = Thin::AsyncResponse.new(env)
    response.headers['Content-Type'] = 'text/plain'

    EM::Iterator.new(WORK).each(
      proc{ |w,iter| BCrypt::Password.create(w); iter.next },
      proc{ response << "done"
            timer.cancel
            response.done }
    )

    response.finish
  end
end