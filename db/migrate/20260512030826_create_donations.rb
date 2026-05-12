class CreateDonations < ActiveRecord::Migration[8.1]
  def change
    create_table :donations do |t|
      t.references :project, null: false, foreign_key: true
      t.decimal :amount
      t.string :donor_email
      t.string :transaction_code

      t.timestamps
    end
  end
end
