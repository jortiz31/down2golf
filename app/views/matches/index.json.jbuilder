json.array!(@matches) do |match|
  json.extract! match, :title, :course_id, :timeanddate
  json.url match_url(match, format: :json)
end
