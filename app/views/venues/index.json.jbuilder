json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :phone, :email, :contact_name, :description, :aasm_state
  json.url venue_url(venue, format: :json)
end
