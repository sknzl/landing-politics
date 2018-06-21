require "application_system_test_case"

class PartiesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector ".card", count: Party.count
  end
end
