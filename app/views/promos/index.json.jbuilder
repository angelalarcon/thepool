json.array!(@promos) do |promo|
  json.extract! promo, :id, :name, :lapse, :year
  json.url promo_url(promo, format: :json)
end
