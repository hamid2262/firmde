json.array!(@kundens) do |kunden|
  json.extract! kunden, :id, :name, :url, :photo, :photo_gray
  json.url kunden_url(kunden, format: :json)
end
