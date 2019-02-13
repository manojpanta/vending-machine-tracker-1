require 'rails_helper'

describe Snack, type: :model do
  describe 'validations' do
    it { should have_many :machine_snacks }
    it { should have_many :machines}
  end
end
