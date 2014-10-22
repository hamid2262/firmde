json.array!(@pages) do |page|
  json.extract! page, :id, :title, :body, :photo, :parent_id, :slug
  json.url page_url(page, format: :json)
end
