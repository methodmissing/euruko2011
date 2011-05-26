class Euruko::Adapters::NonBlockingLib
  def call(env)
    timer = EM.add_periodic_timer(0.1){}

    response = Thin::AsyncResponse.new(env)
    response.headers['Content-Type'] = 'text/plain'

    EM_MYSQL.query("SELECT sleep(1) as result") do |res,rows|
      response << "done"
      timer.cancel
      response.done
    end

    response.finish
  end
end