require 'rails_helper'

RSpec.describe "proposals/edit", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
      :product_name => "MyString",
      :description => "MyText",
      :cost_per_unit => "9.99",
      :weight_per_unit => "9.99",
      :min_order_quantity => 1,
      :full_order_quantity => 1,
      :eta => "MyString",
      :img1_data => "MyText",
      :img2_data => "MyText",
      :img3_data => "MyText",
      :User => nil,
      :Category => nil
    ))
  end

  it "renders the edit proposal form" do
    render

    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do

      assert_select "input[name=?]", "proposal[product_name]"

      assert_select "textarea[name=?]", "proposal[description]"

      assert_select "input[name=?]", "proposal[cost_per_unit]"

      assert_select "input[name=?]", "proposal[weight_per_unit]"

      assert_select "input[name=?]", "proposal[min_order_quantity]"

      assert_select "input[name=?]", "proposal[full_order_quantity]"

      assert_select "input[name=?]", "proposal[eta]"

      assert_select "textarea[name=?]", "proposal[img1_data]"

      assert_select "textarea[name=?]", "proposal[img2_data]"

      assert_select "textarea[name=?]", "proposal[img3_data]"

      assert_select "input[name=?]", "proposal[User_id]"

      assert_select "input[name=?]", "proposal[Category_id]"
    end
  end
end
