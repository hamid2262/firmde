json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :category, :slug, :body, :user_id, :photo
  json.url blog_url(blog, format: :json)
end
