require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :title => "MyString",
      :description => "MyText",
      :addmission_charge => "9.99",
      :schedule => "MyText",
      :venue => nil,
      :aasm_state => "MyString"
    ).as_new_record)
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_title[name=?]", "event[title]"
      assert_select "textarea#event_description[name=?]", "event[description]"
      assert_select "input#event_addmission_charge[name=?]", "event[addmission_charge]"
      assert_select "textarea#event_schedule[name=?]", "event[schedule]"
      assert_select "input#event_venue[name=?]", "event[venue]"
      assert_select "input#event_aasm_state[name=?]", "event[aasm_state]"
    end
  end
end
