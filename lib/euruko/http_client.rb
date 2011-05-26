class Euruko::HttpClient < EventMachine::Protocols::HttpClient
  CONNS = []

  def connection_completed
    super
    CONNS << self
  end

  def receive_data(data)
    super
    CONNS.shift
    Euruko::Client.stop if CONNS.empty?
  end
end