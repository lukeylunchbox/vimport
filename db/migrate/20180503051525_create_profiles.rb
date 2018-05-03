class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_street_number
      t.string :home_street_name
      t.string :home_suburb
      t.string :home_city
      t.string :home_state
      t.string :home_post_code
      t.string :home_country
      t.string :ship_street_number
      t.string :ship_street_name
      t.string :ship_suburb
      t.string :ship_city
      t.string :ship_state
      t.string :ship_post_code
      t.string :ship_country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
