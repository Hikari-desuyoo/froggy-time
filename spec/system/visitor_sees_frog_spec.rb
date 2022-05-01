require 'rails_helper'

describe 'Visitor sees frog' do
  it 'successfully with its average age info' do
    # ARRANGE
    Frog.create!(
      name: 'Sapo saposaposapo',
      scientific_name: 'Sapo normal',
      cpf: '123.456.789-27',
      color: 'red',
      age: 23,
      on_sale: true
    )
    target_frog = Frog.create!(
      name: 'Sapo saposaposapo',
      scientific_name: 'Sapo normal',
      cpf: '123.456.789-27',
      color: 'red',
      age: 56,
      on_sale: true
    )
    Frog.create!(
      name: 'Sapo saposaposapo',
      scientific_name: 'Sapo normal',
      cpf: '123.456.789-27',
      color: 'red',
      age: 45,
      on_sale: true
    )
    # ACT
    visit frog_path(target_frog)

    # ASSERT
    expect(page).to have_content('Essa idade está: Acima da média geral dos sapos')
  end

  it 'successfully' do
    # ARRANGE
    Frog.create!(
      name: 'Sapo saposaposapo',
      scientific_name: 'Sapo normal',
      cpf: '123.456.789-27',
      color: 'red',
      age: 23,
      on_sale: true
    )

    # ACT
    visit root_path
    click_on 'Sapos disponíveis'
    click_on 'Sapo saposaposapo'

    # ASSERT
    expect(page).to have_content('Sapo saposaposapo')
    expect(page).to have_content('Sapo normal')
    expect(page).to have_content('123.456.789-27')
    expect(page).to have_content('23 anos')
    expect(page).to have_content('red')
    expect(page).to have_content('sim')
  end
end
