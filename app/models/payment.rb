class Payment < ActiveRecord::Base
  belongs_to :student

  validates :month, :payment_term, presence: true
end
