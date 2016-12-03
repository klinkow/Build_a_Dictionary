require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
  it('will enter the main page and add a new word to the list') do
    visit('/')
    fill_in('new_word', :with => 'cat')
    click_button('Add New Word')
    expect(page).to have_content('cat')
  end
end

describe('the whole site path', {:type => :feature}) do
  it('will enter the main page and add two new words to the list, then follow the second word to the definitions page and add two new definitions') do
    visit('/')
    fill_in('new_word', :with => 'cat')
    click_button('Add New Word')
    fill_in('new_word', :with => 'dog')
    click_button('Add New Word')
    click_on("dog")
    fill_in('new_definition', :with => "an animal that barks")
    click_button('Add Definition')
    fill_in('new_definition', :with => "an animal that chases its tail")
    click_button('Add Definition')
    expect(page).to have_content("an animal that barks")
  end
end
