require "rails_helper"

feature "sign in" do

  context "user doesn't have an account" do

    scenario "user is directed to sign up form after trying to log in" do
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Sign up"
    end

    scenario "user can sign up using form" do
      sign_up
      expect(page).to have_content "Eingeloggt als samedsdad@mail.com"
    end
    scenario "user can add information about himself during the sign up process" do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Description", with: "a company existing since 1990"

    end
  end

  context "user has an account" do
    before do
      visit "/users/sign_up"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Description", with: "a company existing since 1990"
      click_button "Sign up"
    end

    scenario "user can login" do
      click_link "Abmelden"
      visit "/"
      fill_in "Email", with: "samedsdad@mail.com"
      fill_in "Password", with: "password"
      click_button "Log in"
      expect(page).to have_content "Eingeloggt als samedsdad@mail.com"
    end

    scenario "user can see sign out link" do
      expect(page).to have_link "Abmelden"
    end

    scenario "user can visit his profile" do
      click_link("Mein Profil")
      expect(page). to have_content ("Hello samedsdad@mail.com a company existing since 1990")
    end

end
end
