json.extract! comment, :id, :title, :body, :created_at, :updated_at, :author
json.url post_url(post, format: :json)
