require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :home_street_number => "MyString",
      :home_street_name => "MyString",
      :home_suburb => "MyString",
      :home_city => "MyString",
      :home_state => "MyString",
      :home_post_code => "MyString",
      :home_country => "MyString",
      :ship_street_number => "MyString",
      :ship_street_name => "MyString",
      :ship_suburb => "MyString",
      :ship_city => "MyString",
      :ship_state => "MyString",
      :ship_post_code => "MyString",
      :ship_country => "MyString",
      :user => nil
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[last_name]"

      assert_select "input[name=?]", "profile[home_street_number]"

      assert_select "input[name=?]", "profile[home_street_name]"

      assert_select "input[name=?]", "profile[home_suburb]"

      assert_select "input[name=?]", "profile[home_city]"

      assert_select "input[name=?]", "profile[home_state]"

      assert_select "input[name=?]", "profile[home_post_code]"

      assert_select "input[name=?]", "profile[home_country]"

      assert_select "input[name=?]", "profile[ship_street_number]"

      assert_select "input[name=?]", "profile[ship_street_name]"

      assert_select "input[name=?]", "profile[ship_suburb]"

      assert_select "input[name=?]", "profile[ship_city]"

      assert_select "input[name=?]", "profile[ship_state]"

      assert_select "input[name=?]", "profile[ship_post_code]"

      assert_select "input[name=?]", "profile[ship_country]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
