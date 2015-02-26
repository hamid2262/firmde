json.array!(@sub_pages) do |sub_page|
  json.extract! sub_page, :id, :title, :seo_title, :body, :page_id, :order, :slug
  json.url sub_page_url(sub_page, format: :json)
end
