json.array!(@developers) do |developer|
  json.extract! developer, :id, :name, :last_name, :email, :phone, :address, :why_hack, :scholarship, :why_scholarship
  json.url developer_url(developer, format: :json)
end
