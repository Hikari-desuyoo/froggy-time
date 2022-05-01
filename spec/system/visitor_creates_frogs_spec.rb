require 'rails_helper'

describe 'Visitor create frogs' do
  it 'successfully' do
    # ACT
    visit root_path
    click_on 'CADASTRAR SAPO'

    fill_in 'name', with: 'Fulano'
    fill_in 'scientific_name', with: 'sapus fulanus'
    fill_in 'cpf', with: '123.456.789-27'
    fill_in 'age', with: 50
    fill_in 'color', with: 'red'
    check 'on_sale'
    click_on 'commit'

    # ASSERT
    # TODO: LEMBRAR DE FAZER O NOTICE
    expect(page).to have_content('Fulano')
    expect(page).to have_content('sapus fulanus')
    expect(page).to have_content('123.456.789-27')
    expect(page).to have_content('50 anos')
    expect(page).to have_content('red')
    expect(page).to have_content('sim')
  end
end
