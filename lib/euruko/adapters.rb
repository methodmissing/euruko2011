# Adapter deps
require 'thin/async'
require 'em_mysql2_connection_pool'
require 'bcrypt'
require 'erb'

Mysql2::Client.default_query_options.merge!(:symbolize_keys => true)

CONN_OPTS = { :socket => '/opt/local/var/run/mysql5/mysqld.sock', :reconnect => true, :async => true }
EM_MYSQL = EmMysql2ConnectionPool.new(CONN_OPTS)
MYSQL = Mysql2::Client.new(CONN_OPTS)

module Euruko::Adapters
  autoload :BlockingLib, 'euruko/adapters/blocking_lib'
  autoload :NonBlockingLib, 'euruko/adapters/non_blocking_lib'
  autoload :CpuBound, 'euruko/adapters/cpu_bound'
  autoload :Render, 'euruko/adapters/render'
  autoload :LargeResponse, 'euruko/adapters/large_response'
  autoload :Iterator, 'euruko/adapters/iterator'
end