json.array!(@elements) do |element|
  json.extract! element, :id, :tag, :klass, :body, :href, :x, :y, :speed, :start, :easing, :photo
  json.url element_url(element, format: :json)
end
