$:.unshift(File.expand_path('lib'))
require 'euruko'

desc "Start server"
task :server do
  exec "bundle exec rackup -s thin -p 8000"
end

desc "Trace server"
task :trace_server do
  exec "dtruss -p #{Euruko.server_pid}"
end

traces = Dir.entries('traces').grep(/\.d$/)
namespace :trace do
  traces.each do |trace|
    trace.gsub!(/(\.d)$/, '')
    #desc "Trace #{trace}"
    task trace do
      Euruko.run(trace, ENV["DRY"] == nil)
    end
  end
end

desc "Kernel / user space switches"
task :context_switch do
  ENV["URI"] = "/render"
  ENV["REQUESTS"] = "1000"
  Rake::Task["trace:cpu"].invoke
end

desc "Non-Blocking I/O"
task :non_blocking_io do
  ENV["URI"] = "/render"
  ENV["REQUESTS"] = "1000"
  Rake::Task["trace:syscall_errors"].invoke
end

desc "Reactor events"
task :reactor do
  ENV["URI"] = "/render"
  ENV["REQUESTS"] = "1000"
  Rake::Task["trace:flow"].invoke
end

desc "Blocking on CPU"
task :blocking_cpu do
  ENV["URI"] = "/cpu_bound"
  ENV["REQUESTS"] = "1"
  Rake::Task["trace:blocking_cpu"].invoke
end

desc "Blocking on CPU - iterator"
task :blocking_cpu0 do
  ENV["URI"] = "/iterator"
  ENV["REQUESTS"] = "1"
  Rake::Task["trace:blocking_cpu"].invoke
end

desc "Blocking on I/O"
task :blocking_io do
  ENV["URI"] = "/blocking_lib"
  ENV["REQUESTS"] = "5"
  Rake::Task["trace:blocking_io"].invoke
end

desc "Blocking on I/O - pooled"
task :blocking_io0 do
  ENV["URI"] = "/non_blocking_lib"
  ENV["REQUESTS"] = "5"
  Rake::Task["trace:blocking_io"].invoke
end

desc "Write queue latency, large response"
task :write_queue_large do
  ENV["URI"] = "/large_response"
  ENV["REQUESTS"] = "100"
  Rake::Task["trace:write_queue_latency"].invoke
end

desc "Write queue latency, small response"
task :write_queue_small do
  ENV["URI"] = "/render"
  ENV["REQUESTS"] = "100"
  Rake::Task["trace:write_queue_latency"].invoke
end