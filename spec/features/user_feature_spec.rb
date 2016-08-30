require "rails_helper"

feature "sign in" do

  context "user doesn't have an account" do

    scenario "user can can see sign up link" do
      visit "/"
      expect(page).to have_link "Sign up"
    end

    scenario "user is directed to sign up form after trying to log in" do
      visit "/users/sign_in"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Sign up"
    end

    scenario "user can sign up using form" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
      expect(page).to have_content "Currently signed in as samedsdad@gmail.com"
    end
  end

  context "user has an account" do

    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_button "Sign up"
    end

    scenario "user can login" do
      click_link "Sign out"
      visit "/users/sign_in"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Currently signed in as samedsdad@gmail.com"
    end

    scenario "user can see sign out link" do
      expect(page).to have_link "Sign out"
    end
  end
end
