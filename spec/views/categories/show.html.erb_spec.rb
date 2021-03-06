require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      tag: "Tag",
      description: "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Description/)
  end
end
