require 'rails_helper'

describe 'user visiting machine show page' do
  scenario 'can see name and price of all the snacks' do
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
end
