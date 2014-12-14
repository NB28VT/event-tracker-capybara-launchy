require 'rails_helper'


describe "Creating Events" do
  it "displays the location text after creation" do
    visit '/events'
    click_link "New Event"
    txt = "My Place"
    fill_in "event[location]", :with => txt
    click_button "Create Event"
    expect(page).to have_content(txt)
    save_and_open_page
  end
end


feature "User creates a new event" do

  # As a User
  # I want to create a new Event
  # So that other users can find the Event
  #
  # Acceptance Criteria:
  #
  # * I must provide a location

  it "creates a valid event" do
    visit '/events/new'
    fill_in "Location", with: "Launch Academy"
    click_on "Create Event"

    expect(page).to have_content "Event was successfully created"
  end

  it "requries a location" do
    visit '/events/new'

    click_on "Create Event"

    expect(page).to have_content "can't be blank"
  end


end
