require 'rails_helper'

describe 'Visitor sees available frogs' do
  it 'successfully' do
    #ARRANGE
    Frog.create!(
      name: 'Sapo saposaposapo',
      scientific_name: 'Sapo normal',
      cpf: '123.456.789-27',
      color: 'red',
      age: 23,
      on_sale: true
    )

    Frog.create!(
      name: 'Sapo saposaposapo2',
      scientific_name: 'Sapo esquisito',
      cpf: '123.456.456-27',
      color: 'green',
      age: 3,
      on_sale: false
    )

    #ACT
    visit root_path
    click_on 'Sapos disponíveis'

    #ASSERT
    expect(page).to_not have_content('Não há nenhum sapo ainda :(')
    expect(page).to have_css('.frog', count:2)
    expect(page).to have_content('Sapo saposaposapo')
    expect(page).to have_content('Sapo saposaposapo2')
    expect(page).to have_content('123.456.789-27')
    expect(page).to have_content('123.456.456-27')
  end

  it 'unless there arent any frogs' do
    #ACT
    visit root_path
    click_on 'Sapos disponíveis'

    #ASSERT
    expect(page).to have_content('Não há nenhum sapo ainda :(')
  end
end
