json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :last_name, :email, :phone, :company_name, :company_email, :company_phone, :active
  json.url sponsor_url(sponsor, format: :json)
end
