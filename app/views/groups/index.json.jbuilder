json.array! @albums do |album|
  json.id album.id
  json.content album.content
  json.date album.date
  json.title album.title
  json.group_id album.group_id
end