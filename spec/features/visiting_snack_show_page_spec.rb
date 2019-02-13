require 'rails_helper'

describe 'user visiting snack show page' do
  scenario 'sees all snacks name and price' do
    location = 'denver'
    location1 = 'lakewood'
    snack_name = 'chocolate'

    price = 3

    owner = Owner.create!(name: 'owner1')
    machine = Machine.create!(owner: owner, location: location)

    snack = Snack.create(name: snack_name, price: price)
    snack.machines.create!(owner: owner, location: location)
    snack.machines.create!(owner: owner, location: location1)


    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content(snack.price)

    expect(page).to have_content("#{location}(1 kinds of snacks, average price of 3)")
    expect(page).to have_content("#{location1}(1 kinds of snacks, average price of 3)")
  end
end
