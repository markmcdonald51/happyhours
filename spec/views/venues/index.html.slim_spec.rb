require 'spec_helper'

describe "venues/index" do
  before(:each) do
    assign(:venues, [
      stub_model(Venue,
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :contact_name => "Contact Name",
        :description => "MyText",
        :aasm_state => "Aasm State"
      ),
      stub_model(Venue,
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :contact_name => "Contact Name",
        :description => "MyText",
        :aasm_state => "Aasm State"
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
  end
end
