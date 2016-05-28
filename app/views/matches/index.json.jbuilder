json.array!(@matches) do |match|
  json.extract! match, :title, :course, :timeanddate
  json.url match_url(match, format: :json)
end
