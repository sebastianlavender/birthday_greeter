feature 'page design' do
  scenario 'checks that it asks for the persons name' do
    visit('/')
    expect(page).to have_content 'Please enter your name'
  end
end
