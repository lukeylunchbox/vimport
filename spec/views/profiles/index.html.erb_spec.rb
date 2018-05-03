require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
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
      ),
      Profile.create!(
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
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Home Street Number".to_s, :count => 2
    assert_select "tr>td", :text => "Home Street Name".to_s, :count => 2
    assert_select "tr>td", :text => "Home Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Home City".to_s, :count => 2
    assert_select "tr>td", :text => "Home State".to_s, :count => 2
    assert_select "tr>td", :text => "Home Post Code".to_s, :count => 2
    assert_select "tr>td", :text => "Home Country".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Street Number".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Street Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Ship City".to_s, :count => 2
    assert_select "tr>td", :text => "Ship State".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Post Code".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Country".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
