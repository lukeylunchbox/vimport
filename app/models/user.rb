class User < ApplicationRecord
  after_create :create_profile
  has_many :proposals
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def create_profile
    Profile.create!([
      {first_name: "",
      last_name: "",
      home_street_number: "",
      home_street_name: "",
      home_suburb: "",
      home_city: "",
      home_state: "",
      home_post_code: "",
      home_country: "",
      ship_street_number: "",
      ship_street_name: "",
      ship_suburb: "",
      ship_city: "",
      ship_state: "",
      ship_post_code: "",
      ship_country: "",
      user_id: self.id}
    ])
  end
end
