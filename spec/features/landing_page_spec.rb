require 'rails_helper'

feature "the landing page" do
  scenario "a user that is not logged in sees the login form" do
    visit('/')
    expect(find('form')).to have_content('Password')
  end

  pending "a user can login using the form" do
    user = User.create(username: "johndoe", email: "jdoe@email.com", password: "password")
    visit('/')
    fill_in('Username or email', with: 'johndoe')
    fill_in('Password', with: 'password')
    click_button('Login')
    expect(session[:user_id]).to_eq user.id
  end

  scenario "a user that is logged in gets redirected" do
    User.create(username: "johndoe", email: "jdoe@email.com", password: "password").id
    visit('/')
    fill_in('Username or email', with: 'johndoe')
    fill_in('Password', with: 'password')
    click_button('Login')
    visit('/')

    expect(current_path).to eq '/cohorts'
  end
end
