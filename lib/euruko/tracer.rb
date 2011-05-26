class Euruko::Tracer
  def initialize(app, opts = {})
    @app = app
  end

  def call(env)
    ret = nil
    EM.trace(env['PATH_INFO']){ ret = @app.call(env) }
    ret
  end
end