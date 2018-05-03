require 'rails_helper'

RSpec.describe "proposals/index", type: :view do
  before(:each) do
    assign(:proposals, [
      Proposal.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :cost_per_unit => "9.99",
        :weight_per_unit => "9.99",
        :min_order_quantity => 2,
        :full_order_quantity => 3,
        :eta => "Eta",
        :img1_data => "MyText",
        :img2_data => "MyText",
        :img3_data => "MyText",
        :User => nil,
        :Category => nil
      ),
      Proposal.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :cost_per_unit => "9.99",
        :weight_per_unit => "9.99",
        :min_order_quantity => 2,
        :full_order_quantity => 3,
        :eta => "Eta",
        :img1_data => "MyText",
        :img2_data => "MyText",
        :img3_data => "MyText",
        :User => nil,
        :Category => nil
      )
    ])
  end

  it "renders a list of proposals" do
    render
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Eta".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
