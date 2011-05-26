module Euruko::Client
  REQUEST_OPTIONS = {:host => '127.0.0.1', :port => Euruko::SERVER_PORT}
  URIS = %w(blocking_lib complex_render cpu_bound deferred_blocking_lib generic iterator large_response
            non_blocking_lib tick_loop)

  %w(INT TERM QUIT).each do |sig|
    trap(sig){ stop(sig) }
  end

  def run(requests = 100, uri = '/')
    requests.to_i.times{ request(uri) }
  end

  def stop(sig = nil)
    Euruko::HttpClient::CONNS.each{|r| r.unbind }
    Process.kill(:INT, Euruko.dtrace_pid) rescue nil
    EM.add_timer(1){ EM.stop }
  end
  private
  def request(uri)
    uri = "/#{URIS[rand(URIS.size)]}" if uri == 'random'
    Euruko::HttpClient.request(REQUEST_OPTIONS.merge(:request => uri)).errback{|e| EM.stop }
  end

  extend self
end