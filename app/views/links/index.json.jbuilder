json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :description
  json.url link_url(link, format: :json)
end
