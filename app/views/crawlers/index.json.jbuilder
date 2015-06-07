json.array!(@crawlers) do |crawler|
  json.extract! crawler, :id, :ip, :head
  json.url crawler_url(crawler, format: :json)
end
