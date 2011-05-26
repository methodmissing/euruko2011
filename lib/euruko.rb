require 'eventmachine'
require 'pp'

EM.kqueue
EM.set_descriptor_table_size 10_000

module Euruko
  SERVER_PORT = 8000

  autoload :Client,     'euruko/client'
  autoload :Server,     'euruko/server'
  autoload :HttpClient, 'euruko/http_client'
  autoload :Tracer,     'euruko/tracer'
  autoload :Adapters,   'euruko/adapters'

  def run(metric, trace)
    raise 'DTrace requires superuser privileges - please run as root' unless Process.uid == 0
    client_pid = EM.fork_reactor do
      EM.add_timer(1){ Euruko::Client.run(ENV["REQUESTS"] || 100, ENV["URI"] || '/') }
    end
    exec("dtrace -Zvqs traces/#{metric}.d -p #{server_pid}") if trace
  end

  def server_pid
    o = `lsof -i:#{Euruko::SERVER_PORT}`
    raise("Server not listening on port #{Euruko::SERVER_PORT}!") if o.empty?
    o.split("\n")[1].split[1].to_i
  end

  def dtrace_pid
    o = `ps aux | grep dtrace`.split("\n").grep(/dtrace -Zvqs/).shift
    raise("Tracing process not running!") unless o
    o =~ /root\s*(\d*)\s*/
    $1.to_i
  end
  extend self
end