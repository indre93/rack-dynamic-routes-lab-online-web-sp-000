class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.params["item"]

      if @@item.include?(search_term)
        @@item.each do |item|
          resp.write "#{item.name}, #{item.price}"
        end
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
