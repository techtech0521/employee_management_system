class AddColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :administrator_flag, :boolean, default: false
    add_column :users, :employee_number, :string
    add_column :users, :name, :string
    add_column :users, :furigana, :string
    add_column :users, :department, :string
    add_column :users, :phone_number, :string
  end
end
