json.host_name host_name
json.events  @events do |event|
  json.timestamp event.created_at.to_s
  json.action event.action
  json.hostname event.hostname
end