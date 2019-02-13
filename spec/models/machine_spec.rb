require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  
  describe 'validations' do
    it { should have_many :machine_snacks }
    it { should have_many :snacks}
  end
end
