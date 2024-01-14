Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins %r{\Ahttps://localhost:4200/*\z}
    resource '*', 
    headers: :any, 
    methods: [:get, :post, :patch, :put]
  end
end