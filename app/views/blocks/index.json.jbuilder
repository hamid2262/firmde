json.array!(@blocks) do |block|
  json.extract! block, :id, :title, :body, :css_classes, :css_id
  json.url block_url(block, format: :json)
end
