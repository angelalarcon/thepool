json.array!(@behaviors) do |behavior|
  json.extract! behavior, :id, :name, :icon_url, :type
  json.url behavior_url(behavior, format: :json)
end
