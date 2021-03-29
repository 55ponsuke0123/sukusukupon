class RemoveColumnsToBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :reason, :integer
    remove_column :books, :period, :integer
  end
end
