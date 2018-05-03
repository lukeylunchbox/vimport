json.extract! profile, :id, :first_name, :last_name, :home_street_number, :home_street_name, :home_suburb, :home_city, :home_state, :home_post_code, :home_country, :ship_street_number, :ship_street_name, :ship_suburb, :ship_city, :ship_state, :ship_post_code, :ship_country, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
