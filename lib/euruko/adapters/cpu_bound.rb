class Euruko::Adapters::CpuBound
  WORK = %w(euruko ruby conference 2011 berlin)

  def call(env)
    timer = EM.add_periodic_timer(0.1){}
    WORK.each{|w| BCrypt::Password.create(w) }
    timer.cancel
    [200, {'Content-Type' => 'text/plain'}, "done"]
  end
end