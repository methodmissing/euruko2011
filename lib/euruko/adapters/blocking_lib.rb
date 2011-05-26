class Euruko::Adapters::BlockingLib
  def call(env)
    timer = EM.add_periodic_timer(0.1){}
    MYSQL.query("SELECT sleep(1) as result")
    timer.cancel
    [200, {'Content-Type' => 'text/plain'}, "done"]
  end
end