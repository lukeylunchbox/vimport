# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


category = Category.create!([{label: "machinery"}])
proposal = Proposal.create!([{product_name: "Electric Skateboard", description: "3000w, electric skateboard", cost_per_unit: 2000.0, weight_per_unit: 8.2, min_order_quantity: 25, full_order_quantity: 500, eta: "12 weeks", img1_data: "http://via.placeholder.com/350x150", img2_data: "http://via.placeholder.com/350x150", img3_data: "http://via.placeholder.com/350x150", user_id: 1, category_id: 1}])