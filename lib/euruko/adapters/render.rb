class Euruko::Adapters::Render
  TEMPLATE = %[
    <% 3.times do |n| %>
    * <%= n %>
    <% end %>
  ]

  def call(env)
    rendered = ERB.new(TEMPLATE).result
    [200, {'Content-Type' => 'text/plain'}, rendered]
  end
end