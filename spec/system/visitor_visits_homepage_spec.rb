require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'successfully' do
    visit root_path
    expect(page).to have_content('Froggy Time!')
  end
end
