require 'rails_helper'

RSpec.describe "entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(
        :place => "Place"
      ),
      Entry.create!(
        :place => "Place"
      )
    ])
  end

  it "renders a list of entries" do
    render
    assert_select "tr>td", :text => "Place".to_s, :count => 2
  end
end
