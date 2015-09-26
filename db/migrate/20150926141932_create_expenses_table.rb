class CreateExpensesTable < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :expenses do |t|
      t.date :expense_date
      t.string :payee
      t.integer :expense_type_id
      t.string :description
      t.decimal :amount, precision: 9, scale: 2

      t.timestamps null: false

      t.foreign_key :expense_types
      t.index :expense_date
      t.index :expense_type_id
    end
  end
end