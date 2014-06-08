require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :contact_name => "MyString",
      :description => "MyText",
      :aasm_state => "MyString"
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_phone[name=?]", "venue[phone]"
      assert_select "input#venue_email[name=?]", "venue[email]"
      assert_select "input#venue_contact_name[name=?]", "venue[contact_name]"
      assert_select "textarea#venue_description[name=?]", "venue[description]"
      assert_select "input#venue_aasm_state[name=?]", "venue[aasm_state]"
    end
  end
end
