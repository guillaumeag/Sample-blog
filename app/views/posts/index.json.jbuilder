json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :created_at, :updated_at, :published
  json.url post_url(post, format: :json)
end
