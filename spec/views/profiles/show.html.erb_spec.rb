require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :home_street_number => "Home Street Number",
      :home_street_name => "Home Street Name",
      :home_suburb => "Home Suburb",
      :home_city => "Home City",
      :home_state => "Home State",
      :home_post_code => "Home Post Code",
      :home_country => "Home Country",
      :ship_street_number => "Ship Street Number",
      :ship_street_name => "Ship Street Name",
      :ship_suburb => "Ship Suburb",
      :ship_city => "Ship City",
      :ship_state => "Ship State",
      :ship_post_code => "Ship Post Code",
      :ship_country => "Ship Country",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Home Street Number/)
    expect(rendered).to match(/Home Street Name/)
    expect(rendered).to match(/Home Suburb/)
    expect(rendered).to match(/Home City/)
    expect(rendered).to match(/Home State/)
    expect(rendered).to match(/Home Post Code/)
    expect(rendered).to match(/Home Country/)
    expect(rendered).to match(/Ship Street Number/)
    expect(rendered).to match(/Ship Street Name/)
    expect(rendered).to match(/Ship Suburb/)
    expect(rendered).to match(/Ship City/)
    expect(rendered).to match(/Ship State/)
    expect(rendered).to match(/Ship Post Code/)
    expect(rendered).to match(/Ship Country/)
    expect(rendered).to match(//)
  end
end
