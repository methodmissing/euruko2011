#!/usr/bin/env rackup -s thin -p 8000

$:.unshift(File.expand_path('lib'))
require 'euruko'

use Rack::CommonLogger
use Euruko::Tracer

# Thin::AsyncResponse::Marker fails Rack::Lint in recent Rack releases
class Rack::Lint
  def call(env)
    if env["async.callback"]
      @app.call(env)
    else
      dup._call(env)
    end
  end
end

map '/cpu_bound' do
  run Euruko::Adapters::CpuBound.new
end
map '/iterator' do
  run Euruko::Adapters::Iterator.new
  pp self
end
map '/blocking_lib' do
  run Euruko::Adapters::BlockingLib.new
end
map '/non_blocking_lib' do
  run Euruko::Adapters::NonBlockingLib.new
end
map '/render' do
  run Euruko::Adapters::Render.new
end
map '/large_response' do
  run Euruko::Adapters::LargeResponse.new
end