require 'spec_helper'

describe "venues/show" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :name => "Name",
      :phone => "Phone",
      :email => "Email",
      :contact_name => "Contact Name",
      :description => "MyText",
      :aasm_state => "Aasm State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Aasm State/)
  end
end
