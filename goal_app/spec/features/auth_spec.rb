require 'spec_helper'
require 'rails_helper'


feature 'the signup process' do
   
  # background(:each) do #similar to before
  #   visit new_user_path 
  # end
  scenario 'has a new user page' do
    visit new_user_path
     expect(page).to have_content('Create new user!')
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      user=FactoryBot.build(:user)
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.username)
    end
  end

end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_user_path 
    expect(page).to have_content("Username")
  end  
end

feature 'logging out' do
  scenario 'begins with a logged out state' do 
    visit new_user_path
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    click_button('submit!')
    
  end  

  scenario 'doesn\'t show username on the homepage after logout' do 
    user=FactoryBot.build(:user)
    expect(current_path).to eq(new_user_path)
    expect(page).not_to have_content(user.username)   

  end  

end