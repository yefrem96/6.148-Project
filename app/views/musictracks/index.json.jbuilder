json.array!(@musictracks) do |musictrack|
  json.extract! musictrack, :id, :name, :location, :length, :user_id
  json.url musictrack_url(musictrack, format: :json)
end
