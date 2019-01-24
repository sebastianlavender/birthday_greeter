require 'timecop'

feature 'page design' do

  scenario 'checks that it has welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome!'
  end

  scenario 'checks it asks for the persons date of birth' do
    visit('/')
    expect(page).to have_content 'What is your birthday?'
  end

  scenario 'checks it asks for the persons name' do
    visit('/')
    expect(page).to have_content 'What is your name?'
  end
end

feature 'birthday' do

  before do
    Timecop.freeze(Date.today)
  end

  after do
    Timecop.return
  end

  scenario 'checks that a users birthday is today' do
    visit('/')
    fill_in('name', with: 'Dave')
    fill_in('date', with: 24)
    select("January", from: "month").select_option
    click_button('Submit')
    expect(page).to have_content('Happy Birthday Dave!!!')
  end

  scenario 'checks how long it is till my birthday' do
    visit('/')
    fill_in('date', with: 26)
    select("January", from: "month").select_option
    click_button('Submit')
    expect(page).to have_content('Your birthday is in 2 days')
  end

  scenario 'lets use know if date entered isn\'t a date' do
    visit('/')
    fill_in('date', with: 31)
    select("February", from: "month").select_option
    click_button('Submit')
    expect(page).to have_content('INCORRECT DATE ENTERED')
  end

end
