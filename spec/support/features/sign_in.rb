module Features
  def sign_in(username, password)
    visit new_session_path

    fill_in "Username", with: username
    fill_in "Password", with: password
    click_button "Sign in"
  end
end
