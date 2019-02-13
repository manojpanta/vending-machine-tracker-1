require 'rails_helper'

describe 'user visiting machine show page' do
  it 'can see name and price of all the snacks' do
    location = 'denver'
    snack_name ='chocolate'
    price = 4
    owner = Owner.create!(name: 'owner1')
    machine = Machine.create!(owner: owner, location: location)
    machine.snacks.create!(name: snack_name, price: price)

    visit machine_path(machine)

    expect(page).to have_content(snack_name)
    expect(page).to have_content(price)
  end

  it 'shows average price for snacks' do
    location = 'denver'
    snack_name ='chocolate'
    snack_name1 ='chocolate1'
    price1 = 2
    price2 = 4

    average_price = "Average price:#{(price1 + price2 )/2}"

    owner = Owner.create!(name: 'owner1')
    machine = Machine.create!(owner: owner, location: location)

    machine.snacks.create!(name: snack_name, price: price1)
    machine.snacks.create!(name: snack_name1, price: price2)

    visit machine_path(machine)

    expect(page).to have_content(average_price)
  end
end
