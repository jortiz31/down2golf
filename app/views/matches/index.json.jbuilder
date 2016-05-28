json.array!(@matches) do |match|
  json.extract! match, :title, :course, :timeanddate, :id
  json.url match_url(match, format: :json)
end
