FactoryBot.define do
    factory :frog do
        sequence(:name) { |n| "Mr. Sapo #{n}" }
        scientific_name { 'sapus saposopuss' }
        age { rand(200) }
        sequence(:cpf) { |n| format('%011d', n) }
        color { ['green', 'red', 'blue'].sample }
        on_sale { false }
    end
end
