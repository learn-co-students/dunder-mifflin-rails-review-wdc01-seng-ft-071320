class RemoveDogFromEmployees < ActiveRecord::Migration[5.1]
  def change
    remove_column :employees, :dog, :integer
  end
end
