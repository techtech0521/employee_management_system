class AddNotNullToUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :employee_number, false
    change_column_null :users, :name, false
    change_column_null :users, :furigana, false
    change_column_null :users, :department, false
    change_column_null :users, :phone_number, false
  end
end