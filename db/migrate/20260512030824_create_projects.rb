class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.decimal :goal_amount
      t.decimal :current_amount
      t.string :base_currency

      t.timestamps
    end
  end
end
