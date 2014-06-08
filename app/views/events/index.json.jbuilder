json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :addmission_charge, :started_at, :expired_at, :schedule, :venue_id, :aasm_state
  json.url event_url(event, format: :json)
end
