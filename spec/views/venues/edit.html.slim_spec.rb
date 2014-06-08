require 'spec_helper'

describe "venues/edit" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :contact_name => "MyString",
      :description => "MyText",
      :aasm_state => "MyString"
    ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do
      assert_select "input#venue_name[name=?]", "venue[name]"
      assert_select "input#venue_phone[name=?]", "venue[phone]"
      assert_select "input#venue_email[name=?]", "venue[email]"
      assert_select "input#venue_contact_name[name=?]", "venue[contact_name]"
      assert_select "textarea#venue_description[name=?]", "venue[description]"
      assert_select "input#venue_aasm_state[name=?]", "venue[aasm_state]"
    end
  end
end
