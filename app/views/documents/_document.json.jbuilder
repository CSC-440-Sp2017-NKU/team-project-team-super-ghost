json.extract! document, :id, :filename, :content_type, :file_contents, :created_at, :updated_at
json.url document_url(document, format: :json)
