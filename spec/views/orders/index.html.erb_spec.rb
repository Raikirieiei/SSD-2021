require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        address: "MyText"
      ),
      Order.create!(
        address: "MyText"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
