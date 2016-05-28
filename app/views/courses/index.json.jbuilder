json.array!(@courses) do |course|
  json.extract! course, :name, :location, :price, :url, :image, :id
  json.url course_url(course, format: :json)
end
