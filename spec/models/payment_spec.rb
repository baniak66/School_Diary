require 'rails_helper'

RSpec.describe Payment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :month }
    it { is_expected.to validate_presence_of :payment_term }
  end

  describe 'database columns' do
    it { should have_db_column :month }
    it { should have_db_column :payment_term }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
