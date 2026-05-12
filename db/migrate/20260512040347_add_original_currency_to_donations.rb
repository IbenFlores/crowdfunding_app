class AddOriginalCurrencyToDonations < ActiveRecord::Migration[8.1]
  def change
    add_column :donations, :original_currency, :string
    add_column :donations, :original_amount, :decimal
  end
end
