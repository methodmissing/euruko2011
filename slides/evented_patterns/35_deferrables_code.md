!SLIDE full-page code

    @@@ruby
    m = EM::Protocols::SmtpClient.send(...)
    m.callback{ p :sent }   # happy path
    m.errback{|e| raise e } # error path
    m.timeout(5) # expect either in < 5 seconds

    # continue thread of execution
    method_call