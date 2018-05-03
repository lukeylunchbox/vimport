require 'rails_helper'

RSpec.describe "proposals/show", type: :view do
  before(:each) do
    @proposal = assign(:proposal, Proposal.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Eta/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
