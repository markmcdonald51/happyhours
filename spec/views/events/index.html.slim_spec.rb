require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :description => "MyText",
        :addmission_charge => "9.99",
        :schedule => "MyText",
        :venue => nil,
        :aasm_state => "Aasm State"
      ),
      stub_model(Event,
        :title => "Title",
        :description => "MyText",
        :addmission_charge => "9.99",
        :schedule => "MyText",
        :venue => nil,
        :aasm_state => "Aasm State"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Aasm State".to_s, :count => 2
  end
end
