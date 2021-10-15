class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :code
      t.date :start_date
      t.date :end_date
      t.references :guest, null: false, foreign_key: true
      t.string :currency
      t.integer :nights
      t.integer :number_of_guests
      t.integer :status
      t.decimal :total_paid_amount
      t.integer :adults
      t.integer :children
      t.integer :infants
      t.decimal :payout_amount
      t.decimal :security_amount
      t.decimal :total_amount

      t.timestamps
    end
  end
end
