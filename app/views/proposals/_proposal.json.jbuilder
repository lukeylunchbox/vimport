json.extract! proposal, :id, :product_name, :description, :cost_per_unit, :weight_per_unit, :min_order_quantity, :full_order_quantity, :eta, :img1_data, :img2_data, :img3_data, :User_id, :Category_id, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
