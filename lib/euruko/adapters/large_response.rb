class Euruko::Adapters::LargeResponse
  RESPONSE = "sdsdj3298ru948ru403uf08u2rt2ewiojfowejr98ewrew" * 1000

  def call(env)
    [200, {'Content-Type' => 'text/plain'}, RESPONSE]
  end
end