require 'rails_helper'

describe 'Visitor sees available frogs' do
  it 'successfully' do
    # ARRANGE
    frogs = create_list(:frog, 2)

    # ACT
    visit root_path
    click_on 'Sapos disponíveis'

    # ASSERT
    expect(page).to_not have_content('Não há nenhum sapo ainda :(')
    expect(page).to have_css('.frog', count: 2)
    frogs.each do |frog|
      expect(page).to have_content(frog.name)
      expect(page).to have_content(frog.cpf)
      expect(page).to have_content(frog.scientific_name)
      expect(page).to have_content(frog.color)
    end

  end

  it 'unless there arent any frogs' do
    # ACT
    visit root_path
    click_on 'Sapos disponíveis'

    # ASSERT
    expect(page).to have_content('Não há nenhum sapo ainda :(')
  end
end
