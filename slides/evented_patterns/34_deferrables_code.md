!SLIDE full-page code

    @@@ruby
    m = EM::Protocols::SmtpClient.send(...)
    m.callback{ p :sent }   # happy path
    m.errback{|e| raise e } # error path
    m.timeout(5) # we expect either in < 5 seconds
    method_call