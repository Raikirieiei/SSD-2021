require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        tag: "Tag",
        description: "Description"
      ),
      Category.create!(
        tag: "Tag",
        description: "Description"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: "Tag".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
  end
end
