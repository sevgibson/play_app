class RenamePayeeColumn < ActiveRecord::Migration
  def change
    add_column :expenses, :purpose, :string
    add_column :expenses, :memo, :string
    execute "update expenses set purpose = payee;"
    execute "update expenses set memo = description;"
    remove_column :expenses, :payee
    remove_column :expenses, :description
  end
end