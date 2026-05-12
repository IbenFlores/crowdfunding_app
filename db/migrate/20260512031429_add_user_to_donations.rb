class AddUserToDonations < ActiveRecord::Migration[8.1]
  def change
    add_reference :donations, :user, null: false, foreign_key: true
  end
end
