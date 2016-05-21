class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :month
      t.date :payment_term
      t.date :day_of_payment
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
